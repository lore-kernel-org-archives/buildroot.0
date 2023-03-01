Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07505C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 467DA60FB6;
	Wed,  1 Mar 2023 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 467DA60FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kg3-rF_wlrqL; Wed,  1 Mar 2023 20:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6042260E7F;
	Wed,  1 Mar 2023 20:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6042260E7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81F431BF4DD
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6943281E86
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 20:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6943281E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C58jtPjdUJGO for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 20:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D62081E47
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 20:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D62081E47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19CFB86E3F; Wed,  1 Mar 2023 20:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Mar 2023 21:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26344644eebca5cde9b02be849d29e38d5885741
X-Git-Newrev: 4be361ada540af523e76ce8e9330d034a7a11a26
X-Patchwork-Hint: ignore
Message-Id: <20230301202724.19CFB86E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4be361ada540af523e76ce8e9330d034a7a11a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 71ddf1a0848e7b17c220b759ffae30ea2b13e1a8)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 04b49a94cb..6647c0c8e6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -103,6 +103,42 @@
 	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
 	#15331: Warning on python-flit-core license when generating legal info
 
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
