Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CB8B40439;
	Sun,  9 Jan 2022 22:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVcQqqT978YN; Sun,  9 Jan 2022 22:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E534045E;
	Sun,  9 Jan 2022 22:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03A6A1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A7B404BC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGGccj5uuJWE for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E35C40439
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 92DB88324A; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bdb65b3109a8256c6052f2cb35a989432f7a508
X-Git-Newrev: 4e33104c26139f7a6cfc14d5a1b71ac552630e14
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.92DB88324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moby-buildkit: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e33104c26139f7a6cfc14d5a1b71ac552630e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
[Romain:
  - remove host-pkgconf dependency
  - Add the license file hash
  - Fix the check-package warning in Config.in]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/moby-buildkit/Config.in          | 19 +++++++++++++++++++
 package/moby-buildkit/moby-buildkit.hash |  3 +++
 package/moby-buildkit/moby-buildkit.mk   | 22 ++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2aeb80844e..933736de7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -533,6 +533,7 @@ F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/gocryptfs/
 F:	package/mbpfan/
+F:	package/moby-buildkit/
 F:	package/mosh/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
diff --git a/package/Config.in b/package/Config.in
index c9d099bd39..a1924f96df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2556,6 +2556,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
+	source "package/moby-buildkit/Config.in"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
new file mode 100644
index 0000000000..93c852bcdb
--- /dev/null
+++ b/package/moby-buildkit/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MOBY_BUILDKIT
+	bool "moby-buildkit"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	help
+	  BuildKit is a toolkit for converting source code to build
+	  artifacts in an efficient, expressive and repeatable manner.
+
+	  https://github.com/moby/buildkit
+
+comment "moby-buildkit needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
new file mode 100644
index 0000000000..3015e479f6
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
new file mode 100644
index 0000000000..3f0df351ef
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# moby-buildkit
+#
+################################################################################
+
+MOBY_BUILDKIT_VERSION = 0.8.1
+MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
+MOBY_BUILDKIT_LICENSE = Apache-2.0
+MOBY_BUILDKIT_LICENSE_FILES = LICENSE
+
+MOBY_BUILDKIT_GOMOD = github.com/moby/buildkit
+
+MOBY_BUILDKIT_TAGS = cgo
+MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
+
+MOBY_BUILDKIT_LDFLAGS = \
+	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
+
+MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
