Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F97C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCCF8143D;
	Fri,  1 Mar 2024 13:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbCtejx7Df9q; Fri,  1 Mar 2024 13:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D2681521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D2681521;
	Fri,  1 Mar 2024 13:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9D31BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F8460771
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcCavRvErmwx for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A697605DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A697605DC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7170D87ED3; Fri,  1 Mar 2024 13:45:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 14:42:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64dbf7ff6a19acec1fa3a31853291ecd739a45b3
X-Git-Newrev: 880e3ea32c9ed491d5c0fe0e6d4a97640311216d
X-Patchwork-Hint: ignore
Message-Id: <20240301134514.7170D87ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=880e3ea32c9ed491d5c0fe0e6d4a97640311216d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f05246df4f864489451576a194e38a8679c7f5da)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 33 +++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 3abd4b2281..c029569a8d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -57,6 +57,39 @@
 	#15910: USB keyboard is not working by default "raspberrypicm4io_..
 	#15952: Grub fails to load large rootfs files
 
+2023.11.2, released March 1st, 2024
+
+	Important / security related fixes.
+
+	Added CPE identifiers for a large number of packages.
+
+	Updated/fixed packages: bayer2rgb-neon, brltty, c-ares, cog,
+	containerd, cpio, crda, criu, darkhttpd, davinci-bootcount,
+	dbus, depot-tools, dhcpcd, domoticz, environment-setup, expat,
+	faad2, falcosecurity-libs, flex, flutter-engine,
+	flutter-gallery, flutter-pi, flutter-sdk-bin,
+	freeradius-server, freerdp, frr, gesftpserver, glibc, gnutls,
+	go, gst1-devtools, gst1-libav, gst1-python, gst1-vaapi,
+	gst-omx, gstreamer1, haproxy, hiredis, joe, json-c, leptonica,
+	libcurl, libp11, libuwsc, libvips, libzenoh-pico,
+	linux-firmware, linux-headers, localedef, lua-http, lvm2,
+	lynx, mbedtls, micropython, minizip, mpfr, netatalk, ngrep,
+	onevpl, opencv4, opencv4-contrib, openssh, opus, petitboot,
+	php, python-aiohttp, python-bitarray, python-bitstring,
+	python-esptool, python-gunicorn, python-hpack,
+	python-html5lib, python-lmdb, python-mako, python-numpy,
+	python-oauthlib, python-sqlparse, python-wheel, qt5base,
+	qt6base, redis, runc, sdl2, sqlite, syslog-ng, sysstat,
+	util-linux, vulkan-loader, webkitgtk, weston, wireless-regdb,
+	wlroots, wpewebkit, xlib_libXpm, xterm, xwayland, yasm
+
+	New packages: python-bitarray
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10096: SH4 toolchain does not build Linux kernel magicpa..
+	#15952: Grub fails to load large rootfs files
+
 2023.11.1, released January 15th, 2024
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 64c479b693..ba06c5f5fd 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.11.1'
+RELEASE='2023.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
