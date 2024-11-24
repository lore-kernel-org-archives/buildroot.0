Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31F0E6688F
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 00:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989D9600B6;
	Sun, 24 Nov 2024 00:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_2stuGMDCq7; Sun, 24 Nov 2024 00:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0B8606A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0B8606A5;
	Sun, 24 Nov 2024 00:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A68061D8B
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5B041C96
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z52pUJlaZRmu for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 00:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6445841C08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6445841C08
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:33:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 465C186584; Sun, 24 Nov 2024 00:33:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Nov 2024 01:31:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eafbd991485ded874e1df8cda0fd9ecfa2ccde6f
X-Git-Newrev: c0a5fcf781f4dceb85e6a5c5a98b2ff373ff245f
X-Patchwork-Hint: ignore
Message-Id: <20241124003323.465C186584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/quagga: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0a5fcf781f4dceb85e6a5c5a98b2ff373ff245f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The upstream git repo and download location is gone and the package hasn't
seen any version updates since 2019. It was also dropped from Debian:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1000216

So drop the package here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   3 -
 Config.in.legacy                                   |   9 ++
 package/Config.in                                  |   1 -
 package/olsr/olsr.mk                               |   2 -
 package/quagga/0001-fix-ipctl-forwarding.patch     |  27 -----
 .../0002-lib-prefix.h-fix-build-with-gcc-10.patch  |  36 ------
 package/quagga/0003-Fix-build-with-gcc-10.patch    | 127 ---------------------
 package/quagga/Config.in                           |  95 ---------------
 package/quagga/quagga.hash                         |   5 -
 package/quagga/quagga.mk                           | 114 ------------------
 package/quagga/quagga@.service                     |  17 ---
 package/quagga/quagga_tmpfiles.conf                |   1 -
 12 files changed, 9 insertions(+), 428 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 959bb822d3..f897565718 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1097,9 +1097,6 @@ package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.
 package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch lib_patch.Upstream
 package/qt5/qt5webkit/0006-Warnings-due-to-AppSinkCallbacks-struct-growth-https.patch lib_patch.Upstream
 package/qt5cinex/0001-Fix-execution-problem-with-Qt5.3.patch lib_patch.Upstream
-package/quagga/0001-fix-ipctl-forwarding.patch lib_patch.Upstream
-package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/quagga/0003-Fix-build-with-gcc-10.patch lib_patch.Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 63360b42b8..aa10573c23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02"
+
+config BR2_PACKAGE_QUAGGA
+	bool "quagga has been removed"
+	select BR2_LEGACY
+	help
+	  The quagga package was removed as it is not maintained
+	  anymore and the upstream repo is gone.
+
 comment "Legacy options removed in 2024.11"
 
 config BR2_PACKAGE_BSDIFF
diff --git a/package/Config.in b/package/Config.in
index 278c82bb05..83fc6c906d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2616,7 +2616,6 @@ endif
 	source "package/ptpd2/Config.in"
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
-	source "package/quagga/Config.in"
 	source "package/radvd/Config.in"
 	source "package/reaver/Config.in"
 	source "package/redir/Config.in"
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 4ad88991f2..4b0968cd7d 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -8,8 +8,6 @@ OLSR_VERSION = 0.9.8
 OLSR_SITE = $(call github,OLSR,olsrd,v$(OLSR_VERSION))
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice netjson poprouting p2pd pgraph secure txtinfo watchdog
-# Doesn't really need quagga but not very useful without it
-OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
 OLSR_LICENSE = BSD-3-Clause
 OLSR_LICENSE_FILES = license.txt
 OLSR_DEPENDENCIES = host-flex host-bison
