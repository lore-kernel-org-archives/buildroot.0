Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A864FCCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846BF82285;
	Thu, 30 Oct 2025 08:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTyyw0Ncfc0N; Thu, 30 Oct 2025 08:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F2B84188
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F2B84188;
	Thu, 30 Oct 2025 08:23:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 539922A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6D21613B8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLuD3Uozvd_H for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3FA613B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3FA613B7
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BA76879C2; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:18:16 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: ca724489f551f69f8b8729d2dee36a70da9a45d3
X-Git-Newrev: be8dcf0092edcc6b26fb7605bbcccceac73a7d76
X-Patchwork-Hint: ignore
Message-Id: <20251030082229.3BA76879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/netdata: security
 bump to v1.37.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be8dcf0092edcc6b26fb7605bbcccceac73a7d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Do not bump to a more recent version, as the build system has
fundamentally changed.

See the release notes:
- https://github.com/netdata/netdata/releases/tag/1.34.0
- https://github.com/netdata/netdata/releases/tag/v1.34.1
- https://github.com/netdata/netdata/releases/tag/v1.35.0
- https://github.com/netdata/netdata/releases/tag/v1.35.1
- https://github.com/netdata/netdata/releases/tag/v1.36.0
- https://github.com/netdata/netdata/releases/tag/v1.36.1
- https://github.com/netdata/netdata/releases/tag/v1.37.0
- https://github.com/netdata/netdata/releases/tag/v1.37.1

In addition, add upstream patch to fix cross-compilation.

This fixes the following vulnerabilities:
- CVE-2023-22496:
    Netdata is an open source option for real-time infrastructure
    monitoring and troubleshooting. An attacker with the ability to
    establish a streaming connection can execute arbitrary commands on the
    targeted Netdata agent. When an alert is triggered, the function
    `health_alarm_execute` is called. This function performs different
    checks and then enqueues a command by calling `spawn_enq_cmd`. This
    command is populated with several arguments that are not sanitized.
    One of them is the `registry_hostname` of the node for which the alert
    is raised. By providing a specially crafted `registry_hostname` as
    part of the health data that is streamed to a Netdata (parent) agent,
    an attacker can execute arbitrary commands at the remote host as a
    side-effect of the raised alert. Note that the commands are executed
    as the user running the Netdata Agent. This user is usually named
    `netdata`. The ability to run arbitrary commands may allow an attacker
    to escalate privileges by escalating other vulnerabilities in the
    system, as that user. The problem has been fixed in: Netdata agent
    v1.37 (stable) and Netdata agent v1.36.0-409 (nightly). As a
    workaround, streaming is not enabled by default. If you have
    previously enabled this, it can be disabled. Limiting access to the
    port on the recipient Agent to trusted child connections may mitigate
    the impact of this vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2023-22496

- CVE-2023-22497:
    Netdata is an open source option for real-time infrastructure
    monitoring and troubleshooting. Each Netdata Agent has an
    automatically generated MACHINE GUID. It is generated when the agent
    first starts and it is saved to disk, so that it will persist across
    restarts and reboots. Anyone who has access to a Netdata Agent has
    access to its MACHINE_GUID. Streaming is a feature that allows a
    Netdata Agent to act as parent for other Netdata Agents (children),
    offloading children from various functions (increased data retention,
    ML, health monitoring, etc) that can now be handled by the parent
    Agent. Configuration is done via `stream.conf`. On the parent side,
    users configure in `stream.conf` an API key (any random UUID can do)
    to provide common configuration for all children using this API key
    and per MACHINE GUID configuration to customize the configuration for
    each child. The way this was implemented, allowed an attacker to use a
    valid MACHINE_GUID as an API key. This affects all users who expose
    their Netdata Agents (children) to non-trusted users and they also
    expose to the same users Netdata Agent parents that aggregate data
    from all these children. The problem has been fixed in: Netdata agent
    v1.37 (stable) and Netdata agent v1.36.0-409 (nightly). As a
    workaround, do not enable streaming by default. If you have previously
    enabled this, it can be disabled. Limiting access to the port on the
    recipient Agent to trusted child connections may mitigate the impact
    of this vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2023-22497

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add comment before _AUTORECONF with patch name]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9cfcd906cff299ef83b48681e50bcef9df124ad4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-libjudy-remove-JudyLTablesGen.patch       | 707 +++++++++++++++++++++
 package/netdata/netdata.hash                       |   4 +-
 package/netdata/netdata.mk                         |   5 +-
 3 files changed, 713 insertions(+), 3 deletions(-)

