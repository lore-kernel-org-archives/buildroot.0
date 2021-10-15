Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC64FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8804E61056
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8804E61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAFD60EF7;
	Fri, 15 Oct 2021 20:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viwvLq3LoQpR; Fri, 15 Oct 2021 20:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C91160EEA;
	Fri, 15 Oct 2021 20:48:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5441BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57F8140806
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBH-qYR-HI7Z for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4DB40835
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:47:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D2EEF95C14; Fri, 15 Oct 2021 20:44:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:45:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf381c19932d0c9f27165e711f5899b3de44876
X-Git-Newrev: 21d2a0c2ecfdddb250007ce75d1839ba81278e5b
X-Patchwork-Hint: ignore
Message-Id: <20211015204457.D2EEF95C14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firmware-utils: add package
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
Content-Type: multipart/mixed; boundary="===============4839358097584563172=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4839358097584563172==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=21d2a0c2ecfdddb250007ce75d1839ba81278e5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a set of tools originally developed for the
OpenWrt project. They allow working with various firmware formats that
are required for flashing new images on embedded devices.

One of tools (mkhilinkfw) depends on OpenSSL and doesn't support any
other SSL library (like wolfSSL) directly. It can be used with wolfSSL
using its compatibility layer though.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
[Arnout: add comment about missing license files]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/Config.in.host                     |  1 +
 package/firmware-utils/Config.in           | 15 ++++++++++++
 package/firmware-utils/Config.in.host      | 12 +++++++++
 package/firmware-utils/firmware-utils.hash |  2 ++
 package/firmware-utils/firmware-utils.mk   | 39 ++++++++++++++++++++++++++++++
 7 files changed, 73 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f6c39516b5..19f6d95270 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2260,6 +2260,9 @@ N:	Rafal Susz <rafal.susz@gmail.com>
 F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
 
+N:	Rafał Miłecki <rafal@milecki.pl>
+F:	package/firmware-utils/
+
 N:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
 F:	package/cxxtest/
 F:	package/gflags/
diff --git a/package/Config.in b/package/Config.in
index 7971726875..48f365d773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -213,6 +213,7 @@ menu "Filesystem and flash utilities"
 	source "package/exfat-utils/Config.in"
 	source "package/exfatprogs/Config.in"
 	source "package/f2fs-tools/Config.in"
+	source "package/firmware-utils/Config.in"
 	source "package/flashbench/Config.in"
 	source "package/fscryptctl/Config.in"
 	source "package/fuse-overlayfs/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index a0ec9bc1ab..6e5a5c5fc5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -28,6 +28,7 @@ menu "Host utilities"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fatcat/Config.in.host"
+	source "package/firmware-utils/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
new file mode 100644
index 0000000000..9e47263d73
--- /dev/null
+++ b/package/firmware-utils/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FIRMWARE_UTILS
+	bool "firmware-utils"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Firmware utils are tools that can be used for managing
+	  platform / device / vendor specific firmware images. Depending
+	  on a specific tool it may be possible to read information,
+	  extract data, modify or build an image from a scratch.
+
+	  A common target usage of firmware utils is to upgrade kernel
+	  and / or rootfs. Depending on device it may be required to
+	  extract a part of firmware image and flash it.
+
+	  https://git.openwrt.org/?p=project/firmware-utils.git;a=summary
diff --git a/package/firmware-utils/Config.in.host b/package/firmware-utils/Config.in.host
new file mode 100644
index 0000000000..4aaec05001
--- /dev/null
+++ b/package/firmware-utils/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_FIRMWARE_UTILS
+	bool "host firmware-utils"
+	help
+	  Firmware utils are tools that can be used for managing
+	  platform / device / vendor specific firmware images. Depending
+	  on a specific tool it may be possible to read information,
+	  extract data, modify or build an image from a scratch.
+
+	  A common host usage of firmware utils is to build a bootloader
+	  supported image.
+
+	  https://git.openwrt.org/?p=project/firmware-utils.git;a=summary
diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
new file mode 100644
index 0000000000..152b0753c1
--- /dev/null
+++ b/package/firmware-utils/firmware-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  57b95dac6b011f4c773d6e661f7eb5b2c992079901f87610d1ed16aaacb22542  firmware-utils-2f70fedc92bd08f9e182fcc388688f36310a597d-br1.tar.gz
diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
new file mode 100644
index 0000000000..93f56dbb36
--- /dev/null
+++ b/package/firmware-utils/firmware-utils.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# firmware-utils
+#
+################################################################################
+
+FIRMWARE_UTILS_VERSION = 2f70fedc92bd08f9e182fcc388688f36310a597d
+FIRMWARE_UTILS_SITE = git://git.openwrt.org/project/firmware-utils.git
+FIRMWARE_UTILS_LICENSE = \
+	BSD-2-Clause (tplink-safeloader), \
+	BSD-3-Clause (seama), \
+	GPL-2.0 (add_header, bcmalgo, buffalo-enc, buffalo-lib, buffalo-tag, \
+		 buffalo-tftp, dgfirmware, dns313-header, edimax_fw_header, \
+		 fix-u-media-header, hcsmakeimage, mkbrncmdline, mkbrnimg, \
+		 mkbuffaloimg, mkcameofw, mkcasfw, mkdapimg, mkdapimg2, \
+		 mkdhpimg, mkdniimg, mkhilinkfw, mkmerakifw-old, mkmerakifw, \
+		 mkplanexfw, mkporayfw, mkrasimage, mkrtn56uimg, mksenaofw, \
+		 mksercommfw, mktitanimg, mktplinkfw-lib, mktplinkfw, \
+		 mktplinkfw2, mkwrggimg, mkwrgimg, mkzcfw, mkzynfw, \
+		 mkzyxelzldfw osbridge-crc, pc1crypt, srec2bin, trx2edips, \
+		 uimage_padhdr, wrt400n, zyimage, zytrx), \
+	GPL-2.0+ (addpattern, asustrx, bcm4908asus, bcm4908kernel, dgn3500sum, \
+		  encode_crc, jcgimage, lzma2eva, makeamitbin, mkchkimg, \
+		  mkcsysimg, mkdlinkfw-lib, mkdlinkfw, mkedimaximg, mkfwimage, \
+		  mkfwimage2, mkheader_gemtek, mkmylofw, motorola-bin, \
+		  nec-enc, oseama, otrx, ptgen, sign_dlink_ru, spw303v, trx, \
+		  uimage_sgehdr, xiaomifw, xorimage, zyxbcm), \
+	GPL-2.0 OR GPL-3.0 (nand_ecc), \
+	GPL-2.0+ OR MIT (lxlfw), \
+	UNKNOWN (imagetag, trx2usr)
+# No explicit license file. We could use the source files, but that would mean
+# we need to use all of them. If we need to do that, we can just as well leave
+# it to the integrator to get them from the sources
+
+FIRMWARE_UTILS_DEPENDENCIES = openssl zlib
+HOST_FIRMWARE_UTILS_DEPENDENCIES = host-openssl host-zlib
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))

--===============4839358097584563172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4839358097584563172==--
