Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2885C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850CB413BC;
	Sat, 13 Jul 2024 14:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NFH2MIYRRTE; Sat, 13 Jul 2024 14:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC2540B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC2540B4F;
	Sat, 13 Jul 2024 14:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B19AA1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABC9382088
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSSo8NFZ-HrT for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E04878207E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E04878207E
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDA3B86490; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:11:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a4ad23a07236348034a54997dd09e79166f2d11
X-Git-Newrev: 619b83a4438667cdb4cc8a7dddc79dbf6d84ec2a
X-Patchwork-Hint: ignore
Message-Id: <20240713141159.CDA3B86490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=619b83a4438667cdb4cc8a7dddc79dbf6d84ec2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

skopeo is a command line utility that performs various operations on
container images and image repositories.

We introduce it as a host-only package, as the expected usage is to
transform an OCI image into a docker image, or to help in uploading an
OCI image to a (local) docker daemon or to a docker registry, for
example, in a post-build script.

As such, it needs a prompt in the host packages section.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                    |  1 +
 package/Config.in.host        |  1 +
 package/skopeo/Config.in.host |  7 +++++++
 package/skopeo/skopeo.hash    |  3 +++
 package/skopeo/skopeo.mk      | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b66fda5fcb..7c47cda42f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3340,6 +3340,7 @@ F:	support/download/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
+F:	package/skopeo/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
 F:	configs/beaglebone_defconfig
diff --git a/package/Config.in.host b/package/Config.in.host
index 66f3a6fa9d..89e5ca5191 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -103,6 +103,7 @@ menu "Host utilities"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/starfive-spltool/Config.in.host"
diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
new file mode 100644
index 0000000000..4a63a0829c
--- /dev/null
+++ b/package/skopeo/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SKOPEO
+	bool "host skopeo"
+	help
+	  skopeo is a command line utility that performs various
+	  operations on container images and image repositories.
+
+	  https://github.com/containers/skopeo
diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
new file mode 100644
index 0000000000..d40585d52f
--- /dev/null
+++ b/package/skopeo/skopeo.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0b788fc5725ac79327f7c29797821a2bafc1c3c87bbfcb2998c2a1be949e314d  skopeo-1.13.3-go2.tar.gz
+sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
new file mode 100644
index 0000000000..98b0e7ed0a
--- /dev/null
+++ b/package/skopeo/skopeo.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# skopeo
+#
+################################################################################
+
+SKOPEO_VERSION = 1.13.3
+SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+
+SKOPEO_LICENSE = Apache-2.0
+SKOPEO_LICENSE_FILES = LICENSE
+
+HOST_SKOPEO_DEPENDENCIES = \
+	host-btrfs-progs \
+	host-libgpgme \
+	host-lvm2 \
+	host-pkgconf
+
+HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
+
+$(eval $(host-golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
