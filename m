Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7206FFED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3467542987;
	Fri, 24 Apr 2026 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vBOfJcaUge2; Fri, 24 Apr 2026 16:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D174297A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049312;
	bh=APYZdGzkNH0VdwGr/R21nKO8kH9AKMG71wXX4h/9p6M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NQTxwJkWGIB4ysh4HBxEMs7YOBicLzXMNwsLO3lPCZyyoxCnOtElL9Hr13geAOBgX
	 cdjzGt26ascIX6vsKy+elQcWCxHPwZ9ZSLhDToZzLTcpWD9eI0LhNbfG7TFEsalyHg
	 HRmizcTyrf0eT53JkQUcILnmuK0NvZo5iVZ2Jp7jsGppCVcomhCLLs4w1YbgjxXIQh
	 p2exREuxabl4OLrgntg8n3ik+RpFyLoMddEVuuFk0bs+kKEuGUpZ172QXIXB522nqT
	 mjil1hacH+RjUEjcb5ti4UeDO7ASQnucT0ser9WkMEU/0RSuGiOYY7zYuVElo90+Pf
	 3VEnPX8YGhv3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D174297A;
	Fri, 24 Apr 2026 16:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE3B231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE72061C53
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CAcoLO7ATCn for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA4261C54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA4261C54
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E865B82AFA; Fri, 24 Apr 2026 16:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:44:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dd9e5a4def8b7bb00479aadfab5103e57bb23cf
X-Git-Newrev: ed27a33ba04fafdb28d5c74a53798c86aecd50e1
X-Patchwork-Hint: ignore
Message-Id: <20260424164826.E865B82AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: bump version to 5.9.5.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed27a33ba04fafdb28d5c74a53798c86aecd50e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/net-snmp/net-snmp/blob/v5.9.5.2/CHANGES

Removed all patches, they are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-6.7-compatibility-parsing-proc-net-snmp.patch | 125 ---------------------
 ...Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch |  39 -------
 package/netsnmp/0003-Android-Fix-the-build.patch   |  81 -------------
 ...ptrapd-Fix-out-of-bounds-trapOid-accesses.patch |  32 ------
 package/netsnmp/netsnmp.hash                       |   6 +-
 package/netsnmp/netsnmp.mk                         |   6 +-
 6 files changed, 5 insertions(+), 284 deletions(-)

