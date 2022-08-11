Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16794C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9996A82FAE;
	Thu, 11 Aug 2022 20:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9996A82FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYyJW_DixZqi; Thu, 11 Aug 2022 20:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7AB482F4A;
	Thu, 11 Aug 2022 20:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7AB482F4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 263571BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E45F82F4A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E45F82F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEhMo2As9ICj for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:18:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D03781457
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D03781457
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 31D9E872F3; Thu, 11 Aug 2022 20:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:18:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d8a1268a3aa621fd7a5559f6f27526c2eb04b28
X-Git-Newrev: 1c91bd258f18638748733b0071874d894166402c
X-Patchwork-Hint: ignore
Message-Id: <20220811200427.31D9E872F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: prepare for 2022.08-rc1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c91bd258f18638748733b0071874d894166402c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/CHANGES b/CHANGES
index 94b787e672..762d3a19b9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,92 @@
+2022.08-rc1, to be released
+
+	Fixes all over the tree and new features.
+
+	Architecture
+
+	- Support for NDS32 removed
+	- Support for C-SKY removed
+	- Support for configurable page size on ARM64 added
+	- Architecture menu re-organized: the MMU selection now
+	  appears in this architecture menu.
+
+	Toolchain:
+
+	- GCC 12.x support added, GCC 11.x is now the default
+	  compiler, and support for building a GCC 9.x toolchain has
+	  been removed.
+	- glibc bumped to 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
+	- uclibc bumped to 1.0.42
+	- BR2_GCC_ENABLE_LTO option removed, the toolchain is now
+	  always built with LTO support. The new option BR2_ENABLE_LTO
+	  enables the use of LTO in a subset of packages that have
+	  explicit handling for LTO.
+	- GDB enabled on OpenRISC.
+	- Toolchain menu now appears before "Build options". The
+	  selection of the C library now determines whether static
+	  library (BR2_STATIC_LIBS) will be available or not, instead
+	  of the other way around.
+
+	Filesystem:
+
+	- genimage.cfg files now use shortcuts from genimage for the
+	  GUID of well-known GPT partitions.
+
+	Bootloaders:
+
+	- U-Boot can now be built with host-gnutls as a dependency,
+	  needed for some configurations
+	- OP-TEE can now be built with host-python-pillow as a
+	  dependency, needed for some configurations.
+	- OP-TEE source can now be retrieved from a custom tarball
+	  URL.
+	- Grub has been bumped to 2.06.
+
+	Over 390 packages updated.
+
+	New defconfigs: aspeed_ast2500evb, aspeed_ast2600evb,
+	broadcom_northstar, canaan_kd233, qemu_riscv64_nommu_virt,
+	sipeed_maix_bit, sipeed_maix_bit_sdcard, sipeed_maix_dock,
+	sipeed_maix_dock_sdcard, sipeed_maix_go,
+	sipeed_maix_go_sdcard, sipeed_maixduino,
+	sipeed_maixduino_sdcard
+
+	Removed defconfigs: andes_ae300, csky_gx6605s,
+	friendlyarm_nanopi_neo, minnowboard_max-graphical
+
+	New packages: clpeak, compiler-rt, crucible, dbus-broker, dht,
+	double-conversion, dust, freeradius-server, gdal, hawktracer,
+	hyperfine, libb2, libdeflate, libdill, mbw, mender-connect,
+	minizip-zlib, nerdctl, ntpsec, opencl-hpp, opensc,
+	python-alembic, python-appdirs, python-beniget,
+	python-construct, python-dtschema, python-gast, python-kflash,
+	python-lark, python-maturin, python-mypy-extensions,
+	python-pylibfdt, python-pythran, python-pyrsistent,
+	python-qrcode, python-rfc3987, python-rtoml,
+	python-ruamel-yaml, python-scipy, python-typeguard,
+	python-typing-inspect, python-zlmdb, qt6base, rtl8723ds,
+	spirv-llvm-translator, tealdeer, uuu, vis-network, volk,
+	wolftpm, zeek, zerofree
+
+	Removed packages: rtl8723bs
+
+	Issues resolved:
+
+	#14556: python-crossbar fails to build
+	#14951: boost compile error when running make  silently
+	#14646: OpenSSH 8.9p1 compiler error under mipsel
+	#14841: support/download/git fails with "fatal: No  such remote
+		'origin'" due to incorrect check for origin remote
+	#13356: libabseil-cpp: not building for raspberry pi
+	#14911: host-python3 build needs python3 on the host
+	#13831: mesa3d - kmsro driver requires dri3
+	#13816: xstart failed since update the x11 libraries
+	#13796: Problems compiling package gst-plugins-good
+	#14191: patchelf v0.9 corrupt Nvidia shared  libraries
+	#14891: sudo: group setup fails since commit  9b7f8da96b
+	#14881: Watchdogd Package missing INSTALL_STAGING
+	#14876: arm-trusted-firmware can no longer be  compiled with fPIE
+
 2022.05.1, released July 24th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
