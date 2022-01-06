Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2448481286;
	Thu,  6 Jan 2022 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FG9PYodsbCrs; Thu,  6 Jan 2022 21:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C36A81257;
	Thu,  6 Jan 2022 21:02:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40BE91BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EFCA42987
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqEyCN9uHOCi for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCDB542982
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BA19360006;
 Thu,  6 Jan 2022 21:00:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:59 +0100
Message-Id: <20220106210000.397694-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 11/11] package/gocryptfs: new package
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Stewart via buildroot <buildroot@buildroot.org>

Adds the gocryptfs encrypted FUSE filesystem.

Currently uses without_openssl build tag, to use the native Go cryptography.
However, the package could be improved by conditionally enabling openssl if it
is also configured to be built by Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/gocryptfs/Config.in      | 12 ++++++++++++
 package/gocryptfs/gocryptfs.hash |  3 +++
 package/gocryptfs/gocryptfs.mk   | 19 +++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/gocryptfs/Config.in
 create mode 100644 package/gocryptfs/gocryptfs.hash
 create mode 100644 package/gocryptfs/gocryptfs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2649cf4ac4..bf58a20fc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -521,6 +521,7 @@ F:	package/docker-proxy/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
+F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/mosh/
 F:	package/pkg-golang.mk
diff --git a/package/Config.in b/package/Config.in
index 34a36279ea..2946ce7a4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -221,6 +221,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/gocryptfs/Config.in"
 	source "package/imx-usb-loader/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
new file mode 100644
index 0000000000..2630cafdcf
--- /dev/null
+++ b/package/gocryptfs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GOCRYPTFS
+	bool "gocryptfs"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  gocryptfs is an encrypted FUSE overlay filesystem.
+
+	  https://github.com/rfjakob/gocryptfs
+
+comment "gocryptfs needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
new file mode 100644
index 0000000000..94487815f5
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4d89b76fe0b0c7218099f6f0ea6c1c87efe13927d95579a6ede82f20b6dbe48a  gocryptfs-2.2.0.tar.gz
+sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
new file mode 100644
index 0000000000..2a00e9a959
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gocryptfs
+#
+################################################################################
+
+GOCRYPTFS_VERSION = 2.2.0
+GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
+GOCRYPTFS_LICENSE = MIT
+GOCRYPTFS_LICENSE_FILES = LICENSE
+
+GOCRYPTFS_GOMOD = github.com/rfjakob/gocryptfs/v2
+
+GOCRYPTFS_LDFLAGS = \
+	-X main.GitVersion=$(GOCRYPTFS_VERSION) \
+	-X main.GitVersionFuse=[vendored]
+GOCRYPTFS_TAGS = without_openssl
+
+$(eval $(golang-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
