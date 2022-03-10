Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D236C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBC6418FB;
	Thu, 10 Mar 2022 20:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPCsT0lFAnuI; Thu, 10 Mar 2022 20:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA2E41911;
	Thu, 10 Mar 2022 20:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23F281BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A821384776
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKEvHDGt9cUY for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:58:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EBDE84306
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:58:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 91DB083BF6; Thu, 10 Mar 2022 20:49:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:53:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff6d4778c270d612e5338a9a5f93f84f7cf3e4f4
X-Git-Newrev: 046739df7ef1e704889a24a7e0886865dd32e0b9
X-Patchwork-Hint: ignore
Message-Id: <20220310204935.91DB083BF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/balena-engine: bump to version
 20.10.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=046739df7ef1e704889a24a7e0886865dd32e0b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
- drop unused dependencies
- drop invalid tags
- drop the autogen step
- simplify kconfigs just to run hello-world

https://github.com/balena-os/balena-engine/blob/v20.10.12/CHANGELOG.md

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/balena-engine/Config.in          |  1 -
 package/balena-engine/balena-engine.hash |  2 +-
 package/balena-engine/balena-engine.mk   | 42 ++++++--------------------------
 3 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
index f48f361dc2..02f694515e 100644
--- a/package/balena-engine/Config.in
+++ b/package/balena-engine/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_BALENA_ENGINE
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
 	select BR2_PACKAGE_IPTABLES # runtime
-	select BR2_PACKAGE_SQLITE # runtime
 	select BR2_PACKAGE_UTIL_LINUX # runtime
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 3f632ef381..ef590881f5 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  389282706562118608b6ac580e7beacd6a43f0bb3481c69fb1856bed9ac49b85  balena-engine-19.03.14.tar.gz
+sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index b3eb2ca75b..0afcea3d7e 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,34 +4,33 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 19.03.14
+BALENA_ENGINE_VERSION = 20.10.12
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
 BALENA_ENGINE_LICENSE_FILES = LICENSE
 
-BALENA_ENGINE_DEPENDENCIES = host-pkgconf
 BALENA_ENGINE_GOMOD = github.com/docker/docker
 
 BALENA_ENGINE_LDFLAGS = \
-	-X github.com/docker/cli/cli/version.Version=N/A \
-	-X github.com/docker/cli/cli/version.GitCommit= \
-	-X github.com/docker/cli/cli/version.BuildTime= \
+	-X $(BALENA_ENGINE_GOMOD)/dockerversion.GitCommit= \
+	-X $(BALENA_ENGINE_GOMOD)/dockerversion.Version=$(BALENA_ENGINE_VERSION) \
 	-X github.com/containerd/containerd/version.Version=N/A \
+	-X github.com/docker/cli/cli/version.BuildTime= \
+	-X github.com/docker/cli/cli/version.GitCommit= \
+	-X github.com/docker/cli/cli/version.Version=N/A \
 	-X github.com/opencontainers/runc.version=N/A
 
 BALENA_ENGINE_TAGS = \
 	cgo \
-	exclude_graphdriver_zfs \
-	autogen \
-	no_buildkit \
 	no_btrfs \
 	no_cri \
 	no_devmapper \
 	no_zfs \
 	exclude_disk_quota \
 	exclude_graphdriver_btrfs \
-	exclude_graphdriver_devicemapper
+	exclude_graphdriver_devicemapper \
+	exclude_graphdriver_zfs
 
 BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
 
@@ -40,16 +39,6 @@ BALENA_ENGINE_DEPENDENCIES += systemd
 BALENA_ENGINE_TAGS += journald
 endif
 
-define BALENA_ENGINE_RUN_AUTOGEN
-	cd $(@D) && \
-		VERSION=$(BALENA_ENGINE_VERSION) \
-		PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY) \
-		$(TARGET_MAKE_ENV) \
-		$(SHELL) hack/make/.go-autogen
-endef
-
-BALENA_ENGINE_POST_CONFIGURE_HOOKS += BALENA_ENGINE_RUN_AUTOGEN
-
 define BALENA_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/contrib/init/systemd/balena-engine.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/balena-engine.service
@@ -64,35 +53,20 @@ endef
 define BALENA_ENGINE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
 endef
 
 define BALENA_ENGINE_INSTALL_SYMLINK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
