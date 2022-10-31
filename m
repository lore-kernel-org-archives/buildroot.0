Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473EDECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99CCA40522;
	Mon, 31 Oct 2022 19:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99CCA40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEizT8UmNy88; Mon, 31 Oct 2022 19:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7996840129;
	Mon, 31 Oct 2022 19:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7996840129
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA481BF3CD
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 19:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7430E408D8
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 19:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7430E408D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzUqogI7bvSt for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 19:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4150C408C1
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4150C408C1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 19:52:12 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout03.t-online.de (Postfix) with SMTP id 62F2947C;
 Mon, 31 Oct 2022 20:52:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opapJ-0L2n450; Mon, 31 Oct 2022 20:52:05 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44498)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opapJ-00025N-0o;
 Mon, 31 Oct 2022 20:52:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 20:52:03 +0100
Message-Id: <20221031195205.429257-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667245925-F3FF3ECF-CA6F080D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6852c009-a865-4d0f-811d-30f11daa9e09
Subject: [Buildroot] [PATCH v2 1/3] package/unbound: install to staging
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
Cc: Samuel Martin <s.martin49@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for Monero:
https://github.com/monero-project/monero/blob/release-v0.18/cmake/FindUnbound.cmake

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index d86d9c2067..7b62522727 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -6,6 +6,7 @@
 
 UNBOUND_VERSION = 1.17.0
 UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
 UNBOUND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
