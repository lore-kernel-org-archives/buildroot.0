Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7987C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 06:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1EB40B25;
	Thu, 27 Jan 2022 06:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCA-fsAXxzMF; Thu, 27 Jan 2022 06:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2191740B46;
	Thu, 27 Jan 2022 06:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 180091BF46D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 06:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0604340B47
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 06:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GloDL1QCXHAv for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 06:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B954540B25
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 06:25:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id h12so1918292pjq.3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xw5kHlamoTDSJVj++jCeYvIexUgK7jClV76n+nV227Y=;
 b=rP0y18xnVn3rbRd98Iz+Xd7mE1dOHjLRR3UqIchCdzx/QtDUfe9PhuY4vmkq06ytPb
 mdUHVQJDapr3bCRrASgpVOf0upcE+/z5gnxWZra5ksHUbTRKALE8BqFYNUtc451Wx+bj
 qT7Shk9c4kzOdVDxUXXkg6vSm/osFJm3o2m3RjzU4YEj/o9pJCSXI2iv4bfjUUy+68zQ
 Knb73Q2d/gst+xPTCNcIpwYAiM4RtklVlGqRAIbINi4ZgiiePqvZW+EZPN17vghj7SvS
 C8n93Gj8T37yJZJxIA964jYVODSzoiFK7hvcuepftEjVsJSnkiEcEfEgcK5RiU1IMdf4
 B2sw==
X-Gm-Message-State: AOAM53209dNaYIHk0JB/wyA6w1uA/8ylFhhsBHrS6kvv3fpDNYY0j5ow
 RlqS17Y8GUrZXJxTdWISmhgNhribKF/3/g==
X-Google-Smtp-Source: ABdhPJzFoLcPH1yGplJhUdyA2lrDNXKgKvP3g8rFZnURGbqxVZ/GbZAomMeA/nKhzwN6c5tzINqkOw==
X-Received: by 2002:a17:902:a706:: with SMTP id
 w6mr2551056plq.17.1643264708733; 
 Wed, 26 Jan 2022 22:25:08 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 q21sm4328478pfu.104.2022.01.26.22.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:25:08 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:25:04 -0800
Message-Id: <20220127062504.1835450-2-christian@paral.in>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220127062504.1835450-1-christian@paral.in>
References: <20220127062504.1835450-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/buildah: new package
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

The buildah tree does not ship with a default policy.json file, and instead
relies on packagers to provide one. A patch is added to create a basic barebones
policy.json which is installed to /etc/containers/policy.json with a hook.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - add package to developers
 - add host runc dependency for host package
 - add libgpgme runtime dependency

v2 -> v3:

 - add policy.json to target: required by some commands
 - example: buildah pull docker.io/library/alpine
 - pull: tested on raspberry pi 4

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...01-contrib-add-buildroot-policy-json.patch | 38 +++++++++++++++
 package/buildah/Config.in                     | 23 ++++++++++
 package/buildah/Config.in.host                |  8 ++++
 package/buildah/buildah.hash                  |  3 ++
 package/buildah/buildah.mk                    | 46 +++++++++++++++++++
 8 files changed, 121 insertions(+)
 create mode 100644 package/buildah/0001-contrib-add-buildroot-policy-json.patch
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
diff --git a/package/buildah/0001-contrib-add-buildroot-policy-json.patch b/package/buildah/0001-contrib-add-buildroot-policy-json.patch
new file mode 100644
index 0000000000..7a8ca57a5e
--- /dev/null
+++ b/package/buildah/0001-contrib-add-buildroot-policy-json.patch
@@ -0,0 +1,38 @@
+From 6808cfa788f03fca36a41202d9475ee5bc9feac7 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Wed, 26 Jan 2022 22:07:09 -0800
+Subject: [PATCH] contrib: add buildroot policy json
+
+Buildah does not ship a default policy.json in-tree.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ contrib/buildroot/policy.json | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+ create mode 100644 contrib/buildroot/policy.json
+
+diff --git a/contrib/buildroot/policy.json b/contrib/buildroot/policy.json
+new file mode 100644
+index 00000000..d8c638a0
+--- /dev/null
++++ b/contrib/buildroot/policy.json
+@@ -0,0 +1,16 @@
++{
++  "default": [
++    {
++      "type": "insecureAcceptAnything"
++    }
++  ],
++  "transports": {
++    "docker-daemon": {
++      "": [
++        {
++          "type": "insecureAcceptAnything"
++        }
++      ]
++    }
++  }
++}
+-- 
+2.35.0
+
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
index 0000000000..658d7ef56f
--- /dev/null
+++ b/package/buildah/buildah.mk
@@ -0,0 +1,46 @@
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
+define BUILDAH_INSTALL_CONFIG
+	$(INSTALL) -D -m 644 $(@D)/contrib/buildroot/policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+endef
+
+BUILDAH_POST_INSTALL_TARGET_HOOKS += BUILDAH_INSTALL_CONFIG
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
