Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B4C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E82E81E51;
	Tue, 13 May 2025 11:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B81bfX-G8e6A; Tue, 13 May 2025 11:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0333381E8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0333381E8A;
	Tue, 13 May 2025 11:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0466C153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00C3B40E3B
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZwYmVxT4nZJ for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 855FE40DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855FE40DD6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 855FE40DD6
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:18 +0000 (UTC)
X-CSE-ConnectionGUID: hOpot0erSRCnCz0dxm0ZPA==
X-CSE-MsgGUID: AY6BTWPTS0qQIM/J+LMJCg==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:48:15 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 13:48:15 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 13 May 2025 13:48:14 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 13 May 2025 13:48:13 +0200
X-CSE-ConnectionGUID: 1Htg5CBASZaNFjfdvu+njA==
X-CSE-MsgGUID: /48zblNgTcusb9mIfuLf8Q==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; d="scan'208";a="289803476"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 May 2025 13:48:11 +0200
Message-ID: <484cd2c9e1c954a3c84dbb8d9d253f93ccc890ce.1747136889.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747136889.git.yann.morin@orange.com>
References: <cover.1747136889.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1747136899; x=1778672899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEWu+WC8FQ1VFbNsqngubvgAErPulYn86l+O2dA2+x8=;
 b=h19ROyvNJiXd4BrU9iUkFpLW2TWU9bQcn0vpGDz7Xytv9HuA/Uex1dca
 jnNQiObb5zSd5QGZpS94PvgTRYj5HJKyUI/F4rjRfDHYb9LIyL7Akkraj
 zQXXH6j3hgdlVWMi6fUZredDKvhWOyS9kh1qDS7ZCwjYD5SJPPVo6oIpa
 9CJTtUc/U3VGX2WN4FAE2mcO48yffMgg2MAxn0j2DhW8HpxbB37gFzQmC
 hW3U4HT3r0kTxTIV/qzxzoa6P4Jms4nH8po3bosmYOe0HGmIbY9+VgOcF
 0R/CFa2lpGPHdZ1Q0BJQvx2cJz67XmDTtupgZQfJs2biTm0pGhzU6AHqa
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=h19ROyvN
Subject: [Buildroot] [PATCH 1/3] package/containers-image-config: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The container/image repository is the standards regpository that drives
the image management in container tools, like podman or skopeo. Besides
a Go library, it also prodvides the template configuration files used
by those tools; those files can also serve as default ones.

Install those files instead of the canned ones we cary in podman, and
change podman to use this new package too.

The registry file needs a fixup, as it by default does not allow
searching unqualified images (i.e. those that do not contain a registry
name) in a default registry, for security reasons. However, the Docker
Hub is traditionally a registry that can be accessed without being
specified, so we make that possible.

As was noted in ebbaac08e3f4 (package/podman: new package), "[p]roviding
actual files is going to be use-case dependent, and interested parties
will have to provide their own config files, e.g. in a rootfs overlay."

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                             |  1 +
 package/containers-image-config/Config.in     |  8 ++++++
 .../containers-image-config.hash              |  3 +++
 .../containers-image-config.mk                | 25 +++++++++++++++++++
 package/podman/Config.in                      |  1 +
 package/podman/podman.mk                      | 10 --------
 package/podman/policy.json                    |  7 ------
 package/podman/registries.conf                |  1 -
 8 files changed, 38 insertions(+), 18 deletions(-)
 create mode 100644 package/containers-image-config/Config.in
 create mode 100644 package/containers-image-config/containers-image-config.hash
 create mode 100644 package/containers-image-config/containers-image-config.mk
 delete mode 100644 package/podman/policy.json
 delete mode 100644 package/podman/registries.conf

diff --git a/package/Config.in b/package/Config.in
index a9074ac405..c8022a91ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2835,6 +2835,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
+	source "package/containers-image-config/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
diff --git a/package/containers-image-config/Config.in b/package/containers-image-config/Config.in
new file mode 100644
index 0000000000..d40712e56d
--- /dev/null
+++ b/package/containers-image-config/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG
+	bool "containers-image-config"
+	help
+	  Install default, minimalist configuration files used by the
+	  various tools dealing with containers images, like podman,
+	  skopeo...
+
+	  https://github.com/containers/image
diff --git a/package/containers-image-config/containers-image-config.hash b/package/containers-image-config/containers-image-config.hash
new file mode 100644
index 0000000000..0159b0fc62
--- /dev/null
+++ b/package/containers-image-config/containers-image-config.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  afdbb1487571d4cc8974e11c72bc4e05043fb490cfc0581783789f414c64f87b  containers-image-config-v5.35.0-git4.tar.gz
+sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/containers-image-config/containers-image-config.mk b/package/containers-image-config/containers-image-config.mk
new file mode 100644
index 0000000000..2f03f8e8fb
--- /dev/null
+++ b/package/containers-image-config/containers-image-config.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# containers-image-config
+#
+################################################################################
+
+CONTAINERS_IMAGE_CONFIG_VERSION = v5.35.0
+CONTAINERS_IMAGE_CONFIG_SITE = https://github.com/containers/image
+CONTAINERS_IMAGE_CONFIG_SITE_METHOD = git
+
+CONTAINERS_IMAGE_CONFIG_LICENSE = Apache-2.0
+CONTAINERS_IMAGE_CONFIG_LICENSE_FILES = LICENSE
+
+define CONTAINERS_IMAGE_CONFIG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 \
+		$(@D)/default-policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+	$(INSTALL) -D -m 0644 \
+		$(@D)/registries.conf \
+		$(TARGET_DIR)/etc/containers/registries.conf
+	$(SED) '/^# unqualified-search-registries = .*/s//unqualified-search-registries = ["docker.io"]/' \
+		$(TARGET_DIR)/etc/containers/registries.conf
+endef
+
+$(eval $(generic-package))
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 4378d9918d..35d291a7e8 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_PODMAN
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
 	select BR2_PACKAGE_CONMON  # runtime
+	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_LIBSECCOMP
 	select BR2_PACKAGE_NETAVARK  # runtime
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 7ca9b9ddcb..27d9a84712 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -99,16 +99,6 @@ define PODMAN_LINUX_CONFIG_FIXUPS
 	$(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
 endef
 
-define PODMAN_CONFIG
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/policy.json \
-		$(TARGET_DIR)/etc/containers/policy.json
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/registries.conf \
-		$(TARGET_DIR)/etc/containers/registries.conf
-endef
-PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
-
 define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
 	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
diff --git a/package/podman/policy.json b/package/podman/policy.json
deleted file mode 100644
index 9333053f93..0000000000
--- a/package/podman/policy.json
+++ /dev/null
@@ -1,7 +0,0 @@
-{
-  "default": [
-    {
-      "type": "insecureAcceptAnything"
-    }
-  ]
-}
diff --git a/package/podman/registries.conf b/package/podman/registries.conf
deleted file mode 100644
index d44d892da3..0000000000
--- a/package/podman/registries.conf
+++ /dev/null
@@ -1 +0,0 @@
-unqualified-search-registries = ["docker.io"]
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
