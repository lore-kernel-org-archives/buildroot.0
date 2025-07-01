Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A577FC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 13:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E406115A;
	Tue,  1 Jul 2025 13:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Nbt3OIujmGN; Tue,  1 Jul 2025 13:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2EF611E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2EF611E0;
	Tue,  1 Jul 2025 13:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E79A197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4080041CF7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuVweVqkf2YW for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 13:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06D8B40D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D8B40D31
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06D8B40D31
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:45:58 +0000 (UTC)
X-CSE-ConnectionGUID: 6c9xoH5xS3Ohb4cTtRiOLQ==
X-CSE-MsgGUID: NP/xnHxdQ/GXbV8DRwMSRw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:45:56 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 15:45:56 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 15:45:54 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 15:45:54 +0200
X-CSE-ConnectionGUID: ZvQOR+S9Q+KOnrGcuB0w2Q==
X-CSE-MsgGUID: LDa5MC8nQL2Ygcy3sPjE3g==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="304286190"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 1 Jul 2025 15:45:50 +0200
Message-ID: <c7c6c70e144a4605161a0aafe77f433d194aa09b.1751377540.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751377540.git.yann.morin@orange.com>
References: <cover.1751377540.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751377559; x=1782913559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQSnuNJTi+A8gbKJV2hlhpAzeTWBP1xQ+kbuWoBKgAg=;
 b=BhOGpI7GsPUbJOuTxjjGAci35hNeBWFGEbNpWPDpun+nqkJOhRw5w6Z2
 G701QmtZEBnkx2T7fga1KNkc28y5AuZKxHRXv9Yl9UfXE5NKGbE+ABgYq
 33Q3Sv8jSA4o53ZbHvq+VJePkMkok+TJWpIFgFB4uYXRuuci0B9QSBHY1
 aojX1/AncoXGWKfW0RyoRnA/A6HKUM9cVw+BhY/gXoyig5mlQu979VysM
 mS4wndxnGrQsfIGUdZEzYJKWujfdEVy6abuxO7+2QzTcN8x6p3NJ00Bkj
 1CsACBl8S2bRyMbdP6Hep/Bn9lsQhFrKOlmJuH9nxNmsIZdUVQ+RsxLiT
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=BhOGpI7G
Subject: [Buildroot] [PATCH 2/4 v2] package: drop default _INSTALL_BINS in
 golang-package
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

Now that the pkg-golang infra automatically sets _INSTALL_BINS by
default to the list of notdir of _BUILD_TARGETS, there is no need to do
that in packages anymore.

Most packages were already using the notdir construct, so those are
trivially fixed; a few had a hard-coded list that matched the built
targets list, so they too are trivially fixed.

host-mender-artifact was slightly different, in that it explicitly set
the _BIN_NAME to mender-artifact, which happens to be the default; it
also set _INSTALL_BINS to _BIN_NAME, so again using the default. This
package can also be fixed easily.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>

---
Changes v1 -> v2:
  - account for distribution-registry, new package added after v1 was
    posted
---
 .../amazon-ecr-credential-helper.mk                           | 1 -
 package/containerd/containerd.mk                              | 1 -
 package/delve/delve.mk                                        | 2 --
 package/distribution-registry/distribution-registry.mk        | 1 -
 package/docker-cli/docker-cli.mk                              | 2 --
 package/docker-engine/docker-engine.mk                        | 2 --
 package/mender-artifact/mender-artifact.mk                    | 3 ---
 package/moby-buildkit/moby-buildkit.mk                        | 4 ----
 package/tailscale/tailscale.mk                                | 1 -
 9 files changed, 17 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index acfeea16fb..ad75ed3360 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -15,6 +15,5 @@ AMAZON_ECR_CREDENTIAL_HELPER_SUBDIR = ecr-login
 
 AMAZON_ECR_CREDENTIAL_HELPER_GOMOD = ./cli
 AMAZON_ECR_CREDENTIAL_HELPER_BUILD_TARGETS = docker-credential-ecr-login
-AMAZON_ECR_CREDENTIAL_HELPER_INSTALL_BINS = docker-credential-ecr-login
 
 $(eval $(golang-package))
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 1f70a26ebf..2ef70ab5d7 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -20,7 +20,6 @@ CONTAINERD_BUILD_TARGETS = \
 	cmd/containerd-shim-runc-v2 \
 	cmd/ctr
 
-CONTAINERD_INSTALL_BINS = $(notdir $(CONTAINERD_BUILD_TARGETS))
 CONTAINERD_TAGS = no_aufs
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 408286e3b4..8206721fe2 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -12,11 +12,9 @@ DELVE_DEPENDENCIES = host-pkgconf
 
 DELVE_TAGS = cgo
 DELVE_BUILD_TARGETS = cmd/dlv
-DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
 
 HOST_DELVE_TAGS = cgo
 HOST_DELVE_BUILD_TARGETS = cmd/dlv
-HOST_DELVE_INSTALL_BINS = $(notdir $(HOST_DELVE_BUILD_TARGETS))
 
 $(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index 901b9c40e5..a01a3c1710 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -18,7 +18,6 @@ DISTRIBUTION_REGISTRY_BUILD_TARGETS = cmd/registry
 # distribution-registry builds and installs the 'registry' executable, but
 # that name is a bit too generic. Rename it to match the package name.
 DISTRIBUTION_REGISTRY_BIN_NAME = distribution-registry
-DISTRIBUTION_REGISTRY_INSTALL_BINS = distribution-registry
 
 # Inject the version as if done by upstream's wrapper Makefile
 define DISTRIBUTION_REGISTRY_SET_VERSION
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index e118481838..7386b007cd 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -38,6 +38,4 @@ define DOCKER_CLI_FIX_VENDORING
 endef
 DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
 
-DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
-
 $(eval $(golang-package))
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c39dc2b440..181975b26b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -70,8 +70,6 @@ define DOCKER_ENGINE_FIX_VENDORING
 endef
 DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
 
-DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index bcab91890a..7d6f0929e2 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -115,7 +115,4 @@ HOST_MENDER_ARTIFACT_GO_ENV += \
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
-HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
-HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
-
 $(eval $(host-golang-package))
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 91560c1ed1..4ae1abde3a 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -17,12 +17,8 @@ MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
 MOBY_BUILDKIT_LDFLAGS = \
 	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
 
-MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
-
 HOST_MOBY_BUILDKIT_TAGS = cgo
 HOST_MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
 
-HOST_MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(HOST_MOBY_BUILDKIT_BUILD_TARGETS))
-
 $(eval $(golang-package))
 $(eval $(host-golang-package))
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 7019b9afc9..8f25b0cbd1 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -10,7 +10,6 @@ TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
-TAILSCALE_INSTALL_BINS = tailscale tailscaled
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
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
