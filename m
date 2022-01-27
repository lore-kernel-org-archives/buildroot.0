Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797BDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 03:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB7B84E38;
	Thu, 27 Jan 2022 03:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCXWHaqOWk0I; Thu, 27 Jan 2022 03:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB26E84E32;
	Thu, 27 Jan 2022 03:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0701BF32A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 03:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB2561073
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 03:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCXz4QepapT2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 03:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B78CE6106E
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 03:40:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id j16so1384035plx.4
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 19:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C7+UJHfGNVlrZl7Wf7TZwkjwGUWUtwPn2OY3MnlSUtw=;
 b=RdE078ZG1EB6mqDX4xKT22BOsd48S3CQTroPfJHLRedOnvRi7PaYFZEKY51vy/sCjX
 Tr3jXMFntkuUZxGEkiXhPEGKVteXPjXM48x0LwuPhGXGXD7vaWcVXejSFa5cKAaGuX5Q
 9N84dbjEiFv16TYBH1omyc0Ps/l96WRcKQ8AE3qFBDf2AloXm8wPoMOE0S+qw7/OSOew
 Jwcyhr0mBVOJMTLULAGMJfe9mC+hFuKP/ULkGIWjM5MagrMjTmwM+3rlTWioM+HHsttQ
 0roG47w08IOZ7VqqDgFqPo0cpOZjqcMnx1e7wWtNZpeXApYNocwdLC2oCSUNTkgfjeld
 eKlg==
X-Gm-Message-State: AOAM533Oziti/Gh2VY+F3JN7uv6GOAKUc5sYdXIWKOUNurLjz8zKMB+e
 eYjPaXcK4Wrel2Tlvlsfje8rqgKK2TQRgg==
X-Google-Smtp-Source: ABdhPJybOfXGMzewuEkt8PqjgvvfYTBZD58NZPOf+0ELc26fh0iTGKVe/U540BaEP15QuCw5JWinqA==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr258873pjb.32.1643254820825; 
 Wed, 26 Jan 2022 19:40:20 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 q140sm18424923pgq.7.2022.01.26.19.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 19:40:20 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 19:40:17 -0800
Message-Id: <20220127034017.91761-1-christian@paral.in>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/buildah: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds both host and target packages for buildah.

Buildah is a tool that facilitates building OCI images.

https://github.com/containers/buildah

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/buildah/Config.in      | 21 ++++++++++++++++++
 package/buildah/Config.in.host |  7 ++++++
 package/buildah/buildah.hash   |  3 +++
 package/buildah/buildah.mk     | 39 ++++++++++++++++++++++++++++++++++
 7 files changed, 73 insertions(+)
 create mode 100644 package/buildah/Config.in
 create mode 100644 package/buildah/Config.in.host
 create mode 100644 package/buildah/buildah.hash
 create mode 100644 package/buildah/buildah.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fe8de1916e..80e7c5abee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -529,6 +529,7 @@ F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
+F:	package/buildah/
 F:	package/containerd/
 F:	package/delve/
 F:	package/docker-cli/
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..91eb66a454 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2523,6 +2523,7 @@ menu "System tools"
 	source "package/audit/Config.in"
 	source "package/balena-engine/Config.in"
 	source "package/bubblewrap/Config.in"
+	source "package/buildah/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 341e24926b..d2e59388ae 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
+	source "package/buildah/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
diff --git a/package/buildah/Config.in b/package/buildah/Config.in
new file mode 100644
index 0000000000..f4378be679
--- /dev/null
+++ b/package/buildah/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_BUILDAH
+	bool "buildah"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme -> libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # libgpgme -> libassuan
+	# gnupg is not needed to build, but at runtime.
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBASSUAN
+	help
+	  Buildah is a tool that facilitates building OCI images.
+
+	  https://github.com/containers/buildah
+
+comment "buildah needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/buildah/Config.in.host b/package/buildah/Config.in.host
new file mode 100644
index 0000000000..ca294e6f92
--- /dev/null
+++ b/package/buildah/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_BUILDAH
+	bool "buildah"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  Buildah is a tool that facilitates building OCI images.
+
+	  https://github.com/containers/buildah
diff --git a/package/buildah/buildah.hash b/package/buildah/buildah.hash
new file mode 100644
index 0000000000..c7e00d02a7
--- /dev/null
+++ b/package/buildah/buildah.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d99b5187a25bc9d7385408732a0e155df0458b4d2cea6e8d002f3fa2cbaac76f  buildah-1.24.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/buildah/buildah.mk b/package/buildah/buildah.mk
new file mode 100644
index 0000000000..87eed8b834
--- /dev/null
+++ b/package/buildah/buildah.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# buildah
+#
+################################################################################
+
+BUILDAH_VERSION = 1.24.0
+BUILDAH_SITE = $(call github,containers,buildah,v$(BUILDAH_VERSION))
+
+BUILDAH_LICENSE = Apache-2.0
+BUILDAH_LICENSE_FILES = LICENSE
+
+BUILDAH_DEPENDENCIES = libgpgme
+
+BUILDAH_CPE_ID_VENDOR = buildah_project
+BUILDAH_CPE_ID_PRODUCT = buildah
+
+BUILDAH_TAGS = \
+	cgo \
+	exclude_graphdriver_aufs \
+	exclude_graphdriver_btrfs \
+	exclude_graphdriver_devicemapper \
+	exclude_graphdriver_zfs
+BUILDAH_BUILD_TARGETS = cmd/buildah
+BUILDAH_GOMOD = github.com/containers/buildah
+
+BUILDAH_LDFLAGS = \
+	-X $(BUILDAH_GOMOD)/cmd/buildah.GitCommit=v$(BUILDAH_VERSION) \
+	-X $(BUILDAH_GOMOD)/define.Version=v$(BUILDAH_VERSION)
+
+BUILDAH_INSTALL_BINS = $(notdir $(BUILDAH_BUILD_TARGETS))
+
+HOST_BUILDAH_BUILD_TARGETS = $(BUILDAH_BUILD_TARGETS)
+HOST_BUILDAH_TAGS = $(BUILDAH_TAGS)
+HOST_BUILDAH_LDFLAGS = $(BUILDAH_LDFLAGS)
+HOST_BUILDAH_INSTALL_BINS = $(BUILDAH_INSTALL_BINS)
+
+$(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
