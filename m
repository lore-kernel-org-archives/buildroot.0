Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E61C35FF3
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F96583F27;
	Tue, 18 Mar 2025 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbC1v8Seyd4d; Tue, 18 Mar 2025 15:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A9083F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2A9083F34;
	Tue, 18 Mar 2025 15:06:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2092BD5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F8FF81E70
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB7sxHHwO9eF for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8A181B10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B8A181B10
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E82B8713E; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:16:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2795fecc50ca91d7303ae817cdfa260eabd0975e
X-Git-Newrev: 7289731adf333e92e43b53d5665fc296214befb5
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.7E82B8713E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netavark: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7289731adf333e92e43b53d5665fc296214befb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in              |  1 +
 package/netavark/Config.in     | 12 ++++++
 package/netavark/netavark.hash |  3 ++
 package/netavark/netavark.mk   | 92 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7d8540869d..2e081b84d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2560,6 +2560,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netavark/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
new file mode 100644
index 0000000000..cf7b731141
--- /dev/null
+++ b/package/netavark/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NETAVARK
+	bool "netavark"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_IPTABLES if !BR2_PACKAGE_NFTABLES  # runtime
+	select BR2_PACKAGE_NFTABLES_JSON if BR2_PACKAGE_NFTABLES && !BR2_PACKAGE_IPTABLES
+	help
+	  Netavark is a rust based network stack for containers. It
+	  is being designed to work with Podman but is also applicable
+	  for other OCI container management applications.
+
+	  https://github.com/containers/netavark
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
new file mode 100644
index 0000000000..585763be42
--- /dev/null
+++ b/package/netavark/netavark.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  09471bd116fdebfd3f7a8100b37809e3a306d0f18e5feee8445ed1e01a22e0aa  netavark-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
new file mode 100644
index 0000000000..c96912ef5a
--- /dev/null
+++ b/package/netavark/netavark.mk
@@ -0,0 +1,92 @@
+################################################################################
+#
+# netavark
+#
+################################################################################
+
+NETAVARK_VERSION = v1.14.0
+NETAVARK_SITE = https://github.com/containers/netavark
+NETAVARK_SITE_METHOD = git
+
+NETAVARK_LICENSE = Apache-2.0
+NETAVARK_LICENSE_FILES = LICENSE
+
+# For protoc
+NETAVARK_DEPENDENCIES = host-protobuf
+
+NETAVARK_CARGO_ENV = PROTOC=$(HOST_DIR)/bin/protoc
+
+# In case only nftables is enabled, use that as the firwewall backend
+ifeq ($(BR2_PACKAGE_IPTABLES).$(BR2_PACKAGE_NFTABLES),.y)
+define NETAVARK_CONFIG_NFTABLES
+	$(Q)mkdir -p $(TARGET_DIR)/etc/containers/containers.conf.d/
+	printf '[network]\nfirewall_driver = "nftables"\n' \
+		> $(TARGET_DIR)/etc/containers/containers.conf.d/50-buildroot-nftables.conf
+endef
+NETAVARK_POST_INSTALL_TARGET_HOOKS += NETAVARK_CONFIG_NFTABLES
+
+# See https://github.com/containers/netavark/issues/1057#issuecomment-2286149984
+define NETAVARK_LINUX_CONFIG_FIXUPS_NFTABLES
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NUMGEN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FLOW_OFFLOAD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CONNLIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TUNNEL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUOTA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FWD_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT_ARP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_META)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_REJECT)
+endef
+endif
+
+define NETAVARK_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_COMMENT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
+	$(NETAVARK_LINUX_CONFIG_FIXUPS_NFTABLES)
+endef
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
