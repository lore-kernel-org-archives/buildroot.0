Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88704C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 00:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279014204F;
	Fri, 12 May 2023 00:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279014204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGcl5ByElGVK; Fri, 12 May 2023 00:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860D841F0B;
	Fri, 12 May 2023 00:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860D841F0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF5C01BF25F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A89F884020
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A89F884020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRzm1ufX5J9Z for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 00:25:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8495383CE6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8495383CE6
 for <buildroot@buildroot.org>; Fri, 12 May 2023 00:25:16 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so87254825ad.2
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683851116; x=1686443116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAdOhgN62qNpMveyhSQ8qLGTLmHUzt6USk5mg4QDTZE=;
 b=VCgGIxAUUDtOMWHL5xJAilXLRfgiIRAQyiaYd3maEdu/VQ3gWFjs2HXXAoROZ8FIN2
 QHQdX0+r1KYG6j0lqPUNYTsEUc0qHP3zh8v4aBdi/hGb0WqTsw1WHjIZQQp33L4/y5E2
 vo1l1uBn9KY5T0QMgGt7Km6NazMVdeGlar5AmYJwDGhEUeczxA7TWFq7u14ChMIlaaCJ
 +Ek6FA1HmdWws4WL/oe6cMUDmw7AORT2EKFkuT1P9sq3Ukni+ZvUUt1hOJ5cMxst0MVE
 APkxYof891OsfdjCNveBvq7Uif+D3Ju1cu2b6fE8Tr8TPDD2MO+Vzl8RTiN+1JIDj3W+
 esag==
X-Gm-Message-State: AC+VfDz+ooil2FNO/5T6osaZFL5gcx2N5poNtSz8n2Pq/vJglKV4RqHb
 yjjfSkLAiu0xry2HFI69N+/IW9GtlYpLdq8TGYtlYntH
X-Google-Smtp-Source: ACHHUZ7OdUBUKmWBuyGoBidRVL6+KnN3v7v+blsxOhhl/m9rqN+x/6fvGEu0DVYnp2dTGz1lk/mzdA==
X-Received: by 2002:a17:902:d68b:b0:1ab:7fb:aac1 with SMTP id
 v11-20020a170902d68b00b001ab07fbaac1mr23495337ply.24.1683851115718; 
 Thu, 11 May 2023 17:25:15 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170902e74400b001aafe56ea70sm6567969plf.5.2023.05.11.17.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 17:25:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 17:25:11 -0700
Message-Id: <20230512002511.1356447-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512002511.1356447-1-christian@aperture.us>
References: <20230512002511.1356447-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683851116; x=1686443116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAdOhgN62qNpMveyhSQ8qLGTLmHUzt6USk5mg4QDTZE=;
 b=NtTQgAhg2P9Bi3Nhn9hh7BligdAxr5KJyjFLLuxva23zXIkQvf+LZc14jEJ9OX214U
 pbgrg2iRM3eVggXv8hOCHZBC2g/i7NCFHYJLR87pdspmOKYr/GRWssV4wwylmePQoGaq
 LlzFJW8dAXMfFzeJHd1XVkxcW7JNKxAjw8gIKR8Zsc/3dflKXVybMsZGtk8e8ALJ0Efs
 o1PHsrl5ZO4OZvLHtMUOI5FJ0Ej0/bWDpG8Fa7OObkcpSHgMEz6e6FvveDs2GyevxZVb
 rSvFOq6++EKnsBbt34duRgQwv/+LpnOVatI3CJabC8pInNGf2H4Cb6lgPVh6CXXwVJfw
 YrMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=NtTQgAhg
Subject: [Buildroot] [PATCH v2 2/2] package/podman: new package
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

podman is a CLI tool for spawning and running containers according to the OCI
specification.

https://github.com/containers/podman

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - package/podman: bump version to v4.5.0
 - Add cmd/quadlet target as required by the install script.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/Config.in                     |  1 +
 package/podman/Config.in              | 55 +++++++++++++++++++
 package/podman/containers-policy.json | 14 +++++
 package/podman/podman.hash            |  3 ++
 package/podman/podman.mk              | 77 +++++++++++++++++++++++++++
 5 files changed, 150 insertions(+)
 create mode 100644 package/podman/Config.in
 create mode 100644 package/podman/containers-policy.json
 create mode 100644 package/podman/podman.hash
 create mode 100644 package/podman/podman.mk

