Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7788CC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 06:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02794408FB;
	Thu, 28 Jul 2022 06:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02794408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smJW70Rwl1Rl; Thu, 28 Jul 2022 06:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09EC740567;
	Thu, 28 Jul 2022 06:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09EC740567
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED8E1BF364
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 06:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D4E160EF4
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 06:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D4E160EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJa3gpK7BB5C for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 06:44:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F16C60EF1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 06:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F16C60EF1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8FCD386799; Thu, 28 Jul 2022 06:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 08:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50e398e2d9f7e01ddcddb00929041546d750d32a
X-Git-Newrev: b95b8fb44cc1a0ba18f2575a5da4faa0b6e27a10
X-Patchwork-Hint: ignore
Message-Id: <20220728063035.8FCD386799@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nerdctl: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b95b8fb44cc1a0ba18f2575a5da4faa0b6e27a10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nerdctl is a CLI for containerd (package docker-containerd) which is
drop-in compatible with the Docker Daemon CLI.

This allows using the lighter weight containerd daemon directly,
instead of via the additional docker daemon. It also implements
rootless mode.

https://github.com/containerd/nerdctl

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/nerdctl/Config.in    | 18 ++++++++++++++++++
 package/nerdctl/nerdctl.hash |  3 +++
 package/nerdctl/nerdctl.mk   | 20 ++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6944d3129c..cb98c3883d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,6 +538,7 @@ F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
 F:	package/mosh/
+F:	package/nerdctl/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
 F:	package/runc/
diff --git a/package/Config.in b/package/Config.in
index 8ecf2295d3..4ff1fb2f3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2594,6 +2594,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
new file mode 100644
index 0000000000..969b9bb40e
--- /dev/null
+++ b/package/nerdctl/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NERDCTL
+	bool "nerdctl"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
+	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_CONTAINERD # runtime
+	help
+	  Docker-compatible CLI for containerd, controlling runc.
+
+	  https://github.com/containerd/nerdctl
+
+comment "nerdctl needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
new file mode 100644
index 0000000000..22cc97c362
--- /dev/null
+++ b/package/nerdctl/nerdctl.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  be41804ef139a3f92b774edc8439678e56b44033d7ab3fcf4389f0865c1fe069  nerdctl-0.17.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
new file mode 100644
index 0000000000..3f3c04aa11
--- /dev/null
+++ b/package/nerdctl/nerdctl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# nerdctl
+#
+################################################################################
+
+NERDCTL_VERSION = 0.17.1
+NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
+
+NERDCTL_LICENSE = Apache-2.0
+NERDCTL_LICENSE_FILES = LICENSE
+
+NERDCTL_GOMOD = github.com/containerd/nerdctl
+
+NERDCTL_LDFLAGS = \
+	-X $(NERDCTL_GOMOD)/pkg/version.Version=$(NERDCTL_VERSION)
+
+NERDCTL_BUILD_TARGETS = cmd/nerdctl
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
