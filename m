Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16305C3ABCC
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2AE381F64;
	Tue, 13 May 2025 11:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVQ96WaUC-Bo; Tue, 13 May 2025 11:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C86881EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C86881EC1;
	Tue, 13 May 2025 11:48:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF11153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145A340DD6
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSsh0YUPXRjo for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C9FF40DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C9FF40DD4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C9FF40DD4
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:21 +0000 (UTC)
X-CSE-ConnectionGUID: Xfxkwwk/SsimN0IIqooRlQ==
X-CSE-MsgGUID: nZ2fwMjeTcSbosb2Vzdb/A==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:48:18 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 13:48:18 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 13 May 2025 13:48:17 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 13 May 2025 13:48:17 +0200
X-CSE-ConnectionGUID: z6xMIBqiTJa5mV+DKdkLoA==
X-CSE-MsgGUID: XH3Z2YL6SB6KrNaBDnZscg==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; d="scan'208";a="289271268"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Tue, 13 May 2025 13:48:13 +0200
Message-ID: <8d15f6761c6d86fb4b04c3209970e1a6cc803d78.1747136889.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747136889.git.yann.morin@orange.com>
References: <cover.1747136889.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1747136901; x=1778672901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUeJSzBoHUNPXB98AKDR0CoMTk3biDPwhnnhfNlyibE=;
 b=jczp2NRD4M00RJUuWDjtmTBTfGpPVB0ZMWX/fGS1mGLYZwZaK75GWo4F
 FIR0HVJ5Tw+lZR+2q6cQ6zLD4MF6BzIJ2GuilDoOEhMdZ+FB8MY0yToYI
 1p5l+8a2FBJ3oBpBM4ceanAu/HHlcYobpXvPr8rh6iFZwX9HyjJQgZViZ
 fp8GAsBdaKeiK4ubZfTCNmXsh7WzNnYU8YkbHHDpKenv1kD9TmiGV+TmO
 lhV/VV+0K3notC06RnHEwx06UB09aEJfz6CvMCGblsTrQBCOhE1tx8z1n
 SWTQM1lAN+/p3+6uR9xgIG8FlaSg3M3XJadRR/UM2yFQxAMQD8HjyvTAK
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=jczp2NRD
Subject: [Buildroot] [PATCH 3/3] package/distribution-registry: new package
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

This package provides a reference, functional implementation of a
registry for distributing container images. Formerly the Docker
registry, it now also handles OCI images, so can be used to distribute
all kinds of container related images: classic Docker images, OCI
images, but also helms [0] and the likes, which are also packages as OCI
images in fact.

The upstream name of the package is just "distribution" [1], but this is
a bit too generic and unsearchable; distributions like Debian and Ubuntu
traditionally provides it as the "docker-registry" package, but this is
now misleading as it is not just for Docker anymore. So we decided to
name it "distribution-registry": it contains the upstream name and will
be searchable with the 'registry' part as well.

The built executable is named "registry", which is also a bit too
generic. Again, for the same reasons as above, we name it
"distribution-registry"; this also incidentally makes our golang-package
infra "just work" and do the right thing when it installs the package.

The upstream package provides a wrapper Makefile to build the package,
but it does not do more than our infra already does; the only little nit
is that it allows updating the version file (with git infra et al.). We
can just ignore that and update the version ourselves.

We also provide a minimalist configuration file: it exposes the registry
to localhost only, as a security measure. This file will have to be
overridden (e.g. in a rootfs-overlay) with proper authentication, and
with further locally meaningful setup anyway.

Finally, we also implement a run-time test that validates that we can
push and pull images to/from the registry. Since the registry is a big
go package, it takes time to start, so wait for it a little bit (and yet
a little bit more after it starts logging), and increase the timeouts
for commands that deal with the registry.

For this simple test, the registry is directly exposed with plain HTTP,
not HTTPS, so we must declare it as insecure, so that container tools
can reach it without custom options (e.g. without using skopeo's
--{src,dest}-tls-verify=false options).

We re-use skopeo to talk to the registry. This allows us to grab an
image from the Docker hub registry, and push it to our local registry,
then retrieve it back. Since we want to diffferentiate failures to grab
the image from the Docker Hub [2], from failures to push to our
registry, we do it in two steps: copy from Docker Hub to a local OCI
image, then push that to our registry.

