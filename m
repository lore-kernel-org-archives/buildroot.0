Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C16C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 21:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7235340223;
	Tue, 22 Feb 2022 21:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3II7dKA7BeV; Tue, 22 Feb 2022 21:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38CA040207;
	Tue, 22 Feb 2022 21:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DB701BF39A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6571C60674
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcj46Ce2-vUZ for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 21:49:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7588260671
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 21:49:43 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout06.t-online.de (Postfix) with SMTP id 0F325B9AB
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 22:49:41 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.196.238]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nMd2K-4RjvcX0; Tue, 22 Feb 2022 22:49:32 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:58118)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nMd2J-000367-VM
 for buildroot@buildroot.org; Tue, 22 Feb 2022 22:49:32 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 22:49:31 +0100
Message-Id: <20220222214931.447344-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645566572-00001C4D-E06A4977/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bd84f89-a8bf-419b-9e45-c59ac98bce13
Subject: [Buildroot] [PATCH/next 1/1] Revert "heimdal: disable parallel make"
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

This reverts commit f6980126f26c63421d04a32b6710d9e3a380476a.

Parallel make was disabled back in 2017:
https://git.buildroot.net/buildroot/commit/?id=f6980126f26c63421d04a32b6710d9e3a380476a

Build-test with -j99 was successful.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/heimdal/heimdal.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index ce509c7afa..a8d87531ec 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,7 +8,6 @@ HEIMDAL_VERSION = 7.7.0
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
-HEIMDAL_MAKE = $(MAKE1)
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
