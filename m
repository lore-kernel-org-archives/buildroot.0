Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C90FC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E12761029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E12761029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1104010B;
	Tue,  3 Aug 2021 21:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXjxR7jJVEtY; Tue,  3 Aug 2021 21:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B611940179;
	Tue,  3 Aug 2021 21:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27D281BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FF4A835B1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGWAT-6-cawB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A32837DA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A5A5481363; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Jun 2021 13:59:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3bb260cf38603d49f9ac55e8d37031698d41b7a8
X-Git-Newrev: 6bccac75ea3f8cd66bcde3747067add14b0c4f2c
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.A5A5481363@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bmap-tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bccac75ea3f8cd66bcde3747067add14b0c4f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: numerous reworks, add myself in DEVELOPERS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                         |  2 ++
 package/Config.in                  |  1 +
 package/bmap-tools/Config.in       | 44 ++++++++++++++++++++++++++++++++++++++
 package/bmap-tools/bmap-tools.hash |  3 +++
 package/bmap-tools/bmap-tools.mk   | 13 +++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ff590978c..1b5df54386 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1985,6 +1985,7 @@ F:	board/intel/galileo/
 F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+F:	package/bmap-tools/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	support/testing/tests/package/sample_python_augeas.py
@@ -2638,6 +2639,7 @@ F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
+F:	package/bmap-tools/
 F:	package/c-periphery/
 F:	package/cdrkit/
 F:	package/cifs-utils/
diff --git a/package/Config.in b/package/Config.in
index 35e6d4d493..22947edf2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
+	source "package/bmap-tools/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
new file mode 100644
index 0000000000..83b4d92786
--- /dev/null
+++ b/package/bmap-tools/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_BMAP_TOOLS
+	bool "bmap-tools"
+	depends on BR2_PACKAGE_PYTHON3 || BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Tool to flash image files to block devices using the block map
+	  bmaptool is a generic tool for creating the block map (bmap)
+	  for a file, and copying files using the block map. The idea is
+	  that large file containing unused blocks, like raw system
+	  image files, can be copied or flashed a lot faster with
+	  bmaptool than with traditional tools like "dd" or "cp".
+
+	  Relevant optional dependencies:
+
+	  - Busybox compiled with CONFIG_BZIP2, or BR2_PACKAGE_BZIP2,
+	    to support bz2 compressed images
+
+	  - BR2_PACKAGE_PIGZ for optimized gzip decompression
+
+	  - Busybox compiled with CONFIG_LZOP, or BR2_PACKAGE_LZOP, to
+	    support lzo compressed images.
+
+	  - BR2_PACKAGE_ZIP to support zip compressed images
+
+	  - BR2_PACKAGE_LZ4 to support lz4 compressed images
+
+	  - BR2_PACKAGE_ZSTD to support zstd compressed images
+
+	  - Busybox compiled CONFIG_FEATURE_SEAMLESS_* or
+	    BR2_PACKAGE_TAR to support tar compressed images
+
+	  - BR2_PACKAGE_OPENSSH to retrieve images over SSH.
+
+	  - BR2_PACKAGE_SSHPASS to retrieve images over SSH if
+	    password authentication is used.
+
+	  Image signature verification is not supported as
+	  python-gpgme is not available. Optimized bzip2 decompression
+	  is not supported as pbzip2 is not available.
+
+	  https://github.com/intel/bmap-tools
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
new file mode 100644
index 0000000000..82a570ecac
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
new file mode 100644
index 0000000000..c8b41c225f
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# bmap-tools
+#
+################################################################################
+
+BMAP_TOOLS_VERSION = 3.6
+BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_LICENSE = GPL-2.0
+BMAP_TOOLS_LICENSE_FILES = COPYING
+BMAP_TOOLS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
