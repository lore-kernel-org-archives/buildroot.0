Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BB8CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE7C40E0B;
	Thu, 11 Sep 2025 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M-Ej1cGnHOW; Thu, 11 Sep 2025 19:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E037740C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E037740C09;
	Thu, 11 Sep 2025 19:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C6CC234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A31D84ADC
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNjv4EzoPwcB for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F5F84AF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F5F84AF0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54C9B84300; Thu, 11 Sep 2025 19:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:32:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52eed57d80a2c96579d785414b3b7e4055f7a6bd
X-Git-Newrev: 5f5bb69aef24f60346502421a5feba2bdd3b479b
X-Patchwork-Hint: ignore
Message-Id: <20250911193626.54C9B84300@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gkrellm: remove client,
 needs libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f5bb69aef24f60346502421a5feba2bdd3b479b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gkrellm client needs libgtk2, which we are about to drop from
Buildroot.

Even though gkrellm has a somewhat active upstream at
https://git.srcbox.net/gkrellm/gkrellm, it isn't clear whether it is
compatible with Gtk 3 or not.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Arnout: reword help text, drop legacy for BR2_PACKAGE_GKRELLM_SERVER]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy           |  7 +++++++
 package/gkrellm/Config.in  | 33 +++------------------------------
 package/gkrellm/gkrellm.mk | 12 ------------
 3 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b150e40206..2ee9533fa8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_GKRELLM_CLIENT
+	bool "gkrellm client has been removed"
+	select BR2_LEGACY
+	help
+	  The gkrellm client option has been removed, as it required
+	  libgtk2, which was removed from Buildroot.
+
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "cwiid wmgui has been removed"
 	select BR2_LEGACY
diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
index e957c058de..9e90b2810e 100644
--- a/package/gkrellm/Config.in
+++ b/package/gkrellm/Config.in
@@ -3,41 +3,14 @@ config BR2_PACKAGE_GKRELLM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  GKrellM is a single process stack of system monitors which
-	  supports applying themes to match its appearance to your
-	  window manager, Gtk, or any other theme.
+	  GKrellM is a single process stack of system monitors.
+	  This package only contains the server part. The client
+	  can run on a different machine.
 
 	  http://gkrellm.srcbox.net/
 
-if BR2_PACKAGE_GKRELLM
-
-config BR2_PACKAGE_GKRELLM_SERVER
-	bool "server"
-	help
-	  Enable gkrellm server.
-
-config BR2_PACKAGE_GKRELLM_CLIENT
-	bool "client"
-	depends on BR2_PACKAGE_XORG7 # libgtk2
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2
-	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_XLIB_LIBSM
-	help
-	  Enable gkrellm client.
-
-comment "client needs a toolchain w/ C++, gcc >= 4.8"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-endif # BR2_PACKAGE_GKRELLM
-
 comment "gkrellm needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 165b71c7c8..257ebadfc4 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -32,19 +32,7 @@ else
 GKRELLM_BUILD_OPTS += enable_nls=0
 endif
 
-ifeq ($(BR2_PACKAGE_GKRELLM_SERVER)$(BR2_PACKAGE_GKRELLM_CLIENT),yy)
-GKRELLM_BUILD_DIR = $(@D)
-else ifeq ($(BR2_PACKAGE_GKRELLM_SERVER),y)
 GKRELLM_BUILD_DIR = $(@D)/server
-else
-GKRELLM_BUILD_DIR = $(@D)/src
-endif
-
-ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
-GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
-GKRELLM_BUILD_OPTS += X11_LIBS="-lX11 -lSM -lICE"
-GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
-endif
 
 define GKRELLM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
