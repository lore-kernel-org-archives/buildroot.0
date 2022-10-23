Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5EEECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4934D40399;
	Sun, 23 Oct 2022 17:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4934D40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUoNrQ6LbsLX; Sun, 23 Oct 2022 17:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E8954038B;
	Sun, 23 Oct 2022 17:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8954038B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66CB41BF470
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B176F40339
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B176F40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0Fd0kx8gNAL for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCCF40363
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFCCF40363
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4CF86EC9; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 19:21:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a380244766342aa7172dc7b572c99db322f74c38
X-Git-Newrev: 08a0dea25f4e92ac5aa474876f706ddb9452fe2b
X-Patchwork-Hint: ignore
Message-Id: <20221023172606.AE4CF86EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: add bootgen host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=08a0dea25f4e92ac5aa474876f706ddb9452fe2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds Xilinx bootgen as a host package to buildroot.
bootgen is a required utility for generating a boot.bin for
Xilinx versal products.

In addition, for developers who wish to use secure boot with
Xilinx SoC products such as zynq and zynqmp, bootgen has a
more complete offering in secure boot features than the u-boot
mkimage utility.

https://github.com/Xilinx/bootgen

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/bootgen/Config.in.host | 10 ++++++++++
 package/bootgen/bootgen.hash   |  3 +++
 package/bootgen/bootgen.mk     | 25 +++++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..c8183b2290 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2175,6 +2175,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
+F:	package/bootgen
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in.host b/package/Config.in.host
index d6b9ee0e2d..8ccbf40a84 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
+	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
new file mode 100644
index 0000000000..0acb58dee0
--- /dev/null
+++ b/package/bootgen/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_BOOTGEN
+	bool "host bootgen"
+	help
+	  bootgen is a tool to generate a boot.bin firmware
+	  for Xilinx versal, zynqmp and zynq product families.
+
+	  Additional secure boot features are supported beyond
+	  what is included with u-boot mkimage.
+
+	  https://github.com/Xilinx/bootgen
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
new file mode 100644
index 0000000000..5d77c164f3
--- /dev/null
+++ b/package/bootgen/bootgen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
new file mode 100644
index 0000000000..88bc73b604
--- /dev/null
+++ b/package/bootgen/bootgen.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# bootgen
+#
+################################################################################
+
+BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
+HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
+BOOTGEN_LICENSE = Apache-2.0
+BOOTGEN_LICENSE_FILES = LICENSE
+
+define HOST_BOOTGEN_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) \
+		LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
+		INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
+		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x" \
+		-C $(@D)
+endef
+
+define HOST_BOOTGEN_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