diff --git a/package/Config.in b/package/Config.in
index 52bc10b91b..492baf25c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2684,6 +2684,7 @@ menu "System tools"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/petitboot/Config.in"
+	source "package/podman/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/podman/Config.in b/package/podman/Config.in
new file mode 100644
index 0000000000..f23435621a
--- /dev/null
+++ b/package/podman/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_PODMAN
+	bool "podman"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU # libgpgme
+	select BR2_PACKAGE_CATATONIT
+	select BR2_PACKAGE_CNI_PLUGINS
+	select BR2_PACKAGE_CONMON
+	select BR2_PACKAGE_CNI_PLUGINS
+	select BR2_PACKAGE_CRUN
+	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  podman is a CLI tool for spawning and running containers
+	  according to the OCI specification.
+
+	  https://github.com/containers/podman
+
+if BR2_PACKAGE_PODMAN
+
+config BR2_PACKAGE_PODMAN_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs filesystem driver.
+
+config BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	help
+	  Build the devicemapper filesystem driver.
+
+config BR2_PACKAGE_PODMAN_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	depends on !BR2_STATIC_LIBS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+	  Build the vfs filesystem driver.
+
+endif
+
+comment "podman needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/podman/containers-policy.json b/package/podman/containers-policy.json
new file mode 100644
index 0000000000..4480eb82b4
--- /dev/null
+++ b/package/podman/containers-policy.json
@@ -0,0 +1,14 @@
+{
+  "default": [
+    {
+    "type": "insecureAcceptAnything"
+  }
+  ],
+  "transports":
+  {
+    "docker-daemon":
+    {
+      "": [{"type":"insecureAcceptAnything"}]
+    }
+  }
+}
diff --git a/package/podman/podman.hash b/package/podman/podman.hash
new file mode 100644
index 0000000000..c011068682
--- /dev/null
+++ b/package/podman/podman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  830a633630bf6e61f2b8d4ca00efdd9a173ef25cdd49d4a4364c293e088561df  podman-4.5.0.tar.gz
+sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
new file mode 100644
index 0000000000..1df3a06616
--- /dev/null
+++ b/package/podman/podman.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# podman
+#
+################################################################################
+
+PODMAN_VERSION = 4.5.0
+PODMAN_SITE = $(call github,containers,podman,v$(PODMAN_VERSION))
+PODMAN_LICENSE = Apache-2.0
+PODMAN_LICENSE_FILES = LICENSE
+
+PODMAN_CPE_ID_VENDOR = podman_project
+PODMAN_GOMOD = github.com/containers/podman/v4
+
+PODMAN_BUILD_TARGETS = cmd/podman cmd/rootlessport cmd/quadlet
+PODMAN_DEPENDENCIES += libgpgme
+PODMAN_LDFLAGS = \
+	-X $(PODMAN_GOMOD)/libpod/define.gitCommit=$(PODMAN_VERSION)
+PODMAN_TAGS = \
+	btrfs_noversion containers_image_openpgp \
+	exclude_graphdriver_devicemapper exclude_graphdriver_zfs
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+PODMAN_TAGS += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+PODMAN_DEPENDENCIES += libapparmor
+PODMAN_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+PODMAN_TAGS += seccomp
+PODMAN_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PODMAN_TAGS += selinux
+PODMAN_DEPENDENCIES += libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_BTRFS),y)
+PODMAN_DEPENDENCIES += btrfs-progs
+else
+PODMAN_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_DEVICEMAPPER),y)
+PODMAN_DEPENDENCIES += lvm2
+else
+PODMAN_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_PODMAN_DRIVER_VFS),y)
+PODMAN_DEPENDENCIES += gvfs
+else
+PODMAN_TAGS += exclude_graphdriver_vfs
+endif
+
+define PODMAN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		install.bin
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni
+	$(INSTALL) -d -m 700 $(TARGET_DIR)/etc/cni/net.d
+	$(INSTALL) -D -m 644 $(@D)/cni/87-podman-bridge.conflist \
+		$(TARGET_DIR)/etc/cni/net.d/87-podman-bridge.conflist
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/containers
+	$(INSTALL) -D -m 644 $(PODMAN_PKGDIR)/containers-policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+endef
+
+define PODMAN_INSTALL_INIT_SYSTEMD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		install.systemd
+endef
+
+$(eval $(golang-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