diff --git a/package/netsnmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch b/package/netsnmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
deleted file mode 100644
index 0c15543c0f..0000000000
--- a/package/netsnmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 8350fd9e9c8bd97f587809265516f61aa7fe8aa0 Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Sat, 3 Feb 2024 10:30:30 -0800
-Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
-
-Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
-This breaks the hard-coded assumptions about the Ip line length.
-Add compatibility to parse Linux 6.7 Ip header while keep support
-for previous versions.
-
-Upstream: https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
- 1 file changed, 37 insertions(+), 9 deletions(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-index a0fbdd9ffa..8eb40742b4 100644
---- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
-@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
- }
- 
- /*
--  /proc/net/snmp
-+  /proc/net/snmp - Linux 6.6 and lower
- 
-   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates
-   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 259920 0 0
-@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
-   
-   Udp: InDatagrams NoPorts InErrors OutDatagrams
-   Udp: 1491094 122 0 1466178
-+*
-+  /proc/net/snmp - Linux 6.7 and higher
-+
-+  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates OutTransmits
-+  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264 3632 0 3548 0 7096 44961424
-+
-+  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutAddrMaskReps
-+  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572 16610 484 0 0 0 59957 66905 0 0 0 0
-+
-+  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
-+  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
-+
-+  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts InCsumErrors
-+  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8 7442 0
-+
-+  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
-+  Udp: 2257832 1422 0 2252835 0 0 0 84 0
-+
-+  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
-+  UdpLite: 0 0 0 0 0 0 0 0 0
- */
- 
- 
-@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-     FILE           *devin;
-     char            line[1024];
-     netsnmp_systemstats_entry *entry = NULL;
--    int             scan_count;
-+    int             scan_count, expected_scan_count;
-     char           *stats, *start = line;
-     int             len;
--    unsigned long long scan_vals[19];
-+    unsigned long long scan_vals[20];
- 
-     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags %x)\n",
-                 load_flags));
-@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-      */
-     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
-     len = strlen(line);
--    if (224 != len) {
-+    switch (len) {
-+    case 224:
-+	expected_scan_count = 19;
-+	break;
-+    case 237:
-+	expected_scan_count = 20;
-+	break;
-+    default:
-         fclose(devin);
-         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length in /proc/net/snmp."
--                 " %d != 224\n", len);
-+                 " %d not in { 224, 237 } \n", len);
-         return -4;
-     }
- 
-@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-         memset(scan_vals, 0x0, sizeof(scan_vals));
-         scan_count = sscanf(stats,
-                             "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
--                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu",
-+                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
-                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
-                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
-                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
-                             &scan_vals[9],&scan_vals[10],&scan_vals[11],
-                             &scan_vals[12],&scan_vals[13],&scan_vals[14],
-                             &scan_vals[15],&scan_vals[16],&scan_vals[17],
--                            &scan_vals[18]);
-+                            &scan_vals[18],&scan_vals[19]);
-         DEBUGMSGTL(("access:systemstats", "  read %d values\n", scan_count));
- 
--        if(scan_count != 19) {
-+        if(scan_count != expected_scan_count) {
-             snmp_log(LOG_ERR,
-                      "error scanning systemstats data (expected %d, got %d)\n",
--                     19, scan_count);
-+                     expected_scan_count, scan_count);
-             netsnmp_access_systemstats_entry_free(entry);
-             return -4;
-         }
-@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
-         entry->stats.HCOutFragFails.high = scan_vals[17] >> 32;
-         entry->stats.HCOutFragCreates.low = scan_vals[18] & 0xffffffff;
-         entry->stats.HCOutFragCreates.high = scan_vals[18] >> 32;
-+        /* entry->stats. = scan_vals[19]; / * OutTransmits */
- 
-         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] = 1;
-         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] = 1;
--- 
-2.49.0
-
diff --git a/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
deleted file mode 100644
index cc45957c59..0000000000
--- a/package/netsnmp/0002-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3 Mon Sep 17 00:00:00 2001
-From: Adam Gajda <adgajda@users.noreply.github.com>
-Date: Mon, 2 Oct 2023 16:40:31 +0200
-Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
-
-Upstream: https://github.com/net-snmp/net-snmp/commit/af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure                        | 2 +-
- configure.d/config_project_types | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 50522690f5..5512349926 100755
---- a/configure
-+++ b/configure
-@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
- printf %s "checking for the type of fd_set::fds_bits... " >&6; }
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-diff --git a/configure.d/config_project_types b/configure.d/config_project_types
-index 1b4c66b95e..a78e8ebb06 100644
---- a/configure.d/config_project_types
-+++ b/configure.d/config_project_types
-@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
- CFLAGS="$CFLAGS -Werror"
- 
- AC_MSG_CHECKING([for the type of fd_set::fds_bits])
--for type in __fd_mask __int32_t unknown; do
-+for type in __fd_mask __int32_t long\ int unknown; do
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <sys/select.h>
- #include <stddef.h>
diff --git a/package/netsnmp/0003-Android-Fix-the-build.patch b/package/netsnmp/0003-Android-Fix-the-build.patch
deleted file mode 100644
index 5cf37a0cb6..0000000000
--- a/package/netsnmp/0003-Android-Fix-the-build.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From b4598662a39ff6974119c900ea56a4d020eac366 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Wed, 20 Dec 2023 13:08:06 -0800
-Subject: [PATCH] Android: Fix the build
-
-Include <sys/select.h> for the fd_set type. In the configure script,
-check whether 'unsigned long' is the underlying type of fd_set. Use
-u_long instead of ulong.
-
-Upstream: https://github.com/net-snmp/net-snmp/commit/b4598662a39ff6974119c900ea56a4d020eac366
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 4 ++--
- configure                                           | 2 +-
- configure.d/config_project_types                    | 2 +-
- include/net-snmp/types.h                            | 3 +++
- 4 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-index b38beb57dd..232202d0f9 100644
---- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-+++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
-@@ -50,7 +50,7 @@ int _load_v6(netsnmp_container *container, int idx_offset);
- int
- netsnmp_access_ipaddress_extra_prefix_info(int index,
-                                            u_long *preferedlt,
--                                           ulong *validlt,
-+                                           u_long *validlt,
-                                            char *addr);
- #endif
- 
-@@ -523,7 +523,7 @@ netsnmp_access_other_info_get(int index, int family)
- 
- int
- netsnmp_access_ipaddress_extra_prefix_info(int index, u_long *preferedlt,
--                                           ulong *validlt, char *addr)
-+                                           u_long *validlt, char *addr)
- {
- 
-     struct {
-diff --git a/configure b/configure
-index e7bf859bba..48abcbab11 100755
---- a/configure
-+++ b/configure
-@@ -31577,7 +31577,7 @@ CFLAGS="$CFLAGS -Werror"
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
- printf %s "checking for the type of fd_set::fds_bits... " >&6; }
--for type in __fd_mask __int32_t long\ int unknown; do
-+for type in __fd_mask __int32_t long 'unsigned long' unknown; do
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-diff --git a/configure.d/config_project_types b/configure.d/config_project_types
-index a78e8ebb06..ac958d6712 100644
---- a/configure.d/config_project_types
-+++ b/configure.d/config_project_types
-@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
- CFLAGS="$CFLAGS -Werror"
- 
- AC_MSG_CHECKING([for the type of fd_set::fds_bits])
--for type in __fd_mask __int32_t long\ int unknown; do
-+for type in __fd_mask __int32_t long 'unsigned long' unknown; do
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
- #include <sys/select.h>
- #include <stddef.h>
-diff --git a/include/net-snmp/types.h b/include/net-snmp/types.h
-index b78f53ffd7..6228170e5f 100644
---- a/include/net-snmp/types.h
-+++ b/include/net-snmp/types.h
-@@ -23,6 +23,9 @@
- #endif
- 
- #include <sys/types.h>
-+#ifdef __ANDROID__
-+#include <sys/select.h>
-+#endif
- 
- #if defined(WIN32) && !defined(cygwin)
- typedef HANDLE netsnmp_pid_t;
diff --git a/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
deleted file mode 100644
index a937b53644..0000000000
--- a/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sun, 2 Nov 2025 14:48:55 -0800
-Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
-
-Fixes: https://issues.oss-fuzz.com/issues/457106694
-Fixes: https://issues.oss-fuzz.com/issues/458668421
-Fixes: https://issues.oss-fuzz.com/issues/458876071
-CVE: CVE-2025-68615
-Upstream: https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- apps/snmptrapd_handlers.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
-index 6cd126f266..afd93ed0fb 100644
---- a/apps/snmptrapd_handlers.c
-+++ b/apps/snmptrapd_handlers.c
-@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
- 	     */
-             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
-                 trapOidLen = pdu->enterprise_length;
-+                /*
-+                 * Drop packets that would trigger an out-of-bounds trapOid[]
-+                 * access.
-+                 */
-+                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
-+                    return 1;
-                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
-                 if (trapOid[trapOidLen - 1] != 0) {
-                     trapOid[trapOidLen++] = 0;
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index 7898941271..f86be3d60f 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,9 @@
+# From https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.5.2/
+sha1  051e2e919604f6fac96c1e7df7bd2ec0d288375f  net-snmp-5.9.5.2.tar.gz
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.4/net-snmp-5.9.4.tar.gz.asc
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.5.2/net-snmp-5.9.5.2.tar.gz.asc/download
 # using key 6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB
-sha256  8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544  net-snmp-5.9.4.tar.gz
+sha256  16707719f833184a4b72835dac359ae188123b06b5e42817c00790d7dc1384bf  net-snmp-5.9.5.2.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 1c7e406a4e..4d3367e12c 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9.4
+NETSNMP_VERSION = 5.9.5.2
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
-# 0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
-NETSNMP_IGNORE_CVES += CVE-2025-68615
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
@@ -42,8 +40,6 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
-# We're patching configure.d/config_project_types
-NETSNMP_AUTORECONF = YES
 
 define NETSNMP_USERS
 	snmp -1 snmp -1 * - - - snmpd user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
