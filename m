Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D79C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA608404E;
	Sat, 26 Feb 2022 10:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPTi-L2HiRgZ; Sat, 26 Feb 2022 10:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 146D184044;
	Sat, 26 Feb 2022 10:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51DBC1BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 405B2416AF
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwl01Fta88TH for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:42:08 +0000 (UTC)
X-Greylist: delayed 00:16:22 by SQLgrey-1.8.0
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47F04403CC
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4GYTK
 bfGyRgvIT6WvKSHeRHFRlYzY7UECwe/e/SajmQ=; b=MpRow1StGaG0Eu1HPW5t3
 xi3OfOB5mHE9icWse5hRKOX7zsO0XjlRST5IW7ZiF2QXQGzUyw75evMvSXB/oPdz
 WMvW+YLJUaqx0uU391xLK+A5XffnDYDqR2LcGRWs9W/7YefA1IDDWRBOQIke9/Nt
 bmyCGjC02BXn1b/lbS3A+Y=
Received: from localhost.localdomain (unknown [123.185.181.179])
 by smtp11 (Coremail) with SMTP id D8CowABnl48MABpifiO7AA--.17399S2;
 Sat, 26 Feb 2022 18:25:16 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 02:24:18 -0800
Message-Id: <20220226102418.943851-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: D8CowABnl48MABpifiO7AA--.17399S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4rtr4UGFyUtFWrXryDtrb_yoW7trWrpF
 Z3J3yrur40qF40yrW7Cr9I9asIqr1kGr1UJ3ZrXw1jv3WkWw42yrWDtFnYqF4UZr4xtw4x
 XFs7Jryfur4Ut3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMWlv9UUUUU=
X-Originating-IP: [123.185.181.179]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBRw2zjWDkXNIhkQAAsO
Subject: [Buildroot] [PATCH/next 1/1] package/balena-engine: bump to version
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 TIAN Yuanhao <tianyuanhao3@163.com>, Matt Weber <matthew.weber@collins.com>,
 Kyle Harding <kyle@balena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also:
- drop unused dependencies
- drop invalid tags
- drop the autogen step
- simplify kconfigs just to run hello-world

https://github.com/balena-os/balena-engine/blob/v20.10.12/CHANGELOG.md

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/balena-engine/Config.in          |  1 -
 package/balena-engine/balena-engine.hash |  2 +-
 package/balena-engine/balena-engine.mk   | 42 +++++-------------------
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
