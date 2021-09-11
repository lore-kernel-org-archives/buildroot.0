Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2A1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAF1611B0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EAF1611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED6F40199;
	Sat, 11 Sep 2021 12:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MQ8hDn0dok8; Sat, 11 Sep 2021 12:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CBDA40166;
	Sat, 11 Sep 2021 12:53:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5C661BF958
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1451401BB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuz2AwNniyzI for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BFD14011A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C50B88F39; Sat, 11 Sep 2021 12:51:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 14:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a600671166fc59c9da5a5fdca0ba204d0f7836f5
X-Git-Newrev: e83974e2f9f5b7380e78f417b1ef5e0d919d724c
X-Patchwork-Hint: ignore
Message-Id: <20210911125132.7C50B88F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sloci-image: new host package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e83974e2f9f5b7380e78f417b1ef5e0d919d724c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sloci-image is a simple CLI tool for packing rootfs into a single-layer
OCI image.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
[Arnout: correctly set PREFIX, add Matt to DEVELOPERS, add additional
         patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in.host                             |  1 +
 ...I-tar-from-the-contents-of-working-folder.patch | 37 ++++++++++++++++++++
 .../0002-oci_arch-fix-arch-arm64-argument.patch    | 39 ++++++++++++++++++++++
 package/sloci-image/Config.in.host                 |  7 ++++
 package/sloci-image/sloci-image.hash               |  5 +++
 package/sloci-image/sloci-image.mk                 | 19 +++++++++++
 7 files changed, 110 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9498d9ce36..8473f51726 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1835,6 +1835,7 @@ F:	package/raptor/
 F:	package/rng-tools/
 F:	package/rsyslog/
 F:	package/setools/
+F:	package/sloci-image/
 F:	package/smcroute/
 F:	package/tclap/
 F:	package/tini/
@@ -2435,6 +2436,7 @@ F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
+F:	package/sloci-image/
 F:	package/snort/
 F:	package/stella/
 F:	package/tio/
diff --git a/package/Config.in.host b/package/Config.in.host
index 551352482e..a0ec9bc1ab 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -79,6 +79,7 @@ menu "Host utilities"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
+	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
new file mode 100644
index 0000000000..3d048e3843
--- /dev/null
+++ b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
@@ -0,0 +1,37 @@
+From 66c73c2ba3057634f19f37d3cfbbe752638c9f9f Mon Sep 17 00:00:00 2001
+From: Matthew Weber <matthew.weber@collins.com>
+Date: Fri, 27 Aug 2021 12:24:19 -0500
+Subject: [PATCH] create OCI tar from the contents of working folder
+
+When testing with containerd, it was found that the tarfile
+created with sloci can't import because the contents are inside
+a folder.  Looking around online, it seems that the an oci tar
+should container the blob/index.json/oci-layout in the . of the
+tarfile.
+
+Upstream: https://github.com/jirutka/sloci-image/pull/3
+
+Refs:
+https://snyk.io/blog/container-image-formats/
+https://github.com/opencontainers/image-spec/blob/main/image-layout.md
+
+Signed-off-by: Matthew Weber <matthew.weber@collins.com>
+---
+ sloci-image | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sloci-image b/sloci-image
+index 90dba26..7f3c775 100755
+--- a/sloci-image
++++ b/sloci-image
+@@ -425,6 +425,6 @@ if [ "$OUT_TYPE" = tar ]; then
+ 	file_name="$IMAGE_NAME-$CFG_REF_NAME-$CFG_ARCH"
+ 	file_name="$file_name${CFG_ARCH_VARIANT:+"-$CFG_ARCH_VARIANT"}-$CFG_OS.oci-image"
+ 
+-	tar ${DEBUG:+-v} -cf "$file_name.tar" "$IMAGE_NAME"
++	tar ${DEBUG:+-v} -cf "$file_name.tar" -C "$IMAGE_NAME" .
+ 	rm -Rf "$IMAGE_NAME"
+ fi
+-- 
+2.17.1
+
diff --git a/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch b/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch
new file mode 100644
index 0000000000..27c4ab8c16
--- /dev/null
+++ b/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch
@@ -0,0 +1,39 @@
+From 67b16c65cdf0f654275802d6d12451a81a4d2796 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sat, 11 Sep 2021 14:37:20 +0200
+Subject: [PATCH] oci_arch: fix "--arch arm64" argument
+
+The --arch argument presumably should take the appropriate GOARCH-type
+string. The oci_arch() function does some conversion on it, which is
+needed because without --arch the architecture is taken from "uname -m",
+which yields something different than a GOARCH-type string.
+
+However, oci_arch() converts arm* into arm, which is wrong for arm64.
+Since arm64 is a proper GOARCH-type string, it shouldn't be converted at
+all.
+
+Upate the case statement to convert arm64 to arm64 (i.e., do nothing).
+Since the arm64 match comes before arm*, it takes precedence.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Upstream: https://github.com/jirutka/sloci-image/pull/4
+---
+ sloci-image | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sloci-image b/sloci-image
+index 7f3c775..6844023 100755
+--- a/sloci-image
++++ b/sloci-image
+@@ -214,7 +214,7 @@ oci_arch() {
+ 	case "$1" in
+ 		x86_64) echo amd64;;
+ 		x86) echo 386;;
+-		aarch64) echo arm64;;
++		aarch64|arm64) echo arm64;;
+ 		arm*) echo arm;;
+ 		*) echo "$1";;
+ 	esac
+-- 
+2.31.1
+
diff --git a/package/sloci-image/Config.in.host b/package/sloci-image/Config.in.host
new file mode 100644
index 0000000000..d809f1f3c7
--- /dev/null
+++ b/package/sloci-image/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SLOCI_IMAGE
+	bool "host sloci-image"
+	help
+	  A simple CLI tool for packing rootfs into a single-layer OCI
+	  image.
+
+	  https://github.com/jirutka/sloci-image
diff --git a/package/sloci-image/sloci-image.hash b/package/sloci-image/sloci-image.hash
new file mode 100644
index 0000000000..117f0ba6e0
--- /dev/null
+++ b/package/sloci-image/sloci-image.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  56fbc335c193eccc3992f0a723c6dabe762f6d4854fc52059be074bdf5060d9e  sloci-image-0.1.1.tar.gz
+
+# Hash for license files:
+sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
new file mode 100644
index 0000000000..232127bfa2
--- /dev/null
+++ b/package/sloci-image/sloci-image.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sloci-image
+#
+################################################################################
+
+SLOCI_IMAGE_VERSION = 0.1.1
+SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,v$(SLOCI_IMAGE_VERSION))
+
+SLOCI_IMAGE_LICENSE = MIT
+SLOCI_IMAGE_LICENSE_FILES = LICENSE
+
+HOST_SLOCI_IMAGE_DEPENDENCIES = host-gawk
+
+define HOST_SLOCI_IMAGE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR) -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
