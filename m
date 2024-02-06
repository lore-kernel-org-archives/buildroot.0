Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230FBC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A18612CE;
	Tue,  6 Feb 2024 16:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A18612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Udo6fy6b4Gt; Tue,  6 Feb 2024 16:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0064161042;
	Tue,  6 Feb 2024 16:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0064161042
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66FBE1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B9E42037
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B9E42037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGJzLXGaAMtt for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EC3942010
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC3942010
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2947487177; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:57:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99186e42f0243c33666a188c6a1e2bead50e8b97
X-Git-Newrev: 7befbaaea74ff282b4b8ec5b3c3ad52be0d99937
X-Patchwork-Hint: ignore
Message-Id: <20240206165731.2947487177@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-bare-metal-buildroot:
 new toolchain
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3435631041592902664=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3435631041592902664==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7befbaaea74ff282b4b8ec5b3c3ad52be0d99937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new virtual package for adding a bare-metal
toolchain to Buildroot. For now, it depends on nothing, so it will not
actually build anything, but it defines some options that will be
needed by the various packages that will be part of this toolchain
build process.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                   |  4 ++++
 toolchain/Config.in                                          | 10 ++++++++++
 toolchain/toolchain-bare-metal-buildroot/Config.in           |  9 +++++++++
 .../toolchain-bare-metal-buildroot.mk                        | 12 ++++++++++++
 utils/checksymbolslib/br.py                                  |  3 +++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 94952f72a8..5cc4d37aef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,9 @@ F:	package/mrp/
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
+N:	Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
+F:	toolchain/toolchain-bare-metal-buildroot/
+
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
 
@@ -2268,6 +2271,7 @@ F:	configs/zynqmp_zcu104_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
+F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 34e0ae2c5f..64a07f91dc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -923,4 +923,14 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_POWERPC_CPU_HAS_VSX
 
+comment "Bare metal toolchain"
+
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	bool "Build a bare metal toolchain"
+	help
+	  Select if you need a bare-metal toolchain for building
+	  platform specific firmware images.
+
+source "toolchain/toolchain-bare-metal-buildroot/Config.in"
+
 endmenu
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
new file mode 100644
index 0000000000..3c99c7e1b5
--- /dev/null
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
+	string "architecture tuple"
+	help
+	  This option allows to define the architecture tuple for the
+	  bare-metal toolchain.
+
+endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
new file mode 100644
index 0000000000..4dc36ef3f3
--- /dev/null
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-bare-metal-buildroot
+#
+################################################################################
+
+TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES =
+TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
+TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
+TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+$(eval $(virtual-package))
diff --git a/utils/checksymbolslib/br.py b/utils/checksymbolslib/br.py
index 846a609829..f9dc336e64 100644
--- a/utils/checksymbolslib/br.py
+++ b/utils/checksymbolslib/br.py
@@ -36,11 +36,14 @@ symbols_defined_only_for_barebox_variant = [
 ]
 # toolchain/toolchain/toolchain.mk
 # toolchain/toolchain-buildroot/toolchain-buildroot.mk
+# toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
 symbols_not_defined_for_fake_virtual_packages = [
     'BR2_PACKAGE_HAS_TOOLCHAIN',
     'BR2_PACKAGE_HAS_TOOLCHAIN_BUILDROOT',
+    'BR2_PACKAGE_HAS_TOOLCHAIN_BARE_METAL_BUILDROOT',
     'BR2_PACKAGE_PROVIDES_TOOLCHAIN',
     'BR2_PACKAGE_PROVIDES_TOOLCHAIN_BUILDROOT',
+    'BR2_PACKAGE_PROVIDES_TOOLCHAIN_BARE_METAL_BUILDROOT',
 ]
 # fs/common.mk
 suffixes_not_defined_for_all_rootfs_types = [

--===============3435631041592902664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3435631041592902664==--
