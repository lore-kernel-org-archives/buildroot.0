Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB50C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 13:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4DE61036;
	Tue,  5 Apr 2022 13:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEJTrjX3Zdm5; Tue,  5 Apr 2022 13:30:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5DA60EA3;
	Tue,  5 Apr 2022 13:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC62E1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C1661031
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moLFq1yMD47k for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 13:29:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A05860E15
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRtzRemVfcwnueh2g0C9BBV+zCVkwiDHoOXjncpb14M=; b=ilo6j3f210TihI5uXUfm8kQDj4
 v4OJtwKm0nJHx/58abe5bIeJOY8e95AEt1kyCVbx01/0lIkCn2EDuC6mk/2wmRIZaQHsI4SJ5tXhM
 i/eoEOxJEhDFJjSewWBYj3Y1El2JLriub4cSWO8e1GwULNFPg1diDGz5FlyIjGibmdI54PJD2DZ5R
 0tEYuC7sDaeBzr9hCrN+5snyZVT5tZXKnnNCuJJhuEAPbfK7E+yu2IG+ec2hKAIXLLUZ8xDjMGgQ2
 uZz7QtbM6ANgdMrLGnnaAX2sQs4Ca4XWtWtr61tLWLpaJbua2b+bvdqRUu6liDb/KeHF/brpPTtOy
 WgqXgoDQ==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nbjFe-000BmB-8U; Tue, 05 Apr 2022 15:29:42 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 401559b9;
 Tue, 5 Apr 2022 13:29:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 16:29:28 +0300
Message-Id: <20220405132929.823106-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: bump to version 2.36.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to a new major release which brings in improvements and a few new
features. Release notes:

  https://webkitgtk.org/2022/03/21/webkitgtk2.36.0-released.html

None of the new features need additional dependencies. The build option
USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.

While at it, remove setting the ENABLE_PLUGIN_PROCESS_GTK2 option.
Support for NPAPI plug-ins has been dropped already in 2.32.x and the
option has been a no-op for a long time, see:

  https://perezdecastro.org/2020/webkitgtk-npapi-sunsetting.html
  https://webkitgtk.org/2021/03/26/webkitgtk2.32.0-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash |  8 ++++----
 package/webkitgtk/webkitgtk.mk   | 13 +++----------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 82c210c8f9..38068745ee 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.34.6.tar.xz.sums
-md5  a5eeedd02f5b4bba8bd891b92dc743d4  webkitgtk-2.34.6.tar.xz
-sha1  bb82517289baf9c858fa406d1d845274f81e25cb  webkitgtk-2.34.6.tar.xz
-sha256  6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6  webkitgtk-2.34.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.0.tar.xz.sums
+md5  1e3fe866ab6e41e7ec3deb80bd5b3a85  webkitgtk-2.36.0.tar.xz
+sha1  5b90bc59c2f442223de1a4d9dc8ff604888abb3c  webkitgtk-2.36.0.tar.xz
+sha256  b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d  webkitgtk-2.36.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 36e4b8943b..8d8f083ea2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.34.6
+WEBKITGTK_VERSION = 2.36.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -84,13 +84,6 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
-# It can use libgtk2 for npapi plugins
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=ON
-WEBKITGTK_DEPENDENCIES += libgtk2
-else
-WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=OFF
-endif
 else # !X11
 # GTK3-BROADWAY/WAYLAND needs at least EGL
 WEBKITGTK_DEPENDENCIES += libegl
@@ -115,10 +108,10 @@ WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WEBKITGTK_DEPENDENCIES += systemd
 else
-WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
 # JIT is not supported for MIPS r6, but the WebKit build system does not
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
