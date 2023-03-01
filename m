Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612B4C64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4B581E83;
	Wed,  1 Mar 2023 16:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4B581E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JPOHUbaxDB7; Wed,  1 Mar 2023 16:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5FB81BC5;
	Wed,  1 Mar 2023 16:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5FB81BC5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE0C1BF378
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5DAD81BC5
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DAD81BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGZ41FvjxP-c for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:01:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD05E81970
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD05E81970
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 995C886E13; Wed,  1 Mar 2023 16:01:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Mar 2023 17:01:34 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4621c597416b75ca60f9b61270dca5fe26181652
X-Git-Newrev: 71ddf1a0848e7b17c220b759ffae30ea2b13e1a8
X-Patchwork-Hint: ignore
Message-Id: <20230301160159.995C886E13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Update for 2022.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=71ddf1a0848e7b17c220b759ffae30ea2b13e1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index d8507a5a25..247c8c7233 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2022.11.2, released March 1st, 2023
+
+	Important / security related fixes.
+
+	Fix make O=..._defconfig builds (regression in 2022.11.1).
+
+	A number of additional/stricter checks have been added to
+	./utils/check-package.
+
+	Build host dependencies check extended to check for a number
+	of specific perl modules to better handle distributions (like
+	Fedora) with very fine grained perl packages. Also ensure
+	build host has git >= 2.0.0 when using packages written in
+	go/rust because the vendoring may need it.
+
+	Defconfigs: ASUS tinker rk3288: Fix boot issue related to TPL
+
+	Updated/fixed packages: afboot-stm32, apache, barebox, c-ares,
+	elf2flt, freeswitch, fwts, gcc, gdal, git, gitlab-runner,
+	ipmitool, kodi, libgit2, libks, libopenssl, libressl, live555,
+	lua, lxc, mariadb, mesa3d-headers, modsecurity2, mongoose,
+	netopeer2, nodejs, openjdk, openpowerlink, openvpn, opusfile,
+	postgresql, proftpd, pugixml, python-future, python-idna, qt5,
+	rtl8192eu, rtl8723ds, sdl2, sofia-sip, ssdp-responder, sudo,
+	sunxi-mali-utgard, thermald, ti-sgx-km, tmux, uboot, upx, vim,
+	webkitgtk, wolfssl, wpewebkit, xlib_libXpm,
+	xserver_xorg-server, xxhash, xz, yajl, zabbix
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15271: no start-qemu.sh
+	#15281: Error compiling GDAL library for RPi-64 if libgdal-dev install..
+	#15291: BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS without location
+	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
+	#15331: Warning on python-flit-core license when generating legal info
+
 2022.11.1, released January 18th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 804ae58689..76faedb95e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.11.1
+export BR2_VERSION := 2022.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1674028000
+BR2_VERSION_EPOCH = 1677686000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 9eee9955ec..63806155a8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.11.1'
+RELEASE='2022.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
