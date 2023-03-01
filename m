Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F4EC7EE23
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACF260B15;
	Wed,  1 Mar 2023 20:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ACF260B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J98yfrn37OFg; Wed,  1 Mar 2023 20:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2A060E97;
	Wed,  1 Mar 2023 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2A060E97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1EFF1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C8C340650
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8C340650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zx7xOuambzyA for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 20:50:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B571540A1E
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 20:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B571540A1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A447A86E4B; Wed,  1 Mar 2023 20:50:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Mar 2023 21:49:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 160d949f05137dcf280c20efeca6d832f034c5bb
X-Git-Newrev: 6fbe4b39017b0f05b70d6541ea7df4cd8cf59d0a
X-Patchwork-Hint: ignore
Message-Id: <20230301205003.A447A86E4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fbe4b39017b0f05b70d6541ea7df4cd8cf59d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c0e144755d..3ffae0f7cc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2022.02.10, released March 1st, 2023
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
+	elf2flt, freeswitch, fwts, gcc, git, kodi, libgit2, libks,
+	libopenssl, live555, lua, lxc, mesa3d-headers, modsecurity2,
+	netopeer2, openjdk, openpowerlink, openvpn, opusfile,
+	postgresql, pugixml, python-future, qt5, sdl2, sofia-sip,
+	ssdp-responder, sudo, sunxi-mali-utgard, ti-sgx-km, tmux,
+	uboot, upx, vim, webkitgtk, wolfssl, wpewebkit, xlib_libXpm,
+	xserver_xorg-server, xxhash, xz, yajl, zabbix
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15271: no start-qemu.sh
+	#15291: BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS without location
+	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
+
 2022.02.9, released January 18th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 3828cf26ed..a7ed8e5a80 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.9
+export BR2_VERSION := 2022.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1674038000
+BR2_VERSION_EPOCH = 1677703000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index a96b91ea40..bd48f6e600 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.9'
+RELEASE='2022.02.10'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