diff --git a/package/netdata/0001-libjudy-remove-JudyLTablesGen.patch b/package/netdata/0001-libjudy-remove-JudyLTablesGen.patch
new file mode 100644
index 0000000000..b04f61721a
--- /dev/null
+++ b/package/netdata/0001-libjudy-remove-JudyLTablesGen.patch
@@ -0,0 +1,707 @@
+From 4241f557597013dcdf959b688730888b4370660c Mon Sep 17 00:00:00 2001
+From: mochaaP <git@mochaa.ws>
+Date: Sat, 29 Apr 2023 14:52:02 +0800
+Subject: [PATCH] libjudy: remove JudyLTablesGen
+
+JudyLTablesGen could be replaced with a pregenerated file
+with 32-bit / 64-bit specific macros. Fixes #14185
+
+Upstream: https://github.com/netdata/netdata/pull/14984
+
+[Titouan: adapt to netdata v1.37.1]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Makefile.am                                   |  17 +-
+ libnetdata/libjudy/src/JudyL/JudyLTables.c    | 338 ++++++++++++++++++
+ libnetdata/libjudy/src/JudyL/JudyLTablesGen.c | 296 ---------------
+ 3 files changed, 339 insertions(+), 312 deletions(-)
+ create mode 100644 libnetdata/libjudy/src/JudyL/JudyLTables.c
+ delete mode 100644 libnetdata/libjudy/src/JudyL/JudyLTablesGen.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 5e16052..750d86e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -504,15 +504,10 @@ libjudy_a_SOURCES = libnetdata/libjudy/src/Judy.h \
+     libnetdata/libjudy/src/JudyL/JudyLNextEmpty.c \
+     libnetdata/libjudy/src/JudyL/JudyLPrev.c \
+     libnetdata/libjudy/src/JudyL/JudyLPrevEmpty.c \
++    libnetdata/libjudy/src/JudyL/JudyLTables.c \
+     libnetdata/libjudy/src/JudyHS/JudyHS.c \
+     $(NULL)
+ 
+-nodist_libjudy_a_SOURCES = JudyLTables.c
+-
+-BUILT_SOURCES += JudyLTables.c
+-
+-CLEANFILES += JudyLTables.c
+-
+ libjudy_a_CFLAGS = $(LIBJUDY_CFLAGS) -DJUDYL -I$(abs_top_srcdir)/libnetdata/libjudy/src -I$(abs_top_srcdir)/libnetdata/libjudy/src/JudyCommon -Wno-sign-compare -Wno-implicit-fallthrough
+ 
+ libnetdata/libjudy/src/JudyL/libjudy_a-JudyLPrev.$(OBJEXT) : CFLAGS += -DJUDYPREV
+@@ -522,16 +517,6 @@ libnetdata/libjudy/src/JudyL/libjudy_a-JudyLNextEmpty.$(OBJEXT) : CFLAGS += -DJU
+ libnetdata/libjudy/src/JudyL/libjudy_a-JudyLByCount.$(OBJEXT) : CFLAGS +=  -DNOSMARTJBB -DNOSMARTJBU -DNOSMARTJLB
+ libnetdata/libjudy/src/JudyL/libjudy_a-j__udyLGet.$(OBJEXT) : CFLAGS +=  -DJUDYGETINLINE
+ 
+-noinst_PROGRAMS = judyltablesgen
+-
+-judyltablesgen_SOURCES = libnetdata/libjudy/src/JudyL/JudyLTablesGen.c
+-judyltablesgen_CFLAGS = $(LIBJUDY_CFLAGS) -DJUDYL -I$(abs_top_srcdir)/libnetdata/libjudy/src -I$(abs_top_srcdir)/libnetdata/libjudy/src/JudyCommon -Wno-sign-compare -Wno-implicit-fallthrough
+-
+-$(builddir)/judyltablesgen$(EXEEXT) : CFLAGS += -Wno-format -Wno-format-security
+-
+-JudyLTables.c: $(abs_top_srcdir)/libnetdata/libjudy/src/JudyL/JudyLTablesGen.c $(builddir)/judyltablesgen$(EXEEXT)
+-	$(builddir)/judyltablesgen$(EXEEXT)
+-
+ libjudy_a-JudyLTables.$(OBJEXT) : CFLAGS += -I$(abs_top_srcdir)/libnetdata/libjudy/src/JudyL
+ 
+ if ENABLE_DBENGINE
+diff --git a/libnetdata/libjudy/src/JudyL/JudyLTables.c b/libnetdata/libjudy/src/JudyL/JudyLTables.c
+new file mode 100644
+index 0000000..21c9749
+--- /dev/null
++++ b/libnetdata/libjudy/src/JudyL/JudyLTables.c
+@@ -0,0 +1,338 @@
++// @(#) From generation tool: $Revision: 4.37 $ $Source: /judy/src/JudyCommon/JudyTables.c $
++// Pregenerated and modified by hand. Do not overwrite!
++
++#include "JudyL.h"
++// Leave the malloc() sizes readable in the binary (via strings(1)):
++#ifdef JU_64BIT
++const char * JudyLMallocSizes = "JudyLMallocSizes = 3, 5, 7, 11, 15, 23, 32, 47, 64, Leaf1 = 13";
++#else // JU_32BIT
++const char * JudyLMallocSizes = "JudyLMallocSizes = 3, 5, 7, 11, 15, 23, 32, 47, 64, Leaf1 = 25";
++#endif // JU_64BIT
++
++#ifdef JU_64BIT
++//	object uses 64 words
++//	cJU_BITSPERSUBEXPB = 32
++const uint8_t
++j__L_BranchBJPPopToWords[cJU_BITSPERSUBEXPB + 1] =
++{
++	 0,
++	 3,  5,  7, 11, 11, 15, 15, 23,
++	23, 23, 23, 32, 32, 32, 32, 32,
++	47, 47, 47, 47, 47, 47, 47, 64,
++	64, 64, 64, 64, 64, 64, 64, 64
++};
++
++//	object uses 15 words
++//	cJL_LEAF1_MAXPOP1 = 13
++const uint8_t
++j__L_Leaf1PopToWords[cJL_LEAF1_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  5,  7,  7, 11, 11,
++	11, 15, 15, 15, 15
++};
++const uint8_t
++j__L_Leaf1Offset[cJL_LEAF1_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  1,  1,  1,  1,  2,  2,
++	 2,  2,  2,  2,  2
++};
++
++//	object uses 64 words
++//	cJL_LEAF2_MAXPOP1 = 51
++const uint8_t
++j__L_Leaf2PopToWords[cJL_LEAF2_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  5,  7, 11, 11, 11,
++	15, 15, 15, 15, 23, 23, 23, 23,
++	23, 23, 32, 32, 32, 32, 32, 32,
++	32, 47, 47, 47, 47, 47, 47, 47,
++	47, 47, 47, 47, 47, 64, 64, 64,
++	64, 64, 64, 64, 64, 64, 64, 64,
++	64, 64, 64
++};
++const uint8_t
++j__L_Leaf2Offset[cJL_LEAF2_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  1,  1,  2,  3,  3,  3,
++	 3,  3,  3,  3,  5,  5,  5,  5,
++	 5,  5,  7,  7,  7,  7,  7,  7,
++	 7, 10, 10, 10, 10, 10, 10, 10,
++	10, 10, 10, 10, 10, 13, 13, 13,
++	13, 13, 13, 13, 13, 13, 13, 13,
++	13, 13, 13
++};
++
++//	object uses 64 words
++//	cJL_LEAF3_MAXPOP1 = 46
++const uint8_t
++j__L_Leaf3PopToWords[cJL_LEAF3_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  7,  7, 11, 11, 11,
++	15, 15, 23, 23, 23, 23, 23, 23,
++	32, 32, 32, 32, 32, 32, 32, 47,
++	47, 47, 47, 47, 47, 47, 47, 47,
++	47, 47, 64, 64, 64, 64, 64, 64,
++	64, 64, 64, 64, 64, 64
++};
++const uint8_t
++j__L_Leaf3Offset[cJL_LEAF3_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  2,  2,  2,  3,  3,  3,
++	 4,  4,  6,  6,  6,  6,  6,  6,
++	 9,  9,  9,  9,  9,  9,  9, 13,
++	13, 13, 13, 13, 13, 13, 13, 13,
++	13, 13, 18, 18, 18, 18, 18, 18,
++	18, 18, 18, 18, 18, 18
++};
++
++//	object uses 63 words
++//	cJL_LEAF4_MAXPOP1 = 42
++const uint8_t
++j__L_Leaf4PopToWords[cJL_LEAF4_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  7, 11, 11, 11, 15,
++	15, 15, 23, 23, 23, 23, 23, 32,
++	32, 32, 32, 32, 32, 47, 47, 47,
++	47, 47, 47, 47, 47, 47, 47, 63,
++	63, 63, 63, 63, 63, 63, 63, 63,
++	63, 63
++};
++const uint8_t
++j__L_Leaf4Offset[cJL_LEAF4_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  2,  2,  4,  4,  4,  5,
++	 5,  5,  8,  8,  8,  8,  8, 11,
++	11, 11, 11, 11, 11, 16, 16, 16,
++	16, 16, 16, 16, 16, 16, 16, 21,
++	21, 21, 21, 21, 21, 21, 21, 21,
++	21, 21
++};
++
++//	object uses 64 words
++//	cJL_LEAF5_MAXPOP1 = 39
++const uint8_t
++j__L_Leaf5PopToWords[cJL_LEAF5_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  5,  7, 11, 11, 15, 15,
++	15, 23, 23, 23, 23, 23, 32, 32,
++	32, 32, 32, 47, 47, 47, 47, 47,
++	47, 47, 47, 47, 64, 64, 64, 64,
++	64, 64, 64, 64, 64, 64, 64
++};
++const uint8_t
++j__L_Leaf5Offset[cJL_LEAF5_MAXPOP1 + 1] =
++{
++	 0,
++	 2,  2,  2,  3,  4,  4,  6,  6,
++	 6,  9,  9,  9,  9,  9, 12, 12,
++	12, 12, 12, 18, 18, 18, 18, 18,
++	18, 18, 18, 18, 25, 25, 25, 25,
++	25, 25, 25, 25, 25, 25, 25
++};
++
++//	object uses 63 words
++//	cJL_LEAF6_MAXPOP1 = 36
++const uint8_t
++j__L_Leaf6PopToWords[cJL_LEAF6_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  7,  7, 11, 11, 15, 15,
++	23, 23, 23, 23, 23, 32, 32, 32,
++	32, 32, 47, 47, 47, 47, 47, 47,
++	47, 47, 63, 63, 63, 63, 63, 63,
++	63, 63, 63, 63
++};
++const uint8_t
++j__L_Leaf6Offset[cJL_LEAF6_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  3,  3,  3,  5,  5,  6,  6,
++	10, 10, 10, 10, 10, 14, 14, 14,
++	14, 14, 20, 20, 20, 20, 20, 20,
++	20, 20, 27, 27, 27, 27, 27, 27,
++	27, 27, 27, 27
++};
++
++//	object uses 64 words
++//	cJL_LEAF7_MAXPOP1 = 34
++const uint8_t
++j__L_Leaf7PopToWords[cJL_LEAF7_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  7, 11, 11, 15, 15, 15,
++	23, 23, 23, 23, 32, 32, 32, 32,
++	32, 47, 47, 47, 47, 47, 47, 47,
++	47, 64, 64, 64, 64, 64, 64, 64,
++	64, 64
++};
++const uint8_t
++j__L_Leaf7Offset[cJL_LEAF7_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  3,  3,  5,  5,  7,  7,  7,
++	11, 11, 11, 11, 15, 15, 15, 15,
++	15, 22, 22, 22, 22, 22, 22, 22,
++	22, 30, 30, 30, 30, 30, 30, 30,
++	30, 30
++};
++
++//	object uses 63 words
++//	cJL_LEAFW_MAXPOP1 = 31
++const uint8_t
++j__L_LeafWPopToWords[cJL_LEAFW_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  7, 11, 11, 15, 15, 23,
++	23, 23, 23, 32, 32, 32, 32, 47,
++	47, 47, 47, 47, 47, 47, 47, 63,
++	63, 63, 63, 63, 63, 63, 63
++};
++const uint8_t
++j__L_LeafWOffset[cJL_LEAFW_MAXPOP1 + 1] =
++{
++	 0,
++	 2,  3,  4,  6,  6,  8,  8, 12,
++	12, 12, 12, 16, 16, 16, 16, 24,
++	24, 24, 24, 24, 24, 24, 24, 32,
++	32, 32, 32, 32, 32, 32, 32
++};
++
++//	object uses 64 words
++//	cJU_BITSPERSUBEXPL = 64
++const uint8_t
++j__L_LeafVPopToWords[cJU_BITSPERSUBEXPL + 1] =
++{
++	 0,
++	 3,  3,  3,  5,  5,  7,  7, 11,
++	11, 11, 11, 15, 15, 15, 15, 23,
++	23, 23, 23, 23, 23, 23, 23, 32,
++	32, 32, 32, 32, 32, 32, 32, 32,
++	47, 47, 47, 47, 47, 47, 47, 47,
++	47, 47, 47, 47, 47, 47, 47, 64,
++	64, 64, 64, 64, 64, 64, 64, 64,
++	64, 64, 64, 64, 64, 64, 64, 64
++};
++#else // JU_32BIT
++//	object uses 64 words
++//	cJU_BITSPERSUBEXPB = 32
++const uint8_t
++j__L_BranchBJPPopToWords[cJU_BITSPERSUBEXPB + 1] =
++{
++	 0,
++	 3,  5,  7, 11, 11, 15, 15, 23,
++	23, 23, 23, 32, 32, 32, 32, 32,
++	47, 47, 47, 47, 47, 47, 47, 64,
++	64, 64, 64, 64, 64, 64, 64, 64
++};
++
++//	object uses 32 words
++//	cJL_LEAF1_MAXPOP1 = 25
++const uint8_t
++j__L_Leaf1PopToWords[cJL_LEAF1_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  5,  7, 11, 11, 11,
++	15, 15, 15, 15, 23, 23, 23, 23,
++	23, 23, 32, 32, 32, 32, 32, 32,
++	32
++};
++const uint8_t
++j__L_Leaf1Offset[cJL_LEAF1_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  1,  1,  2,  3,  3,  3,
++	 3,  3,  3,  3,  5,  5,  5,  5,
++	 5,  5,  7,  7,  7,  7,  7,  7,
++	 7
++};
++
++//	object uses 63 words
++//	cJL_LEAF2_MAXPOP1 = 42
++const uint8_t
++j__L_Leaf2PopToWords[cJL_LEAF2_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  3,  5,  7, 11, 11, 11, 15,
++	15, 15, 23, 23, 23, 23, 23, 32,
++	32, 32, 32, 32, 32, 47, 47, 47,
++	47, 47, 47, 47, 47, 47, 47, 63,
++	63, 63, 63, 63, 63, 63, 63, 63,
++	63, 63
++};
++const uint8_t
++j__L_Leaf2Offset[cJL_LEAF2_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  1,  2,  2,  4,  4,  4,  5,
++	 5,  5,  8,  8,  8,  8,  8, 11,
++	11, 11, 11, 11, 11, 16, 16, 16,
++	16, 16, 16, 16, 16, 16, 16, 21,
++	21, 21, 21, 21, 21, 21, 21, 21,
++	21, 21
++};
++
++//	object uses 63 words
++//	cJL_LEAF3_MAXPOP1 = 36
++const uint8_t
++j__L_Leaf3PopToWords[cJL_LEAF3_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  7,  7, 11, 11, 15, 15,
++	23, 23, 23, 23, 23, 32, 32, 32,
++	32, 32, 47, 47, 47, 47, 47, 47,
++	47, 47, 63, 63, 63, 63, 63, 63,
++	63, 63, 63, 63
++};
++const uint8_t
++j__L_Leaf3Offset[cJL_LEAF3_MAXPOP1 + 1] =
++{
++	 0,
++	 1,  3,  3,  3,  5,  5,  6,  6,
++	10, 10, 10, 10, 10, 14, 14, 14,
++	14, 14, 20, 20, 20, 20, 20, 20,
++	20, 20, 27, 27, 27, 27, 27, 27,
++	27, 27, 27, 27
++};
++
++//	object uses 63 words
++//	cJL_LEAFW_MAXPOP1 = 31
++const uint8_t
++j__L_LeafWPopToWords[cJL_LEAFW_MAXPOP1 + 1] =
++{
++	 0,
++	 3,  5,  7, 11, 11, 15, 15, 23,
++	23, 23, 23, 32, 32, 32, 32, 47,
++	47, 47, 47, 47, 47, 47, 47, 63,
++	63, 63, 63, 63, 63, 63, 63
++};
++const uint8_t
++j__L_LeafWOffset[cJL_LEAFW_MAXPOP1 + 1] =
++{
++	 0,
++	 2,  3,  4,  6,  6,  8,  8, 12,
++	12, 12, 12, 16, 16, 16, 16, 24,
++	24, 24, 24, 24, 24, 24, 24, 32,
++	32, 32, 32, 32, 32, 32, 32
++};
++
++//	object uses 32 words
++//	cJU_BITSPERSUBEXPL = 32
++const uint8_t
++j__L_LeafVPopToWords[cJU_BITSPERSUBEXPL + 1] =
++{
++	 0,
++	 3,  3,  3,  5,  5,  7,  7, 11,
++	11, 11, 11, 15, 15, 15, 15, 23,
++	23, 23, 23, 23, 23, 23, 23, 32,
++	32, 32, 32, 32, 32, 32, 32, 32
++};
++#endif // JU_64BIT
+diff --git a/libnetdata/libjudy/src/JudyL/JudyLTablesGen.c b/libnetdata/libjudy/src/JudyL/JudyLTablesGen.c
+deleted file mode 100644
+index cb8b13f..0000000
+--- a/libnetdata/libjudy/src/JudyL/JudyLTablesGen.c
++++ /dev/null
+@@ -1,296 +0,0 @@
+-// Copyright (C) 2000 - 2002 Hewlett-Packard Company
+-//
+-// This program is free software; you can redistribute it and/or modify it
+-// under the term of the GNU Lesser General Public License as published by the
+-// Free Software Foundation; either version 2 of the License, or (at your
+-// option) any later version.
+-//
+-// This program is distributed in the hope that it will be useful, but WITHOUT
+-// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
+-// for more details.
+-//
+-// You should have received a copy of the GNU Lesser General Public License
+-// along with this program; if not, write to the Free Software Foundation,
+-// Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+-// _________________
+-
+-// @(#) $Revision: 4.37 $ $Source: /judy/src/JudyCommon/JudyTables.c $
+-
+-#ifndef JU_WIN
+-#include <unistd.h>		// unavailable on win_*.
+-#endif
+-
+-#include <stdlib.h>
+-#include <stdio.h>
+-
+-#if (! (defined(JUDY1) || defined(JUDYL)))
+-#error:  One of -DJUDY1 or -DJUDYL must be specified.
+-#endif
+-
+-#define	TERMINATOR 999		// terminator for Alloc tables
+-
+-#define BPW sizeof(Word_t)	// define bytes per word
+-
+-#ifdef JUDY1
+-#include "Judy1.h"
+-#else
+-#include "JudyL.h"
+-#endif
+-    
+-FILE *fd;
+-
+-// Definitions come from header files Judy1.h and JudyL.h:
+-
+-int AllocSizes[] = ALLOCSIZES;
+-
+-#define	ROUNDUP(BYTES,BPW,OFFSETW) \
+-	((((BYTES) + (BPW) - 1) / (BPW)) + (OFFSETW))
+-
+-
+-// ****************************************************************************
+-// G E N   T A B L E
+-//
+-// Note:  "const" is required for newer compilers.
+-
+-FUNCTION void GenTable(
+-    const char * TableName,	// name of table string
+-    const char * TableSize,	// dimentioned size string
+-    int		 IndexBytes,	// bytes per Index
+-    int		 LeafSize,	// number elements in object
+-    int		 ValueBytes,	// bytes per Value
+-    int		 OffsetWords)	// 1 for LEAFW
+-{
+-    int *	 PAllocSizes = AllocSizes;
+-    int		 OWord;
+-    int		 CurWord;
+-    int		 IWord;
+-    int		 ii;
+-    int		 BytesOfIndex;
+-    int		 BytesOfObject;
+-    int		 Index;
+-    int		 LastWords;
+-    int		 Words [1000] = { 0 };
+-    int		 Offset[1000] = { 0 };
+-    int		 MaxWords;
+-
+-    MaxWords  =	ROUNDUP((IndexBytes + ValueBytes) * LeafSize, BPW, OffsetWords);
+-    Words[0]  = 0;
+-    Offset[0] = 0;
+-    CurWord   = TERMINATOR;
+-
+-// Walk through all number of Indexes in table:
+-
+-    for (Index = 1; /* null */; ++Index)
+-    {
+-
+-// Calculate byte required for next size:
+-
+-	BytesOfIndex  = IndexBytes * Index;
+-	BytesOfObject = (IndexBytes + ValueBytes) * Index;
+-
+-// Round up and calculate words required for next size:
+-
+-        OWord =	ROUNDUP(BytesOfObject, BPW, OffsetWords);
+-        IWord =	ROUNDUP(BytesOfIndex,  BPW, OffsetWords);
+-
+-// Root-level leaves of population of 1 and 2 do not have the 1 word offset:
+-
+-// Save minimum value of offset:
+-
+-        Offset[Index] = IWord;
+-
+-// Round up to next available size of words:
+-
+-	while (OWord > *PAllocSizes) PAllocSizes++;
+-
+-        if (Index == LeafSize)
+-        {
+-	    CurWord = Words[Index] = OWord;
+-            break;
+-        }
+-//      end of available sizes ?
+-
+-	if (*PAllocSizes == TERMINATOR)
+-        {
+-            fprintf(stderr, "BUG, in %sPopToWords, sizes not big enough for object\n", TableName);
+-	    exit(1);
+-        }
+-
+-// Save words required and last word:
+-
+-        if (*PAllocSizes < MaxWords) { CurWord = Words[Index] = *PAllocSizes; }
+-        else                         { CurWord = Words[Index] = MaxWords; }
+-
+-    } // for each index
+-
+-    LastWords = TERMINATOR;
+-
+-// Round up to largest size in each group of malloc sizes:
+-
+-    for (ii = LeafSize; ii > 0; ii--)
+-    {
+-        if (LastWords > (Words[ii] - ii)) LastWords = Offset[ii];
+-        else                              Offset[ii] = LastWords;
+-    }
+-
+-// Print the PopToWords[] table:
+-
+-    fprintf(fd,"\n//\tobject uses %d words\n", CurWord);
+-    fprintf(fd,"//\t%s = %d\n", TableSize, LeafSize);
+-
+-    fprintf(fd,"const uint8_t\n");
+-    fprintf(fd,"%sPopToWords[%s + 1] =\n", TableName, TableSize);
+-    fprintf(fd,"{\n\t 0,");
+-
+-    for (ii = 1; ii <= LeafSize; ii++)
+-    {
+-
+-// 8 columns per line, starting with 1:
+-
+-	if ((ii % 8) == 1) fprintf(fd,"\n\t");
+-
+-	fprintf(fd,"%2d", Words[ii]);
+-
+-// If not last number place comma:
+-
+-	if (ii != LeafSize) fprintf(fd,", ");
+-    }
+-    fprintf(fd,"\n};\n");
+-
+-// Print the Offset table if needed:
+-
+-    if (! ValueBytes) return;
+-
+-    fprintf(fd,"const uint8_t\n");
+-    fprintf(fd,"%sOffset[%s + 1] =\n", TableName, TableSize);
+-    fprintf(fd,"{\n");
+-    fprintf(fd,"\t 0,");
+-
+-    for (ii = 1; ii <= LeafSize; ii++)
+-    {
+-        if ((ii % 8) == 1) fprintf(fd,"\n\t");
+-
+-	fprintf(fd,"%2d", Offset[ii]);
+-
+-	if (ii != LeafSize) fprintf(fd,", ");
+-    }
+-    fprintf(fd,"\n};\n");
+-
+-} // GenTable()
+-
+-
+-// ****************************************************************************
+-// M A I N
+-
+-FUNCTION int main()
+-{
+-    int ii;
+-
+-#ifdef JUDY1
+-    char *fname = "Judy1Tables.c";
+-#else
+-    char *fname = "JudyLTables.c";
+-#endif
+-
+-    if ((fd = fopen(fname, "w")) == NULL){
+-	perror("FATAL ERROR: could not write to Judy[1L]Tables.c file\n");
+-	return (-1);
+-    }
+-
+-
+-    fprintf(fd,"// @(#) From generation tool: $Revision: 4.37 $ $Source: /judy/src/JudyCommon/JudyTables.c $\n");
+-    fprintf(fd,"//\n\n");
+-
+-
+-// ================================ Judy1 =================================
+-#ifdef JUDY1
+-
+-    fprintf(fd,"#include \"Judy1.h\"\n");
+-
+-    fprintf(fd,"// Leave the malloc() sizes readable in the binary (via "
+-	   "strings(1)):\n");
+-    fprintf(fd,"const char * Judy1MallocSizes = \"Judy1MallocSizes =");
+-
+-    for (ii = 0; AllocSizes[ii] != TERMINATOR; ii++)
+-	fprintf(fd," %d,", AllocSizes[ii]);
+-
+-#ifndef JU_64BIT
+-    fprintf(fd," Leaf1 = %d\";\n\n", cJ1_LEAF1_MAXPOP1);
+-#else
+-    fprintf(fd,"\";\n\n");			// no Leaf1 in this case.
+-#endif
+-
+-// ================================ 32 bit ================================
+-#ifndef JU_64BIT
+-
+-    GenTable("j__1_BranchBJP","cJU_BITSPERSUBEXPB", 8, cJU_BITSPERSUBEXPB,0,0);
+-
+-    GenTable("j__1_Leaf1", "cJ1_LEAF1_MAXPOP1", 1, cJ1_LEAF1_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf2", "cJ1_LEAF2_MAXPOP1", 2, cJ1_LEAF2_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf3", "cJ1_LEAF3_MAXPOP1", 3, cJ1_LEAF3_MAXPOP1, 0, 0);
+-    GenTable("j__1_LeafW", "cJ1_LEAFW_MAXPOP1", 4, cJ1_LEAFW_MAXPOP1, 0, 1);
+-
+-#endif
+-
+-// ================================ 64 bit ================================
+-#ifdef JU_64BIT
+-    GenTable("j__1_BranchBJP","cJU_BITSPERSUBEXPB",16, cJU_BITSPERSUBEXPB,0,0);
+-
+-    GenTable("j__1_Leaf2", "cJ1_LEAF2_MAXPOP1", 2, cJ1_LEAF2_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf3", "cJ1_LEAF3_MAXPOP1", 3, cJ1_LEAF3_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf4", "cJ1_LEAF4_MAXPOP1", 4, cJ1_LEAF4_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf5", "cJ1_LEAF5_MAXPOP1", 5, cJ1_LEAF5_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf6", "cJ1_LEAF6_MAXPOP1", 6, cJ1_LEAF6_MAXPOP1, 0, 0);
+-    GenTable("j__1_Leaf7", "cJ1_LEAF7_MAXPOP1", 7, cJ1_LEAF7_MAXPOP1, 0, 0);
+-    GenTable("j__1_LeafW", "cJ1_LEAFW_MAXPOP1", 8, cJ1_LEAFW_MAXPOP1, 0, 1);
+-#endif
+-#endif // JUDY1
+-
+-
+-// ================================ JudyL =================================
+-#ifdef JUDYL
+-
+-    fprintf(fd,"#include \"JudyL.h\"\n");
+-
+-    fprintf(fd,"// Leave the malloc() sizes readable in the binary (via "
+-	   "strings(1)):\n");
+-    fprintf(fd,"const char * JudyLMallocSizes = \"JudyLMallocSizes =");
+-
+-    for (ii = 0; AllocSizes[ii] != TERMINATOR; ii++)
+-	fprintf(fd," %d,", AllocSizes[ii]);
+-
+-    fprintf(fd," Leaf1 = %ld\";\n\n", (Word_t)cJL_LEAF1_MAXPOP1);
+-
+-#ifndef JU_64BIT
+-// ================================ 32 bit ================================
+-    GenTable("j__L_BranchBJP","cJU_BITSPERSUBEXPB", 8, cJU_BITSPERSUBEXPB, 0,0);
+-
+-    GenTable("j__L_Leaf1", "cJL_LEAF1_MAXPOP1",  1, cJL_LEAF1_MAXPOP1, BPW,0);
+-    GenTable("j__L_Leaf2", "cJL_LEAF2_MAXPOP1",  2, cJL_LEAF2_MAXPOP1, BPW,0);
+-    GenTable("j__L_Leaf3", "cJL_LEAF3_MAXPOP1",  3, cJL_LEAF3_MAXPOP1, BPW,0);
+-    GenTable("j__L_LeafW", "cJL_LEAFW_MAXPOP1",  4, cJL_LEAFW_MAXPOP1, BPW,1);
+-    GenTable("j__L_LeafV", "cJU_BITSPERSUBEXPL", 4, cJU_BITSPERSUBEXPL,  0,0);
+-#endif // 32 BIT
+-
+-#ifdef JU_64BIT
+-// ================================ 64 bit ================================
+-    GenTable("j__L_BranchBJP","cJU_BITSPERSUBEXPB",16, cJU_BITSPERSUBEXPB, 0,0);
+-
+-    GenTable("j__L_Leaf1", "cJL_LEAF1_MAXPOP1",  1, cJL_LEAF1_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf2", "cJL_LEAF2_MAXPOP1",  2, cJL_LEAF2_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf3", "cJL_LEAF3_MAXPOP1",  3, cJL_LEAF3_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf4", "cJL_LEAF4_MAXPOP1",  4, cJL_LEAF4_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf5", "cJL_LEAF5_MAXPOP1",  5, cJL_LEAF5_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf6", "cJL_LEAF6_MAXPOP1",  6, cJL_LEAF6_MAXPOP1,  BPW,0);
+-    GenTable("j__L_Leaf7", "cJL_LEAF7_MAXPOP1",  7, cJL_LEAF7_MAXPOP1,  BPW,0);
+-    GenTable("j__L_LeafW", "cJL_LEAFW_MAXPOP1",  8, cJL_LEAFW_MAXPOP1,  BPW,1);
+-    GenTable("j__L_LeafV", "cJU_BITSPERSUBEXPL", 8, cJU_BITSPERSUBEXPL, 0,0);
+-#endif // 64 BIT
+-
+-#endif // JUDYL
+-    fclose(fd);
+-
+-    return(0);
+-
+-} // main()
+-- 
+2.51.0
+
diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
index bc33a8b8a1..df80453f3a 100644
--- a/package/netdata/netdata.hash
+++ b/package/netdata/netdata.hash
@@ -1,5 +1,5 @@
-# From https://github.com/netdata/netdata/releases/download/v1.33.1/sha256sums.txt
-sha256  20ba8695d87187787b27128ac3aab9b09aa29ca6b508c48542e0f7d50ec9322b  netdata-v1.33.1.tar.gz
+# From https://github.com/netdata/netdata/releases/download/v1.37.1/sha256sums.txt
+sha256  2caa042d43ca61007a61294a5ececa037d83a1973bd38032233760341eb1706b  netdata-v1.37.1.tar.gz
 
 # Locally calculated
 sha256  0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 4bc573df59..4bf239e1ef 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETDATA_VERSION = 1.33.1
+NETDATA_VERSION = 1.37.1
 NETDATA_SOURCE = netdata-v$(NETDATA_VERSION).tar.gz
 NETDATA_SITE = \
 	https://github.com/netdata/netdata/releases/download/v$(NETDATA_VERSION)
@@ -19,6 +19,9 @@ NETDATA_CONF_OPTS = \
 	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
+# 0001-libjudy-remove-JudyLTablesGen.patch
+NETDATA_AUTORECONF = YES
+
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
 NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
