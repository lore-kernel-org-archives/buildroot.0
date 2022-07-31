Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D7C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4B7417CA;
	Sun, 31 Jul 2022 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4B7417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AkliEzROcDO; Sun, 31 Jul 2022 11:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338F34160F;
	Sun, 31 Jul 2022 11:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338F34160F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 263CB1BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0197782864
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0197782864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GczuxgTnPD4B for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:25:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04AF182862
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04AF182862
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:25:46 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout06.t-online.de (Postfix) with SMTP id 2BBCD6F9F
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 13:25:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oI74p-0hRAzx0; Sun, 31 Jul 2022 13:25:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60784)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oI74o-0003Qe-2I
 for buildroot@buildroot.org; Sun, 31 Jul 2022 13:25:42 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 13:25:41 +0200
Message-Id: <20220731112542.92591-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659266743-01447895-D7361D90/0/0 CLEAN NORMAL
X-TOI-MSGID: 129d24bb-d1d7-4ca7-a6cb-28ac7aa6327b
Subject: [Buildroot] [PATCH 1/2] package/clamav: ignore CVE-2016-1405
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
 package/clamav/clamav.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 10856ed971..bb95cb8d2b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -12,6 +12,8 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.unrar COPYING.zlib
 CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_SELINUX_MODULES = clamav
+# affects only Cisco devices
+CLAMAV_IGNORE_CVES += CVE-2016-1405
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
