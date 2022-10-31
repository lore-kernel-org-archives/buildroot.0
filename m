Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD59C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D108138E;
	Mon, 31 Oct 2022 10:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D108138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIjHpGWHxCLk; Mon, 31 Oct 2022 10:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D513A81375;
	Mon, 31 Oct 2022 10:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D513A81375
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A01381BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7799A81375
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7799A81375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiriMFqg5fB2 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:41:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBBC81361
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBBC81361
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 758008789B; Mon, 31 Oct 2022 10:41:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:39:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3975ec7d4b478ec6c1ba56b63cbb5bccfb9dd09
X-Git-Newrev: d76655c86ecc8ce302490422e8d6a286857ef36c
X-Patchwork-Hint: ignore
Message-Id: <20221031104104.758008789B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cni-plugins: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d76655c86ecc8ce302490422e8d6a286857ef36c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Container Networking Interface plugins.

https://github.com/containernetworking/plugins

Dependency of podman.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/cni-plugins/Config.in        | 16 +++++++++++
 package/cni-plugins/cni-plugins.hash |  3 +++
 package/cni-plugins/cni-plugins.mk   | 51 ++++++++++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5939361ba8..64af4deb53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -534,6 +534,7 @@ F:	package/python-pylibftdi/
 N:	Christian Stewart <christian@paral.in>
 F:	package/batman-adv/
 F:	package/catatonit/
+F:	package/cni-plugins/
 F:	package/containerd/
 F:	package/crun/
 F:	package/delve/
diff --git a/package/Config.in b/package/Config.in
index cbdaed2279..450a73d4ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1821,6 +1821,7 @@ menu "Networking"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cgic/Config.in"
+	source "package/cni-plugins/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
new file mode 100644
index 0000000000..e01cadc026
--- /dev/null
+++ b/package/cni-plugins/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CNI_PLUGINS
+	bool "cni-plugins"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU
+	help
+	  Container Networking Interface plugins.
+
+	  https://github.com/containernetworking/plugins
+
+comment "cni-plugins needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
new file mode 100644
index 0000000000..fc3b5a7ead
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
new file mode 100644
index 0000000000..b30937095a
--- /dev/null
+++ b/package/cni-plugins/cni-plugins.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# cni-plugins
+#
+################################################################################
+
+CNI_PLUGINS_VERSION = 1.1.1
+CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
+CNI_PLUGINS_LICENSE = Apache-2.0
+CNI_PLUGINS_LICENSE_FILES = LICENSE
+
+CNI_PLUGINS_BUILD_TARGETS = \
+	plugins/ipam/dhcp \
+	plugins/main/bridge \
+	plugins/main/host-device \
+	plugins/main/ipvlan \
+	plugins/main/loopback \
+	plugins/main/macvlan \
+	plugins/main/ptp \
+	plugins/main/vlan \
+	plugins/meta/bandwidth \
+	plugins/meta/firewall \
+	plugins/meta/portmap \
+	plugins/meta/tuning \
+	plugins/meta/vrf
+CNI_PLUGINS_INSTALL_BINS = $(CNI_PLUGINS_BUILD_TARGETS)
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+CNI_PLUGINS_DEPENDENCIES += libapparmor
+CNI_PLUGINS_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CNI_PLUGINS_TAGS += seccomp
+CNI_PLUGINS_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CNI_PLUGINS_TAGS += selinux
+CNI_PLUGINS_DEPENDENCIES += libselinux
+endif
+
+define CNI_PLUGINS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
+	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
+		$(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
+			$(TARGET_DIR)/opt/cni/bin
+	)
+endef
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
