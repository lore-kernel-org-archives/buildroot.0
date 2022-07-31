Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B39C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995BD60E83;
	Sun, 31 Jul 2022 11:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 995BD60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drwXpwuHZ-zI; Sun, 31 Jul 2022 11:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BDC60E42;
	Sun, 31 Jul 2022 11:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8BDC60E42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 250561BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B9341529
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B9341529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYCqFJZXColp for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:46:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B5241528
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2B5241528
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:46:13 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout06.t-online.de (Postfix) with SMTP id 79B051C217
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 13:46:11 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oI7OZ-0V3hUv0; Sun, 31 Jul 2022 13:46:07 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50742)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oI7OZ-00072Y-09
 for buildroot@buildroot.org; Sun, 31 Jul 2022 13:46:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 13:46:07 +0200
Message-Id: <20220731114607.94029-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659267967-01452C5E-F6616805/0/0 CLEAN NORMAL
X-TOI-MSGID: e5577a30-07c0-48c9-8efb-55dadb4820cb
Subject: [Buildroot] [PATCH 1/1] package/tor: ignore various CVEs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 0e4bb553e2..b69c95e8e6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -9,6 +9,10 @@ TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
 TOR_CPE_ID_VENDOR = torproject
+# only Windows affected
+TOR_IGNORE_CVES += CVE-2016-9079
+# only Tor Browser is affected, not tor
+TOR_IGNORE_CVES += CVE-2017-16541
 TOR_SELINUX_MODULES = tor
 TOR_DEPENDENCIES = libevent openssl zlib
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
