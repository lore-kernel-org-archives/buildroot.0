Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE7C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 20:33:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73892611C0
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 20:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73892611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373B3400BE;
	Fri,  5 Nov 2021 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzymNkCyr38h; Fri,  5 Nov 2021 20:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AE2540151;
	Fri,  5 Nov 2021 20:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB5931BF57C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A9B6075E
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N76E9Hz13j8G for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 20:33:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD63660698
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 20:33:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A39778B340; Fri,  5 Nov 2021 20:29:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 21:30:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c5658cb37ad72f6eeac8826fa9d791b494aa402
X-Git-Newrev: 639c0047a9321c6e061a7fe5b397e22089f09473
X-Patchwork-Hint: ignore
Message-Id: <20211105202920.A39778B340@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: prepare for 2021.11-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=639c0047a9321c6e061a7fe5b397e22089f09473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/CHANGES b/CHANGES
index 591ae21e6a..93d191682d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,56 @@
+2021.11-rc1, to be released
+
+	Numerous package updates. Notable updates including numerous
+	Python modules, as well as Kodi add-ons.
+
+	Toolchain:
+	- glibc update to 2.34
+	- support for gdb 11.x added, gdb 10.x now the default
+	- external toolchains provided by ARM updated
+	- remove support for internal toolchain on the CSKY
+          architecture, as it was broken and unmaintained
+
+	Many packages updated to enable the appropriate SELinux
+	refpolicy module when SELinux support is enabled.
+
+	Support was added in the test-pkg package testing utility for
+	using Gitlab CI to run the builds.
+
+	New libgbm virtual package to better support OpenGL
+	implementations that provide a libgbm library.
+
+	Bootloaders/firmware: grub2 extended to be able to support
+	multiple platforms in the same build.
+
+	Filesystems:
+	- new OCI filesystem type, to build container images
+	  compatible with the Open Container Initiative standard
+	- support for hybrid ISO9660 images added, which work on
+          legacy and EFI BIOS machines
+
+	New defconfigs: stm32mp157c_odyssey
+
+	Removed defconfigs: qemu_csky
+
+	New packages: dtbocfg, firmware-utils, gstd, libdbi,
+	libdbi-drivers, lua-augeas, mstpd, php-pecl-dbus,
+	python-aioprocessing, python-bidict,
+	python-charset-normalizer, python-flask-expects-json,
+	python-git, python-pyndiff, python-rsa, python-xmljson,
+	python3-cryptography, python3-pip, qt5opcua, rwmem,
+	sloci-image, softhsm2, uqmi, vuejs-router, watchdogd,
+	wireplumber
+
+	Removed packages: canfestival, python-meld3
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14271: compilation error with rsync command for  permission
+	#14276: Unable to get login prompt
+	#14196: when using raspberrypicm4io_64_defconfig, make fails
+	        with mkfs.ext4: No such file or directory while trying
+	        to determine filesystem size
+
 2021.08.1, released October 11, 2021
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