Since both distribution-registry and skopeo are big go-based, statically
linked binaries, running both in the standard virtual machine does not
work: the 256MiB emulated in vexpress are not enough and cause segfaults
when running both at once. The vexpress also only accepts at most
256MiB, so we must use another machine; we decided to use the same as is
used by the podman teest case, which allows at least 1Gib, which is now
enough.

[0] https://helm.sh/
[1] https://github.com/distribution/distribution
[2] in case we reach the 100-pulls-a-day limitation

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/Config.in                             |  1 +
 package/distribution-registry/Config.in       | 17 ++++
 package/distribution-registry/config.yml      | 13 +++
 .../distribution-registry.hash                |  3 +
 .../distribution-registry.mk                  | 51 +++++++++++
 .../distribution-registry.service             | 10 +++
 .../package/test_distribution_registry.py     | 88 +++++++++++++++++++
 7 files changed, 183 insertions(+)
 create mode 100644 package/distribution-registry/Config.in
 create mode 100644 package/distribution-registry/config.yml
 create mode 100644 package/distribution-registry/distribution-registry.hash
 create mode 100644 package/distribution-registry/distribution-registry.mk
 create mode 100644 package/distribution-registry/distribution-registry.service
 create mode 100644 support/testing/tests/package/test_distribution_registry.py

