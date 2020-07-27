From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jul 2020 00:21:58 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: drop explicit docker
 kernel options from docker test
In-Reply-To: <20200727222158.25910-1-peter@korsgaard.com>
References: <20200727222158.25910-1-peter@korsgaard.com>
Message-ID: <20200727222158.25910-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 0390777bfaff6c6 (package/docker-engine: needs some kernel
options), docker-engine now automatically ensures the needed kernel options
are enabled, so drop the explicit options from the kernel config.

23:19:27 TestDockerCompose                        Starting
23:19:28 TestDockerCompose                        Building
00:14:41 TestDockerCompose                        Building done
00:15:30 TestDockerCompose                        Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 3362.784s

OK

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../testing/conf/docker-compose-kernel.config | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/support/testing/conf/docker-compose-kernel.config b/support/testing/conf/docker-compose-kernel.config
index 9468ef8db8..4d30a578ec 100644
--- a/support/testing/conf/docker-compose-kernel.config
+++ b/support/testing/conf/docker-compose-kernel.config
@@ -1,16 +1,7 @@
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
-CONFIG_CGROUPS=y
-CONFIG_MEMCG=y
-CONFIG_BLK_CGROUP=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_CGROUP_PIDS=y
-CONFIG_CGROUP_FREEZER=y
-CONFIG_CGROUP_DEVICE=y
-CONFIG_CGROUP_CPUACCT=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_X86_EXTENDED_PLATFORM is not set
 CONFIG_IOSF_MBI=y
@@ -38,33 +29,19 @@ CONFIG_IP_ADVANCED_ROUTER=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
-CONFIG_NETFILTER=y
-CONFIG_NF_CONNTRACK=y
 # CONFIG_NF_CONNTRACK_PROCFS is not set
 # CONFIG_NF_CT_PROTO_DCCP is not set
 # CONFIG_NF_CT_PROTO_SCTP is not set
 # CONFIG_NF_CT_PROTO_UDPLITE is not set
-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
-CONFIG_NETFILTER_XT_MATCH_IPVS=y
 CONFIG_IP_VS=y
 CONFIG_IP_VS_RR=y
 CONFIG_IP_VS_NFCT=y
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_NAT=y
-CONFIG_IP_NF_TARGET_MASQUERADE=y
-CONFIG_BRIDGE=y
 # CONFIG_BRIDGE_IGMP_SNOOPING is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
-CONFIG_MACVLAN=y
-CONFIG_VXLAN=y
-CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
 # CONFIG_ETHERNET is not set
 # CONFIG_WLAN is not set
@@ -90,12 +67,9 @@ CONFIG_VIRTIO_PCI=y
 # CONFIG_X86_PLATFORM_DEVICES is not set
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT4_FS=y
-CONFIG_OVERLAY_FS=y
-CONFIG_OVERLAY_FS_REDIRECT_DIR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 # CONFIG_NETWORK_FILESYSTEMS is not set
-CONFIG_KEYS=y
 CONFIG_SECURITYFS=y
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
-- 
2.20.1
