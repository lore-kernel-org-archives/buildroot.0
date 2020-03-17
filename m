From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2020 16:56:30 +0100
Subject: [Buildroot] [RFC PATCH 3/5] package/docker-engine: needs some
 kernel options
In-Reply-To: <20200317155632.17649-1-francois.perrad@gadz.org>
References: <20200317155632.17649-1-francois.perrad@gadz.org>
Message-ID: <20200317155632.17649-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

according to https://wiki.gentoo.org/wiki/Docker#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 linux/linux.mk | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4b60f33ff..a83d09858 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -356,6 +356,66 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_PACKAGE_AUDIT),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
+	$(if $(BR2_PACKAGE_DOCKER_ENGINE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG_SWAP,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_CGROUP,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FAIR_GROUP_SCHED,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CFS_BANDWIDTH,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_RT_GROUP_SCHED,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_PID_CPUSET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PERF,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLOCK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_THROTTLING,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_NETMAP,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REDIRECT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCHED,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_CGROUP,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_L3_MASTER_DEV,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_NET_PRIO,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_NETCLASSID,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MD,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_DM,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MD_THIN_PROVISIONING,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_IPVLAN,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_VETH,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PERSISTENT_KEYRINGS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ENCRYPTED_KEYS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS,$(@D)/.config))
+	$(if $(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BTRFS_FS,$(@D)/.config))
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL,$(@D)/.config))
-- 
2.17.1