diff --git a/package/Config.in b/package/Config.in
index c8022a91ec..1f9f3298c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2846,6 +2846,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/distribution-registry/Config.in"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
diff --git a/package/distribution-registry/Config.in b/package/distribution-registry/Config.in
new file mode 100644
index 0000000000..af650171b1
--- /dev/null
+++ b/package/distribution-registry/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DISTRIBUTION_REGISTRY
+	bool "distribution-registry"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	help
+	  The toolkit to pack, ship, store, and deliver container
+	  content.
+
+	  The goal of this project is to provide a simple, secure, and
+	  scalable base for building a large scale registry solution or
+	  running a simple private registry. It is a core library for
+	  many registry operators including Docker Hub, GitHub Container
+	  Registry, GitLab Container Registry and DigitalOcean Container
+	  Registry, as well as the CNCF Harbor Project, and VMware
+	  Harbor Registry.
+
+	  https://github.com/distribution/distribution
diff --git a/package/distribution-registry/config.yml b/package/distribution-registry/config.yml
new file mode 100644
index 0000000000..77944827a5
--- /dev/null
+++ b/package/distribution-registry/config.yml
@@ -0,0 +1,13 @@
+version: 0.1
+storage:
+  cache:
+    blobdescriptor: inmemory
+  filesystem:
+    rootdirectory: /var/lib/docker-registry
+  delete:
+    enabled: true
+http:
+  addr: 127.0.0.1:5000
+  net: tcp
+  headers:
+    X-Content-Type-Options: [nosniff]
diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
new file mode 100644
index 0000000000..38d7b5a487
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
new file mode 100644
index 0000000000..e78fab2206
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# distribution-registry
+#
+################################################################################
+
+DISTRIBUTION_REGISTRY_VERSION = v3.0.0
+DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
+DISTRIBUTION_REGISTRY_SITE_METHOD = git
+
+DISTRIBUTION_REGISTRY_LICENSE = Apache-2.0
+DISTRIBUTION_REGISTRY_LICENSE_FILES = LICENSE
+
+DISTRIBUTION_REGISTRY_GOMOD = github.com/distribution/distribution/v3
+
+DISTRIBUTION_REGISTRY_BUILD_TARGETS = cmd/registry
+
+# Inject the version as if done by upstream's wrapper Makefile
+define DISTRIBUTION_REGISTRY_SET_VERSION
+	$(SED) 's/^var version = ".*"$$/var version = "$(DISTRIBUTION_REGISTRY_VERSION)"/' \
+		$(@D)/version/version.go
+endef
+DISTRIBUTION_REGISTRY_PRE_CONFIGURE_HOOKS += DISTRIBUTION_REGISTRY_SET_VERSION
+
+# distribution-registry builds the 'registry' executable, but that name is
+# a bit too generic. Rename it to match the package name; this has the nice
+# side effect that it will be automatically picked up for install by the
+# golang-package infra.
+define DISTRIBUTION_REGISTRY_RENAME
+	mv $(@D)/bin/registry $(@D)/bin/distribution-registry
+endef
+DISTRIBUTION_REGISTRY_POST_BUILD_HOOKS += DISTRIBUTION_REGISTRY_RENAME
+
+define DISTRIBUTION_REGISTRY_CONFIG
+	$(INSTALL) -m 0644 -D \
+		$(DISTRIBUTION_REGISTRY_PKGDIR)/config.yml \
+		$(TARGET_DIR)/etc/docker/registry/config.yml
+endef
+DISTRIBUTION_REGISTRY_POST_INSTALL_TARGET_HOOKS += DISTRIBUTION_REGISTRY_CONFIG
+
+define DISTRIBUTION_REGISTRY_USERS
+	distribution-registry -1 distribution-registry -1 * - - - Distribution registry
+endef
+
+define DISTRIBUTION_REGISTRY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D \
+		$(DISTRIBUTION_REGISTRY_PKGDIR)/distribution-registry.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/distribution-registry.service
+endef
+
+$(eval $(golang-package))
diff --git a/package/distribution-registry/distribution-registry.service b/package/distribution-registry/distribution-registry.service
new file mode 100644
index 0000000000..767786bc99
--- /dev/null
+++ b/package/distribution-registry/distribution-registry.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Distribution registry
+After=network.target
+
+[Service]
+User=distribution-registry
+ExecStart=/usr/bin/distribution-registry serve /etc/docker/registry/config.yml
+
+[Install]
+WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
new file mode 100644
index 0000000000..c5af5d849d
--- /dev/null
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -0,0 +1,88 @@
+import infra.basetest
+import json
+import os
+import time
+
+
+class TestDistributionRegistry(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_DISTRIBUTION_REGISTRY=y
+        BR2_PACKAGE_SKOPEO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv5",
+            kernel=kernel_file,
+            kernel_cmdline=[
+                'console=ttyAMA0',
+            ],
+            options=[
+                '-M', 'vexpress-a9',
+                "-m", "1G",
+                "-nic", "user,model=lan9118",
+                "-dtb", dtb_file,
+                "-initrd", cpio_file,
+            ],
+        )
+        self.emulator.login()
+
+        # Allow unfettered access to the local registry:
+        self.assertRunOk("mkdir /etc/containers/registries.conf.d")
+        self.assertRunOk("printf '[[registry]]\\nlocation = \"localhost:5000\"\\ninsecure = true\\n' >/etc/containers/registries.conf.d/localhost.conf")
+
+        # Check we can at least run
+        self.assertRunOk("distribution-registry --version", timeout=30)
+
+        # Spawn the registry and wait for it to be ready
+        self.assertRunOk(
+            "distribution-registry serve /etc/docker/registry/config.yml >/tmp/registry.log 2>&1 &",
+        )
+        for i in range(60):
+            time.sleep(1)
+            _, ret = self.emulator.run("test -s /tmp/registry.log")
+            if ret == 0:
+                time.sleep(2)  # Wait just a little tiny bit more...
+                break
+        else:
+            raise SystemError("Cannot start the registry")
+
+        # Get a multi-arch image from the Docker hub registry
+        # Huge timeout because qemu-system-arm has slirp issues
+        self.assertRunOk(
+            "skopeo copy -a docker://busybox:1.37.0-glibc oci-archive:busybox-1.37.0-glibc.oci",
+            timeout=600,
+        )
+
+        # Push the multi-arch image to the local registry
+        self.assertRunOk(
+            "skopeo copy -a oci-archive:busybox-1.37.0-glibc.oci docker://localhost:5000/busybox:1.37.0-glibc",
+            timeout=120,
+        )
+
+        # Pull the image back
+        self.assertRunOk(
+            "skopeo copy -a docker://localhost:5000/busybox:1.37.0-glibc oci-archive:busybox-1.37.0-glibc-2.oci",
+            timeout=120,
+        )
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
