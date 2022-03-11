Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE10C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 04:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10F9847DF;
	Fri, 11 Mar 2022 04:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJube12kY7x8; Fri, 11 Mar 2022 04:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20C584386;
	Fri, 11 Mar 2022 04:31:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348E31BF3A7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD1D84386
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xil_nNDuWgJp for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 04:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5035E84308
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 04:31:41 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id o26so6489132pgb.8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5aQMt2PKv3w9hLUwjRVBSfHS6zOr1ZKdSXWMJ41ZJY=;
 b=h69JJ+d3TfonFtYb0NEEnno+vSDV0GcuniP4mzGCAH5age9RNAbO+hsd66FEe1Q7aj
 e8NjFUXUQEoPF38OfvUWbKn7Ch3jvKaTGp6XW2juYMXyzhtUVKuB0kzcMUPHbO6qpBhB
 wKDabdmhpeXKi5bpfqYU+chUNvg9Wzjv/mBGvUcBQR9UJvF9acfhbWz7DkXe6Qu1758d
 Um9qx1wq1zSsSpGnzx3fbi8pkndahANCLUu5mwSKr0+torme+zZfhd/xtbW0bpQKbEmD
 GrPzT/NKfq7hkeidvdQfAPucVM1u2BifzJY9MkYpae750HDrIVA5dNTkvhkkxebuRKzz
 IpOA==
X-Gm-Message-State: AOAM533UNDT0aUawWwNTVjdDBNkt/nno2Ci1EYWoKV8RjbeZZPcmGuVG
 rHR/G5FlTAOIK5k3PYoU2v7139B3Ank=
X-Google-Smtp-Source: ABdhPJwYIlcX5BaY+LbwKOVBS0TnYMRv1IcwhecThcbGYyzgGMeCn8v2+qtgjY6pLL2inPezQ8w7ag==
X-Received: by 2002:a05:6a00:8ca:b0:4e0:2ed3:5630 with SMTP id
 s10-20020a056a0008ca00b004e02ed35630mr8272744pfu.3.1646973100426; 
 Thu, 10 Mar 2022 20:31:40 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056a00214700b004c169d45699sm8568535pfk.184.2022.03.10.20.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:31:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 20:31:37 -0800
Message-Id: <20220311043137.3210407-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/balena-engine: bump to version
 20.10.13
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/balena-os/balena-engine/blob/v20.10.13/CHANGELOG.md

Signed-off-by: Christian Stewart <christian@paral.in>
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
index 3f632ef381..1054e22550 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  389282706562118608b6ac580e7beacd6a43f0bb3481c69fb1856bed9ac49b85  balena-engine-19.03.14.tar.gz
+sha256  88254fe4a5bcb9801ba0094226de65696fc754eca8143f601c75ba2f95893d3b  balena-engine-20.10.13.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index b3eb2ca75b..402c586468 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,34 +4,33 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 19.03.14
+BALENA_ENGINE_VERSION = 20.10.13
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
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