diff --git a/package/quagga/0001-fix-ipctl-forwarding.patch b/package/quagga/0001-fix-ipctl-forwarding.patch
deleted file mode 100644
index e2e3421edb..0000000000
--- a/package/quagga/0001-fix-ipctl-forwarding.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Add definitions for IPCTL_FORWARDING and IP6CTL_FORWARDING.
-
-Inspired from
-http://svn.gnumonks.org/trunk/grouter/build/src/quagga/quagga/quagga-0.99.1-forward_sysctl-2.6.14.patch
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: quagga-0.99.16/zebra/ipforward_sysctl.c
-===================================================================
---- quagga-0.99.16.orig/zebra/ipforward_sysctl.c	2010-06-20 23:40:45.000000000 +0200
-+++ quagga-0.99.16/zebra/ipforward_sysctl.c	2010-06-20 23:41:37.000000000 +0200
-@@ -31,6 +31,15 @@
- 
- #define MIB_SIZ 4
- 
-+/* Fix for recent (2.6.14) kernel headers */
-+#ifndef IPCTL_FORWARDING
-+#define IPCTL_FORWARDING NET_IPV4_FORWARD
-+#endif
-+
-+#ifndef IP6CTL_FORWARDING
-+#define IP6CTL_FORWARDING NET_IPV6_FORWARDING
-+#endif
-+
- extern struct zebra_privs_t zserv_privs;
- 
- /* IPv4 forwarding control MIB. */
diff --git a/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch b/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index f2fc9cc647..0000000000
--- a/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 01bcd0f7411f86eea44247bf91b48882cae35519 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 21 Sep 2020 23:12:25 +0200
-Subject: [PATCH] lib/prefix.h: fix build with gcc 10
-
-Remove __packed to fix the following build failure with gcc 10 (which
-defaults to -fno-common):
-
-  CCLD     libzebra.la
-/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: .libs/sockunion.o:(.bss+0x0): multiple definition of `__packed'; .libs/vty.o:(.bss+0x6c): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/82b15cff3f7b943eb93d8270790f1b8561d31d6a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugzilla.quagga.net/show_bug.cgi?id=1014]
----
- lib/prefix.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/prefix.h b/lib/prefix.h
-index 2cf0b20b..a5306eee 100644
---- a/lib/prefix.h
-+++ b/lib/prefix.h
-@@ -44,7 +44,7 @@
-  */
- struct ethaddr {
-     u_char octet[ETHER_ADDR_LEN];
--} __packed;
-+};
- 
- 
- /*
--- 
-2.28.0
-
diff --git a/package/quagga/0003-Fix-build-with-gcc-10.patch b/package/quagga/0003-Fix-build-with-gcc-10.patch
deleted file mode 100644
index fbe85165ee..0000000000
--- a/package/quagga/0003-Fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 7a446434302d7b71211b81b3c6cd12a7b35223d1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Mar 2021 16:28:37 +0100
-Subject: [PATCH] Fix build with gcc 10
-
-Fix the following build failure with gcc 10 (which defaults to
--fno-common):
-
-  CCLD     pimd
-/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pimd.o:(.bss+0x8): multiple definition of `qpim_static_route_list'; pim_main.o:(.bss+0x8): first defined here
-/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pimd.o:(.bss+0x28): multiple definition of `qpim_mroute_del_last'; pim_main.o:(.bss+0x10): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/fd5ee2b52a3cfaec268fafd3ffe4c30e51465c7e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugzilla.quagga.net/show_bug.cgi?id=1014]
----
- pimd/pim_version.h |  2 +-
- pimd/pimd.c        |  1 +
- pimd/pimd.h        | 66 +++++++++++++++++++++++-----------------------
- 3 files changed, 35 insertions(+), 34 deletions(-)
-
-diff --git a/pimd/pim_version.h b/pimd/pim_version.h
-index ef9f370c..891d4314 100644
---- a/pimd/pim_version.h
-+++ b/pimd/pim_version.h
-@@ -25,6 +25,6 @@
- 
- #define PIMD_VERSION_STR "0.166"
- 
--const char * const PIMD_VERSION;
-+extern const char * const PIMD_VERSION;
- 
- #endif /* PIM_VERSION_H */
-diff --git a/pimd/pimd.c b/pimd/pimd.c
-index 97fb2233..d7340cc0 100644
---- a/pimd/pimd.c
-+++ b/pimd/pimd.c
-@@ -50,6 +50,7 @@ int64_t                   qpim_mroute_socket_creation = 0; /* timestamp of creat
- struct thread            *qpim_mroute_socket_reader = 0;
- int                       qpim_mroute_oif_highest_vif_index = -1;
- struct list              *qpim_channel_oil_list = 0;
-+struct in_addr            qpim_all_pim_routers_addr;
- int                       qpim_t_periodic = PIM_DEFAULT_T_PERIODIC; /* Period between Join/Prune Messages */
- struct list              *qpim_upstream_list = 0;
- struct zclient           *qpim_zclient_update = 0;
-diff --git a/pimd/pimd.h b/pimd/pimd.h
-index 9a7e6058..8b3496fd 100644
---- a/pimd/pimd.h
-+++ b/pimd/pimd.h
-@@ -68,39 +68,39 @@
- #define PIM_MASK_PIM_J_P             (1 << 12)
- #define PIM_MASK_STATIC              (1 << 13)
- 
--const char *const PIM_ALL_SYSTEMS;
--const char *const PIM_ALL_ROUTERS;
--const char *const PIM_ALL_PIM_ROUTERS;
--const char *const PIM_ALL_IGMP_ROUTERS;
--
--struct thread_master     *master;
--uint32_t                  qpim_debugs;
--int                       qpim_mroute_socket_fd;
--int64_t                   qpim_mroute_socket_creation; /* timestamp of creation */
--struct thread            *qpim_mroute_socket_reader;
--int                       qpim_mroute_oif_highest_vif_index;
--struct list              *qpim_channel_oil_list; /* list of struct channel_oil */
--struct in_addr            qpim_all_pim_routers_addr;
--int                       qpim_t_periodic; /* Period between Join/Prune Messages */
--struct list              *qpim_upstream_list; /* list of struct pim_upstream */
--struct zclient           *qpim_zclient_update;
--struct zclient           *qpim_zclient_lookup;
--struct pim_assert_metric  qpim_infinite_assert_metric;
--long                      qpim_rpf_cache_refresh_delay_msec;
--struct thread            *qpim_rpf_cache_refresher;
--int64_t                   qpim_rpf_cache_refresh_requests;
--int64_t                   qpim_rpf_cache_refresh_events;
--int64_t                   qpim_rpf_cache_refresh_last;
--struct in_addr            qpim_inaddr_any;
--struct list              *qpim_ssmpingd_list; /* list of struct ssmpingd_sock */
--struct in_addr            qpim_ssmpingd_group_addr;
--int64_t                   qpim_scan_oil_events;
--int64_t                   qpim_scan_oil_last;
--int64_t                   qpim_mroute_add_events;
--int64_t                   qpim_mroute_add_last;
--int64_t                   qpim_mroute_del_events;
--int64_t                   qpim_mroute_del_last;
--struct list              *qpim_static_route_list; /* list of routes added statically */
-+extern const char *const PIM_ALL_SYSTEMS;
-+extern const char *const PIM_ALL_ROUTERS;
-+extern const char *const PIM_ALL_PIM_ROUTERS;
-+extern const char *const PIM_ALL_IGMP_ROUTERS;
-+
-+extern struct thread_master     *master;
-+extern uint32_t                  qpim_debugs;
-+extern int                       qpim_mroute_socket_fd;
-+extern int64_t                   qpim_mroute_socket_creation; /* timestamp of creation */
-+extern struct thread            *qpim_mroute_socket_reader;
-+extern int                       qpim_mroute_oif_highest_vif_index;
-+extern struct list              *qpim_channel_oil_list; /* list of struct channel_oil */
-+extern struct in_addr            qpim_all_pim_routers_addr;
-+extern int                       qpim_t_periodic; /* Period between Join/Prune Messages */
-+extern struct list              *qpim_upstream_list; /* list of struct pim_upstream */
-+extern struct zclient           *qpim_zclient_update;
-+extern struct zclient           *qpim_zclient_lookup;
-+extern struct pim_assert_metric  qpim_infinite_assert_metric;
-+extern long                      qpim_rpf_cache_refresh_delay_msec;
-+extern struct thread            *qpim_rpf_cache_refresher;
-+extern int64_t                   qpim_rpf_cache_refresh_requests;
-+extern int64_t                   qpim_rpf_cache_refresh_events;
-+extern int64_t                   qpim_rpf_cache_refresh_last;
-+extern struct in_addr            qpim_inaddr_any;
-+extern struct list              *qpim_ssmpingd_list; /* list of struct ssmpingd_sock */
-+extern struct in_addr            qpim_ssmpingd_group_addr;
-+extern int64_t                   qpim_scan_oil_events;
-+extern int64_t                   qpim_scan_oil_last;
-+extern int64_t                   qpim_mroute_add_events;
-+extern int64_t                   qpim_mroute_add_last;
-+extern int64_t                   qpim_mroute_del_events;
-+extern int64_t                   qpim_mroute_del_last;
-+extern struct list              *qpim_static_route_list; /* list of routes added statically */
- 
- #define PIM_JP_HOLDTIME (qpim_t_periodic * 7 / 2)
- 
--- 
-2.30.0
-
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
deleted file mode 100644
index 9361b6a212..0000000000
--- a/package/quagga/Config.in
+++ /dev/null
@@ -1,95 +0,0 @@
-config BR2_PACKAGE_QUAGGA
-	bool "quagga"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  Routing software suite, providing implementations of OSPFv2,
-	  OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
-
-	  http://www.quagga.net/
-
-if BR2_PACKAGE_QUAGGA
-
-config BR2_PACKAGE_QUAGGA_ZEBRA
-	bool "zebra daemon"
-	help
-	  Build zebra daemon.
-
-config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
-	bool "Use TCP sockets between zebra and protocol daemons"
-	depends on BR2_PACKAGE_QUAGGA_ZEBRA
-	help
-	  Use a TCP socket to communicate between zebra (supervisor)
-	  and the different protocol daemons.
-
-	  You'll want this enabled if zebra and the protocol daemon(s)
-	  run on different hosts.
-
-config BR2_PACKAGE_QUAGGA_BGPD
-	bool "BGPv4+ protocol"
-	help
-	  Build bgpd daemon.
-
-config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
-	bool "BGP route announcement"
-	depends on BR2_PACKAGE_QUAGGA_BGPD
-
-config BR2_PACKAGE_QUAGGA_ISISD
-	bool "IS-IS protocol"
-	help
-	  Enable isisd support in quagga.
-
-config BR2_PACKAGE_QUAGGA_NHRPD
-	bool "NHRPD protocol"
-	select BR2_PACKAGE_C_ARES
-	help
-	  Build Next Hop Routing Protocol daemon.
-
-config BR2_PACKAGE_QUAGGA_OSPFD
-	bool "OSPFv2 protocol"
-	help
-	  Build ospfd daemon.
-
-config BR2_PACKAGE_QUAGGA_OSPF6D
-	bool "OSPFv3 (IPv6) protocol"
-	help
-	  Build ospf6d daemon.
-
-config BR2_PACKAGE_QUAGGA_RIPD
-	bool "RIPv2/v3 protocol"
-	help
-	  Build ripd daemon.
-
-config BR2_PACKAGE_QUAGGA_RIPNGD
-	bool "RIPng (IPv6) protocol"
-	help
-	  Build ripngd daemon.
-
-config BR2_PACKAGE_QUAGGA_PIMD
-	bool "PIMd protocol"
-	help
-	  Provides IPv4 PIM-SSM multicast routing.
-
-config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
-	bool "Build watchquagga"
-	help
-	  Build and install watchquagga, a zebra/protocol daemon
-	  supervisor.
-
-config BR2_PACKAGE_QUAGGA_VTYSH
-	bool "Build vtysh"
-	select BR2_PACKAGE_READLINE
-	help
-	  Build and install vtysh, a vty shell for Quagga.
-
-config BR2_PACKAGE_QUAGGA_SNMP
-	bool "SNMP support"
-	depends on BR2_USE_MMU # net-snmp
-	select BR2_PACKAGE_NETSNMP
-	help
-	  Make quagga information available via SNMP SMUX.
-
-comment "AgentX support must be enabled in net-snmp or the build will break"
-	depends on BR2_PACKAGE_QUAGGA_SNMP
-
-endif
diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
deleted file mode 100644
index d63908ad8f..0000000000
--- a/package/quagga/quagga.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3  quagga-1.2.4.tar.gz
-
-# Hash for license file
-sha256  b39c1bad4e51e2a3389cd25fc4addebe41a3ae7c11100795683f9330de1536e5  COPYING
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
deleted file mode 100644
index 5d8d52263a..0000000000
--- a/package/quagga/quagga.mk
+++ /dev/null
@@ -1,114 +0,0 @@
-################################################################################
-#
-# quagga
-#
-################################################################################
-
-QUAGGA_VERSION = 1.2.4
-QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
-QUAGGA_INSTALL_STAGING = YES
-QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
-QUAGGA_LICENSE = GPL-2.0+
-QUAGGA_LICENSE_FILES = COPYING
-QUAGGA_CPE_ID_VENDOR = quagga
-QUAGGA_SELINUX_MODULES = zebra
-
-# We need to override the sysconf and localstate directories so that
-# quagga can create files as the quagga user without extra
-# intervention
-QUAGGA_CONF_OPTS = \
-	--program-transform-name='' \
-	--sysconfdir=/etc/quagga \
-	--localstatedir=/var/run/quagga
-
-# quagga has its own internal copy of getopt_long. To avoid conflicts with libc's
-# getopt, we need to make sure that the getopt function itself is also built.
-QUAGGA_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -DREALLY_NEED_PLAIN_GETOPT"
-
-ifeq ($(BR2_PACKAGE_LIBCAP),y)
-QUAGGA_CONF_OPTS += --enable-capabilities
-QUAGGA_DEPENDENCIES += libcap
-else
-QUAGGA_CONF_OPTS += --disable-capabilities
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-QUAGGA_DEPENDENCIES += libxcrypt
-endif
-
-ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
-QUAGGA_CONF_OPTS += --enable-protobuf
-QUAGGA_DEPENDENCIES += protobuf-c
-else
-QUAGGA_CONF_OPTS += --disable-protobuf
-endif
-
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd --disable-ospfapi)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_PIMD),--enable-pimd,--disable-pimd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),--enable-tcp-zebra,--disable-tcp-zebra)
-
-define QUAGGA_USERS
-	quagga -1 quagga -1 * - - - Quagga priv drop user
-endef
-
-# Set the permissions of /etc/quagga such that quagga (through vtysh)
-# can save the configuration - set the folder recursively as the files
-# need to be 600, and then set the folder (non-recursively) to 755 so
-# it can used.  Quagga also needs to write to the folder as it moves
-# and creates, rather than overwriting.
-define QUAGGA_PERMISSIONS
-	/etc/quagga r 600 quagga quagga - - - - -
-	/etc/quagga d 755 quagga quagga - - - - -
-endef
-
-# In order for the QUAGGA_PERMISSIONS variable above to work,
-# /etc/quagga has to exist. However, this package without any
-# sub-option enabled will not create /etc/quagga, so let's create it
-# unconditionally in a post-install hook, in case it hasn't been
-# already created by the quagga installation.
-define QUAGGA_CREATE_ETC_QUAGGA
-	mkdir -p $(TARGET_DIR)/etc/quagga
-endef
-QUAGGA_POST_INSTALL_TARGET_HOOKS += QUAGGA_CREATE_ETC_QUAGGA
-
-ifeq ($(BR2_PACKAGE_QUAGGA_NHRPD),y)
-QUAGGA_CONF_OPTS += --enable-nhrpd
-QUAGGA_DEPENDENCIES += c-ares
-else
-QUAGGA_CONF_OPTS += --disable-nhrpd
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
-QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-QUAGGA_CONF_OPTS += --enable-snmp=agentx
-QUAGGA_DEPENDENCIES += netsnmp
-endif
-
-ifeq ($(BR2_PACKAGE_QUAGGA_VTYSH),y)
-QUAGGA_CONF_OPTS += --enable-vtysh
-QUAGGA_DEPENDENCIES += readline
-else
-QUAGGA_CONF_OPTS += --disable-vtysh
-endif
-
-ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-QUAGGA_CONF_OPTS += --disable-pie
-endif
-
-define QUAGGA_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
-		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
-	$(INSTALL) -D -m 644 package/quagga/quagga@.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/quagga@.service
-endef
-
-$(eval $(autotools-package))
diff --git a/package/quagga/quagga@.service b/package/quagga/quagga@.service
deleted file mode 100644
index 797af32e12..0000000000
--- a/package/quagga/quagga@.service
+++ /dev/null
@@ -1,17 +0,0 @@
-[Unit]
-Description=Quagga %i routing daemon
-ConditionFileIsExecutable=/usr/sbin/%i
-Wants=quagga@zebra.service
-
-[Service]
-Type=simple
-EnvironmentFile=/etc/default/quagga-%i
-PrivateTmp=true
-# Systemd doesn't like having %i in the executable path.
-ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf
-ExecReload=/bin/kill -HUP $MAINPID
-Restart=on-failure
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/package/quagga/quagga_tmpfiles.conf b/package/quagga/quagga_tmpfiles.conf
deleted file mode 100644
index e16c475fd4..0000000000
--- a/package/quagga/quagga_tmpfiles.conf
+++ /dev/null
@@ -1 +0,0 @@
-d /var/run/quagga/ 1755 quagga quagga -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
