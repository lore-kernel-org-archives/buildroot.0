Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7689C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32F160525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A32F160525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8003C83A9D;
	Tue,  3 Aug 2021 22:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiqD3-Tt5AUf; Tue,  3 Aug 2021 22:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0D883B03;
	Tue,  3 Aug 2021 22:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 922081BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E05D608B2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWEhxJLE5uJK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56572608B0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A0188875FF; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:21:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 315ce3264840f827ea15970d7957b170d4cfa171
X-Git-Newrev: a3ac2a0f5d6313065b254f9c008feb68425dfa26
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.A0188875FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] CHANGES: prepare for
 2021.08-rc1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a3ac2a0f5d6313065b254f9c008feb68425dfa26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/CHANGES b/CHANGES
index 91487cc058..9c0b1b19b9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,60 @@
+2021.08-rc8, to be released
+
+	Numerous package updates.
+
+	Toolchain:
+
+        - add support for gcc 11.x, gcc 10.x is now the default, gcc
+	  9.x updated to 9.4.0, removed gcc 8.x support except for
+	  PowerPC SPE
+
+	- add support for binutils 2.37, binutils 2.36.x is now the
+          default, binutils 2.34 removed.
+
+	- glibc updated to 2.33
+
+        - gdb enabled on NIOS II, gdbserver enabled on RISC-V.
+
+	Bootloaders/firmware: support for building the EDK II UEFI
+	firmware, support for building AT91Bootstrap 4.x.
+
+	New BR2_ENABLE_RUNTIME_DEBUG option, that controls whether
+	packages should be compiled with runtime debugging
+	information (which is different than debugging symbols).
+
+	Many features of the bluez5_utils package have been made
+	optional, and default to disabled. Users of bluez5_utils are
+	encouraged to review their configuration.
+
+	Many packages (over 70) updated to enable the appropriate
+	SELinux refpolicy module when SELinux support is enabled.
+
+	Many packages updated to select the appropriate OpenSSL
+	features after many OpenSSL ciphers/features have been made
+	optional.
+
+	New defconfigs: kontron_pitx_imx8m, microchip_sama5d2_icp,
+	qemu_aarch64_sbsa, raspberrypicm4io, raspberrypicm4io_64,
+	terasic_de10nano_cyclone5, uevm5432.
+
+	New packages: alsa-plugins, apg, bmap-tools, daq3, edk2,
+	edk2-platforms, gumbo-parser, libbpf, libosmium, libpsl,
+	libqb, libtalloc, libvirt, lua-linux, lua-zlib, mupdf,
+	opencv4, osm2pgsql, poke, python-augeas, python-dbus-next,
+	python-pymupdf, rtl_433, rtl8812au-aircrack-ng, seatd, snort3,
+	system-config-printer, usbguard, xml-security-c, xmrig.
+
+	Removed packages: clapack, libsoil.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13326: regarding dtc error in buildroot source code
+	#13661: host-python2 build fails on aarch64
+	#13836: package build failure when target install set to no on
+	        pkg-generic pkg types
+	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to
+	        y as before
+
 2021.05, released June 6th, 2021
 
 	Various fixes.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
