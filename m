Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D81FEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 14:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CF060F8B;
	Fri, 16 Jun 2023 14:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93CF060F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzGULr3r3M1s; Fri, 16 Jun 2023 14:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A706B614AD;
	Fri, 16 Jun 2023 14:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A706B614AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7CFF1BF357
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 14:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B5F60F83
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 14:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1B5F60F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ82W1i3yvCp for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 14:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 641B060C2A
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 14:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 641B060C2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5146D83AA6; Fri, 16 Jun 2023 14:04:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 15:54:53 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 837561824e954a6cd28fd4274de14f7179018841
X-Git-Newrev: c92cc8796ed951f0604e9272677a9cdfcd93680f
X-Patchwork-Hint: ignore
Message-Id: <20230616140439.5146D83AA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c92cc8796ed951f0604e9272677a9cdfcd93680f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 40 ++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 55dcc830de..3b2199f447 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,43 @@
+2023.02.2, released June 16th, 2023
+
+	Important / security related fixes.
+
+	Infrastructure: Add BR2_HOST_CMAKE_AT_LEAST_* for packages
+	needing a newer host-cmake than what is currently enforced
+	(3.18) - Up to the version provided by the cmake package (3.22).
+
+	utils/docker-run: Now correctly handles git
+	workdirs/worktrees.
+
+	Defconfigs: QEMU s390x: Bump rootfs size to make room for
+	kernel modules, Stm32f4xx: Tweak config to save RAM, Xilinx
+	Versal vck190: Use correct (A72) CPU variant
+
+	Updated/fixed packages: atkmm, bird, busybox, cairomm1_14,
+	cmake, containerd, crudini, cups, delve, docker-cli,
+	docker-engine, earlyoom, edid-decode, fluent-bit, freeswitch,
+	gcc, gdb, glibmm_2_66, gnupg2, go, gptfdisk, graphicsmagick,
+	intel-microcode, libass, libcurl, libdeflate, libgeos,
+	libgtk3, libjxl, libnftl, libopenssl, libressl, libssh, llvm,
+	lua, mesa3d, micropython, minidlna, moby-buildkit, mpd, mupdf,
+	ncurses, nftables, openjdk, openjdk-bin, php, postgresql,
+	python-can, python-django, python-django, python-ipython,
+	python-matplotlib, python-mupdf, python-requests, python3,
+	qemu, redis, rpm, runc, sdl2_mixer, tzdata, uclibc, vdr,
+	wilc-firmware, xapp_xcalc, xapp_xdpyinfo, xapp_xinput,
+	xapp_xwininfo, xdata_xbitmaps, xdata_xcursor-themes,
+	xdriver_xf86-input-mouse, xdriver_xf86-video-ark,
+	xdriver_xf86-video-geode, xdriver_xf86-video-neomagic,
+	xfont_encodings, xlib_libX11, xlib_libXaw, xlib_libXi,
+	xlib_libXfixes, xlib_libXft, xlib_libXpm, zfs, znc
+
+	New packages: perl-clone, perl-http-message, python-asttokens,
+	python-executing, python-pure-eval, python-stack-data
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15421: qemu_aarch64_ebbr_defconfig: Missing Linux kernel source code
+
 2023.02.1, released May 9th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 000f1dcec0..7fcd9e6bcb 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.1
+export BR2_VERSION := 2023.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1683664000
+BR2_VERSION_EPOCH = 1686923000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index d1b75ed405..5bc7a2c012 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.1'
+RELEASE='2023.02.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
