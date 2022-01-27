Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 04:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACB3401DD;
	Thu, 27 Jan 2022 04:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXpJPidJmzPf; Thu, 27 Jan 2022 04:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24517401CC;
	Thu, 27 Jan 2022 04:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53941BF32A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 04:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D13C840B29
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 04:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbtSpWNbysjx for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 04:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBE0A40B25
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 04:02:54 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 133so1208183pgb.0
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWNiQJuoJMIE2/mRoO+yuYRSL3ys/Hy9R3ILGZ85kRY=;
 b=LYwOFW15YENhlDqzTsTD9imbSc2Vhry5Tzv7pBIXR6+mq4XjvjyPiF3vguea316mTD
 XNreeMWD129VJDHxRCU+MovKrLTfx5uskZ0lDGo3mX3vpqM6j3mBzwDX60iuIjqJzXGS
 XB5GEa9MuBfeXkBnWiPx69hb42f8EPxGo2dHqcngZb8TnaqseB1pZvXBedC06vloArAk
 Rb3IlyrNE4fhGFF4IILiFDaOUGMGu2DZzqZN+mVaJHbkA5yrN5u97rUT9nTa4DP3F3eS
 xYtnciwBJC6pqWOJuu1ofvKy8bqxzaV8UGkxDa5BnH7MmbclYuQXRoVLcYmEORIbgOCe
 ngow==
X-Gm-Message-State: AOAM5314yovbGYlG3AdvAqOgf7mHh8hiTvztb4enLWWRnU4le9UaOQkh
 GUXA86rK+bPacRnb1VHlKjPWgGIA43iQGQ==
X-Google-Smtp-Source: ABdhPJzXaYKo35F3ikcoT+xx9+fFOXGjWzAj0gAHQC34Gu+TE1TkiRf0aC6Wt1JE6BJpEzR9jWtUPQ==
X-Received: by 2002:a63:ef45:: with SMTP id c5mr1413269pgk.513.1643256173948; 
 Wed, 26 Jan 2022 20:02:53 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 pj5sm681379pjb.0.2022.01.26.20.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 20:02:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 20:02:50 -0800
Message-Id: <20220127040250.128604-2-christian@paral.in>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220127040250.128604-1-christian@paral.in>
References: <20220127040250.128604-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/buildah: new package
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

v1 -> v2:

 - add package to developers
 - add host runc dependency for host package
 - add libgpgme runtime dependency

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/buildah/Config.in      | 23 ++++++++++++++++++++
 package/buildah/Config.in.host |  8 +++++++
 package/buildah/buildah.hash   |  3 +++
 package/buildah/buildah.mk     | 39 ++++++++++++++++++++++++++++++++++
 7 files changed, 76 insertions(+)
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
index 2ce015eacf..6aadb1b640 100644
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
index 0000000000..05bd0eec31
--- /dev/null
+++ b/package/buildah/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_BUILDAH
+	bool "buildah"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme -> libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS # runc
+	depends on BR2_USE_MMU # libgpgme -> libassuan
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc -> no fexecve
+	# gnupg and runc are not needed to build, but at runtime.
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
+	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_RUNC
+	help
+	  Buildah is a tool that facilitates building OCI images.
+
+	  https://github.com/containers/buildah
+
+comment "buildah needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/buildah/Config.in.host b/package/buildah/Config.in.host
new file mode 100644
index 0000000000..67fee6d7ac
--- /dev/null
+++ b/package/buildah/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_BUILDAH
+	bool "host buildah"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUNC
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
