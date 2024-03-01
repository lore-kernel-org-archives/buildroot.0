Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922CDC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 16:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DCE61781;
	Fri,  1 Mar 2024 16:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xisAhQJ6ohMm; Fri,  1 Mar 2024 16:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3700B61789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3700B61789;
	Fri,  1 Mar 2024 16:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9D191BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 16:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D665061789
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 16:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Vb1257rj7Gt for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 16:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC67E61781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC67E61781
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 16:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A763F87EE2; Fri,  1 Mar 2024 16:45:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 17:45:29 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7dac066fc3f263b3c2031e5235a7ed0f6a6472fb
X-Git-Newrev: 10d272ec99344e3e3d95dce92734de7eee9fdef1
X-Patchwork-Hint: ignore
Message-Id: <20240301164555.A763F87EE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10d272ec99344e3e3d95dce92734de7eee9fdef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 27 +++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 38b1af8d0c..f0f42184cd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,30 @@
+2023.02.10, released March 1st, 2024
+
+	Important / security related fixes.
+
+	Added CPE identifiers for a large number of packages.
+
+	Updated/fixed packages: bayer2rgb-neon, brltty, c-ares,
+	containerd, crda, darkhttpd, davinci-bootcount, dbus,
+	domoticz, environment-setup, expat, faad2, falcosecurity-libs,
+	flex, freeradius-server, freerdp, frr, gesftpserver, glibc,
+	gnutls, go, gst1-devtools, gst1-libav, gst1-python,
+	gst1-vaapi, gst-omx, gstreamer1, haproxy, joe, json-c,
+	leptonica, libcurl, libuwsc, libvips, linux-firmware,
+	linux-headers, localedef, lua-http, lvm2, lynx, mbedtls,
+	micropython, minizip, mpfr, netatalk, ngrep, opencv4,
+	opencv4-contrib, openssh, opus, php, python-aiohttp,
+	python-esptool, python-gunicorn, python-hpack,
+	python-html5lib, python-lmdb, python-mako, python-numpy,
+	python-oauthlib, python-sqlparse, qt5base, qt6base, redis,
+	runc, sdl2, sqlite, sysstat, uuu, webkitgtk, wireless-regdb,
+	wpewebkit, xlib_libXpm, xterm, xwayland, yasm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10096: SH4 toolchain does not build Linux kernel magicpa..
+	#15952: Grub fails to load large rootfs files
+
 2023.02.9, released January 15th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index b2183de489..5513f2c3b5 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.9
+export BR2_VERSION := 2023.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1705336000
+BR2_VERSION_EPOCH = 1709311000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index eb57b77e92..822f11efba 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.9'
+RELEASE='2023.02.10'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
