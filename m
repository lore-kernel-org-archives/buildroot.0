Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F67C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CD561299;
	Tue,  6 Feb 2024 16:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CD561299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-Lf_NXFgt_Y; Tue,  6 Feb 2024 16:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC6060A91;
	Tue,  6 Feb 2024 16:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC6060A91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB481BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A65382E29
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztce3zro-StO for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DCC82E19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56DCC82E19
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4216487178; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:57:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7befbaaea74ff282b4b8ec5b3c3ad52be0d99937
X-Git-Newrev: 11b439ce1bd28506051fff14646f8bbdbbbe58d8
X-Patchwork-Hint: ignore
Message-Id: <20240206165731.4216487178@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============4945228630896944357=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4945228630896944357==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=11b439ce1bd28506051fff14646f8bbdbbbe58d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for building binutils for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

In order to build the zynqmp pmufw and versal plm applications without error,
binutils version 2.41 or higher is required.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../binutils-bare-metal/binutils-bare-metal.hash   |  1 +
 package/binutils-bare-metal/binutils-bare-metal.mk | 33 ++++++++++++++++++++++
 package/binutils/binutils.hash                     |  1 +
 4 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cc4d37aef..9f93746015 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1386,6 +1386,7 @@ N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
 N:	Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
+F:	package/binutils-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
@@ -2269,6 +2270,7 @@ F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu104_defconfig
 F:	configs/zynqmp_zcu106_defconfig
+F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
new file mode 120000
index 0000000000..e0655d3af3
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -0,0 +1 @@
+../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
new file mode 100644
index 0000000000..d55c2d081e
--- /dev/null
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# binutils-bare-metal
+#
+################################################################################
+
+HOST_BINUTILS_BARE_METAL_VERSION = 2.42
+HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
+HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
+
+HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+
+HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
+
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
+HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
+HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
+
+HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
+	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+	--disable-gprof \
+	--disable-shared \
+	--enable-lto \
+	--enable-static \
+	--disable-initfini-array \
+	--disable-multilib \
+	--disable-werror
+
+$(eval $(host-autotools-package))
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 519a0ca887..e4c6a0b0b6 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
 sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
 sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
+sha512  155f3ba14cd220102f4f29a4f1e5cfee3c48aa03b74603460d05afb73c70d6657a9d87eee6eb88bf13203fe6f31177a5c9addc04384e956e7da8069c8ecd20a6  binutils-2.42.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  binutils-gdb-arc-2023.09-release.tar.gz

--===============4945228630896944357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4945228630896944357==--
