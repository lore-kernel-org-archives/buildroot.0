Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59141C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2818284A6E;
	Sun, 15 Sep 2024 21:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXoJddypkGBX; Sun, 15 Sep 2024 21:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 904EB81E35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904EB81E35;
	Sun, 15 Sep 2024 21:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 660A21BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60D44608A6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNYusAXTM1RR for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11E560D9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E11E560D9C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA7CC82285; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8931e9f5344ad050d998fecd841b0d43bba78c55
X-Git-Newrev: 7b2a164b7460c07471080fe565bf5da76b032e59
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.DA7CC82285@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go/go-bin: new host-go provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b2a164b7460c07471080fe565bf5da76b032e59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a pre-built version for the host-go virtual
package introduced in the previous commits:

 - host-go-bin installs a pre-built version of the Go compiler.

By default, host-go remains built from sources to keep the same
behavior as the former version.

The menuconfig entry for host-go is updated to expose the host-go-bin
provider. The dependencies are set as such as if host-go-src does not
support the host architecture, it will automatically fall back to
host-go-bin and vice versa.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[yann.morin.1998@free.fr:
  - update hashes for 1.22.7
  - add hash for the source tarball
  - set _DL_SUBDIR
  - don't set a prompt to BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/Config.in.host        | 22 ++++++++++++++++------
 package/go/go-bin/Config.in.host | 14 ++++++++++++++
 package/go/go-bin/go-bin.hash    |  9 +++++++++
 package/go/go-bin/go-bin.mk      | 20 ++++++++++++++++++++
 package/go/go.mk                 |  2 ++
 5 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 18b96f19a8..30260b573b 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
@@ -57,7 +57,8 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
 
@@ -65,18 +66,27 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
-endchoice
+config BR2_PACKAGE_HOST_GO_BIN
+	bool "host go (pre-built)"
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	help
+	  This package will install pre-built versions of the compiler
 
-endif
+endchoice
 
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src, as the only provider for now
-	default "host-go-src"
+	# Default to host-go-src
+	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
+	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
+
+endif
 
+source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
new file mode 100644
index 0000000000..6312c1b950
--- /dev/null
+++ b/package/go/go-bin/Config.in.host
@@ -0,0 +1,14 @@
+# Translate the HOSTARCH into the architecture name used by the Go compiler
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
+	string
+	default "armv6l" if BR2_HOSTARCH = "arm"
+	default "arm64" if BR2_HOSTARCH = "aarch64"
+	default "ppc64le" if BR2_HOSTARCH = "powerpc64le"
+	default "s390x" if BR2_HOSTARCH = "s390x"
+	default "386" if BR2_HOSTARCH = "x86"
+	default "amd64" if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
new file mode 100644
index 0000000000..d979bada11
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1,9 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
+sha256  810e4d9f3f2f03b2f11471a9c7a32302968fc09d51f666cecacedb1055f2f873  go1.22.7.linux-386.tar.gz
+sha256  fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb  go1.22.7.linux-amd64.tar.gz
+sha256  ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885  go1.22.7.linux-arm64.tar.gz
+sha256  0fd55519819922f51d13503f2c9b1294730be7ffa0ead8dd36c0e540c2a27508  go1.22.7.linux-armv6l.tar.gz
+sha256  a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a  go1.22.7.linux-ppc64le.tar.gz
+sha256  08dc28de0dafb175501b9d1623c9b11a9b734eb4b3a35c9c658cc91d4dfce3f3  go1.22.7.linux-s390x.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
new file mode 100644
index 0000000000..a0f1e26e8f
--- /dev/null
+++ b/package/go/go-bin/go-bin.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# go-bin
+#
+################################################################################
+
+GO_BIN_SITE = https://go.dev/dl
+GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
+GO_BIN_DL_SUBDIR = go
+HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz
+GO_BIN_LICENSE = BSD-3-Clause
+GO_BIN_LICENSE_FILES = LICENSE
+
+HOST_GO_BIN_PROVIDES = host-go
+
+define HOST_GO_BIN_INSTALL_CMDS
+	$(GO_BINARIES_INSTALL)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/go/go.mk b/package/go/go.mk
index 8b9651d7a1..215c5fe965 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -71,6 +71,8 @@ HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
 	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	CGO_CFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
