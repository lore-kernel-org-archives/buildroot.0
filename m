Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44033FF5136
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB9E60E13;
	Tue,  7 Apr 2026 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyIwVOSo0oUU; Tue,  7 Apr 2026 20:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A7A60E2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592170;
	bh=hKE4Guowq7pNd2Se82pScf8/+1NRvHaenqmTwL1/y1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rhCXfHNcNvPTNVhwGsYgTvLW8Hy5+4KB278fRrcyUCITIJbH9HINfVBeHiplpr6k4
	 aPi+3dPlpCMAZxGpuSnD2c+/iYFvniD2NqHLyUNCZjQ3AtOpMmcXZgM8+Vb9C+qu0n
	 N1ySZIXE5UYo7sSqFXWjhRP47ICaQ+PmwSLjHPdaX3VdbiNL9ePpJD9913NchuwA2F
	 d4glGgUXQunrtHeGiTXZ28J4VSlbITegNLx2qbz5DQrbgTO6mPFNQpb8tfLESZfEQK
	 yKTwR9E3Z+QyCQ/qn3ZSH7rrnJbHtwMthdCz/eu6f4FYlyOHfxUSxDZKy/4n4i5mlJ
	 OqdM3dJwNasjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A7A60E2C;
	Tue,  7 Apr 2026 20:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 271EF237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E145816F9
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mo1MAeBl3U4a for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D840816FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D840816FB
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D61F9807EC; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 21:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48b9974b3866590d3bd6476e830c7c4f95cc4c4d
X-Git-Newrev: 56c6862bc81ef41c0fe012677eafa24381b1f76c
X-Patchwork-Hint: ignore
Message-Id: <20260407200239.D61F9807EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: remove package
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
Content-Type: multipart/mixed; boundary="===============8069841393666488167=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8069841393666488167==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56c6862bc81ef41c0fe012677eafa24381b1f76c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Snort is not maintained for a while now and blocks the removal of the
pcre(v1) package so we remove it from buildroot.

Point to snort3 as an alternative.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |   8 -
 Config.in.legacy                                   |   7 +
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 ...gure.in-Avoid-path-poisoning-with-libpcap.patch |  35 ---
 ...n-Allow-to-override-the-INADDR_NONE-check.patch |  44 ----
 ...n-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch | 239 ---------------------
 ...n-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch |  48 -----
 package/snort/0005-fix-sparc.patch                 |  30 ---
 ...-error-when-building-against-uclibc-or-mu.patch |  34 ---
 ...or-when-building-on-a-Fedora-host-machine.patch |  77 -------
 package/snort/0008-Fix-NO-OPTIMIZE.patch           |  24 ---
 package/snort/0009-gcc-15-fix.patch                |  36 ----
 package/snort/Config.in                            |  27 ---
 package/snort/snort.hash                           |   9 -
 package/snort/snort.mk                             |  49 -----
 package/snort3/Config.in                           |   2 -
 17 files changed, 7 insertions(+), 664 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7f54d8195d..6599435b62 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -874,14 +874,6 @@ package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
 package/smstools3/0001-fix-Makefile.patch lib_patch.Upstream
 package/smstools3/0002-fix-build-with-gcc-10.x.patch lib_patch.Upstream
 package/smstools3/S50smsd Shellcheck lib_sysv.Variables
-package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch lib_patch.Upstream
-package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch lib_patch.Upstream
-package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch lib_patch.Upstream
-package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch lib_patch.Upstream
-package/snort/0005-fix-sparc.patch lib_patch.Upstream
-package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch lib_patch.Upstream
-package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch lib_patch.Upstream
-package/snort/0008-Fix-NO-OPTIMIZE.patch lib_patch.Upstream
 package/solarus/0001-cmake-remove-Werror.patch lib_patch.Upstream
 package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch lib_patch.Sob lib_patch.Upstream
 package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index b6724c9709..078e2fdeac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_SNORT
+	bool "snort removed"
+	select BR2_LEGACY
+	help
+	  snort was no longer maintained upstream, so it has been
+	  dropped. Look at snort3 for an alternative.
+
 config BR2_PACKAGE_CEGUI
 	bool "cegui"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f2548f676b..18197347a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3051,7 +3051,6 @@ F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
 F:	package/sloci-image/
-F:	package/snort/
 F:	package/stella/
 F:	package/tio/
 F:	package/traceroute/
diff --git a/package/Config.in b/package/Config.in
index 9afcf74af9..f12112c1d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2614,7 +2614,6 @@ endif
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
 	source "package/snmpclitools/Config.in"
-	source "package/snort/Config.in"
 	source "package/snort3/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch b/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch
deleted file mode 100644
index 286b6f5883..0000000000
--- a/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 732459ca3423799ae3386df3de3f5d6ea2af1b95 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sun, 1 Apr 2018 15:18:51 +0200
-Subject: [PATCH] configure.in: Avoid path poisoning with libpcap
-
-Prevent usage of unsafe libpcap header path when cross compiling.
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Sergio Prado <sergio.prado@e-labworks.com>
----
-From http://patchwork.ozlabs.org/patch/860363/
----
- configure.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 4b3a5db..1e940b1 100644
---- a/configure.in
-+++ b/configure.in
-@@ -70,8 +70,10 @@ case "$host" in
-   *-linux*)
-     linux="yes"
-     AC_DEFINE([LINUX],[1],[Define if Linux])
--    AC_SUBST(extra_incl)
--    extra_incl="-I/usr/include/pcap"
-+    if test -z "x$with_libpcap_includes"; then
-+        AC_SUBST(extra_incl)
-+        extra_incl="-I/usr/include/pcap"
-+    fi
-     ;;
-   *-hpux10*|*-hpux11*)
-     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
--- 
-2.14.3
-
diff --git a/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch b/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch
deleted file mode 100644
index 6575154240..0000000000
--- a/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a6817677a42d1294f1a3ce7b9f46b10ec557ddfa Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sun, 1 Apr 2018 15:23:59 +0200
-Subject: [PATCH] configure.in: Allow to override the INADDR_NONE check
-
-Prevent configure script from trying to run programs in a cross
-compilation environment to check if INADDR_NONE is defined.
-
-In the context of Buildroot, INADDR_NONE is always defined.
-The snort package will set have_inaddr_none=yes in
-SNORT_CONF_ENV.
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Sergio Prado <sergio.prado@e-labworks.com>
----
- configure.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 1e940b1..938409f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -284,8 +284,8 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
- AC_CHECK_TYPES([boolean])
- 
- # In case INADDR_NONE is not defined (like on Solaris)
-+AC_CACHE_CHECK([for INADDR_NONE], [have_inaddr_none], [
- have_inaddr_none="no"
--AC_MSG_CHECKING([for INADDR_NONE])
- AC_RUN_IFELSE(
- [AC_LANG_PROGRAM(
- [[
-@@ -298,7 +298,7 @@ AC_RUN_IFELSE(
-     return 0;
- ]])],
- [have_inaddr_none="yes"],
--[have_inaddr_none="no"])
-+[have_inaddr_none="no"])])
- AC_MSG_RESULT($have_inaddr_none)
- if test "x$have_inaddr_none" = "xno"; then
- 	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
--- 
-2.14.3
-
diff --git a/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch b/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch
deleted file mode 100644
index 059190ff6d..0000000000
--- a/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 1ef6bdaeb0463a208a14e5d90646ce337df738fc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sun, 1 Apr 2018 15:38:55 +0200
-Subject: [PATCH] configure.in: convert AC_RUN_IFELSE to AC_CHECK_MEMBERS
-
-With AC_CHECK_MEMBERS, we don't need to compile and run a test program
-to check if a daq structure element is defined.
-
-Also check DAQ_Data_Channel_Params_t with params.flags
-
-typedef struct _DAQ_Data_Channel_Params_t
-{
-    unsigned flags;     /* DAQ_DATA_CHANNEL_* flags*/
-    unsigned timeout_ms;/* timeout of the data channel in milliseconds */
-    unsigned length;    /* [Future] length of the data associated with the data channel */
-    uint8_t* data;      /* [Future] opaque data blob to return with the data channel */
-} DAQ_Data_Channel_Params_t;
-
-https://github.com/Xiche/libdaq/blob/master/api/daq_common.h
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Sergio Prado <sergio.prado@e-labworks.com>
----
- configure.in | 143 +++++++++++++++++------------------------------------------
- 1 file changed, 41 insertions(+), 102 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 938409f..571322b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -718,17 +718,11 @@ fi
- AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta] [daq_dp_add_dc])
- 
- AC_MSG_CHECKING([for daq real addresses])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.n_real_dPort = 0;
--]])],
--[have_daq_real_addresses="yes"],
--[have_daq_real_addresses="no"])
-+
-+AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.n_real_dPort],
-+    [have_daq_real_addresses="yes"],
-+    [have_daq_real_addresses="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_real_addresses)
- if test "x$have_daq_real_addresses" = "xyes"; then
-     AC_DEFINE([HAVE_DAQ_REAL_ADDRESSES],[1],
-@@ -756,17 +750,11 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq address space ID])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.address_space_id = 0;
--]])],
--[have_daq_address_space_id="yes"],
--[have_daq_address_space_id="no"])
-+
-+AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.address_space_id],
-+    [have_daq_address_space_id="yes"],
-+    [have_daq_address_space_id="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_address_space_id)
- if test "x$have_daq_address_space_id" = "xyes"; then
-     AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
-@@ -774,17 +762,10 @@ if test "x$have_daq_address_space_id" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq flow ID])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.flow_id = 0;
--]])],
--[have_daq_flow_id="yes"],
--[have_daq_flow_id="no"])
-+AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.flow_id],
-+    [have_daq_flow_id="yes"],
-+    [have_daq_flow_id="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_flow_id)
- if test "x$have_daq_flow_id" = "xyes"; then
-     AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
-@@ -792,19 +773,10 @@ if test "x$have_daq_flow_id" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq extended flow modifiers])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_ModFlow_t mod;
--   mod.type = 0;
--   mod.length = 0;
--   mod.value = NULL;
--]])],
--[have_daq_ext_modflow="yes"],
--[have_daq_ext_modflow="no"])
-+AC_CHECK_MEMBERS([DAQ_ModFlow_t mod.type, DAQ_ModFlow_t mod.length, DAQ_ModFlow_t mod.value],
-+    [have_daq_ext_modflow="yes"],
-+    [have_daq_ext_modflow="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_ext_modflow)
- if test "x$have_daq_ext_modflow" = "xyes"; then
-     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_EXT_MODFLOW"
-@@ -813,19 +785,11 @@ if test "x$have_daq_ext_modflow" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq query flow])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_QueryFlow_t mod;
--   mod.type = 0;
--   mod.length = 0;
--   mod.value = NULL;
--]])],
--[have_daq_queryflow="yes"],
--[have_daq_queryflow="no"])
-+
-+AC_CHECK_MEMBERS([DAQ_QueryFlow_t mod.type, DAQ_QueryFlow_t mod.length, DAQ_QueryFlow_t mod.value],
-+    [have_daq_queryflow="yes"],
-+    [have_daq_queryflow="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_queryflow)
- if test "x$have_daq_queryflow" = "xyes"; then
-     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_QUERYFLOW"
-@@ -834,16 +798,11 @@ if test "x$have_daq_queryflow" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq data channel flags])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_Data_Channel_Params_t params;
--]])],
--[have_daq_data_channel_flags="yes"],
--[have_daq_data_channel_flags="no"])
-+
-+AC_CHECK_MEMBERS([DAQ_Data_Channel_Params_t params.flags],
-+    [have_daq_data_channel_flags="yes"],
-+    [have_daq_data_channel_flags="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_data_channel_flags)
- if test "x$have_daq_data_channel_flags" = "xyes"; then
-     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_PARAMS"
-@@ -852,17 +811,10 @@ if test "x$have_daq_data_channel_flags" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for separate IP versions on pinhole endpoints])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_DP_key_t dpKey;
--   dpKey.src_af = 0;
--]])],
--[have_daq_data_channel_separate_ip_versions="yes"],
--[have_daq_data_channel_separate_ip_versions="no"])
-+AC_CHECK_MEMBERS([DAQ_DP_key_t dpKey.src_af],
-+    [have_daq_data_channel_separate_ip_versions="yes"],
-+    [have_daq_data_channel_separate_ip_versions="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_data_channel_separate_ip_versions)
- if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
-     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_SEPARATE_IP_VERSIONS"
-@@ -889,17 +841,10 @@ if test "x$have_daq_verdict_retry" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for daq packet trace])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.flags = DAQ_PKT_FLAG_TRACE_ENABLED;
--]])],
--[have_daq_packet_trace="yes"],
--[have_daq_packet_trace="no"])
-+AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.flags],
-+    [have_daq_packet_trace="yes"],
-+    [have_daq_packet_trace="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_packet_trace)
- if test "x$have_daq_packet_trace" = "xyes"; then
-     AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
-@@ -909,17 +854,11 @@ else
- fi
- 
- AC_MSG_CHECKING([for daq verdict reason])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_ModFlow_t fl;
--   fl.type = DAQ_MODFLOW_TYPE_VER_REASON;
--]])],
--[have_daq_verdict_reason="yes"],
--[have_daq_verdict_reason="no"])
-+
-+AC_CHECK_MEMBERS([DAQ_ModFlow_t fl.type],
-+    [have_daq_verdict_reason="yes"],
-+    [have_daq_verdict_reason="no"],
-+    [[#include <daq.h>]])
- AC_MSG_RESULT($have_daq_verdict_reason)
- if test "x$have_daq_verdict_reason" = "xyes"; then
-     AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
--- 
-2.14.3
-
diff --git a/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch b/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch
deleted file mode 100644
index 9c5e611b03..0000000000
--- a/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 075b5cf8d3940ed2c39fb37c1e14a652e4a6f2fc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sun, 1 Apr 2018 16:21:31 +0200
-Subject: [PATCH] configure.in: convert AC_RUN_IFELSE to AC_COMPILE_IFELSE
-
-Prevent configure script from trying to run programs in a cross
-compilation environment.
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Sergio Prado <sergio.prado@e-labworks.com>
----
- configure.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 571322b..e489037 100644
---- a/configure.in
-+++ b/configure.in
-@@ -431,7 +431,7 @@ if test "x$LPCAP" = "xno"; then
- fi
- 
- AC_MSG_CHECKING([for pcap_lex_destroy])
--AC_RUN_IFELSE(
-+AC_COMPILE_IFELSE(
- [AC_LANG_PROGRAM(
- [[
- #include <pcap.h>
-@@ -823,7 +823,7 @@ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
- fi
- 
- AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
--AC_RUN_IFELSE(
-+AC_COMPILE_IFELSE(
- [AC_LANG_PROGRAM(
- [[
- #include <daq.h>
-@@ -886,7 +886,7 @@ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
-     OLD_CFLAGS="$CFLAGS"
-     CFLAGS="$CFLAGS -mcpu=v9 "
-     AC_MSG_CHECKING([for sparc %time register])
--    AC_RUN_IFELSE(
-+    AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-     [[]],
-     [[
--- 
-2.14.3
-
diff --git a/package/snort/0005-fix-sparc.patch b/package/snort/0005-fix-sparc.patch
deleted file mode 100644
index 56a294976c..0000000000
--- a/package/snort/0005-fix-sparc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-When checking if the architecture supports the %time register
-instruction, do not force -mcpu to v9 while doing so. Otherwise it's
-like "let's see if this v9 instruction exists when I force the compiler
-to think I'm using v9", which is non-sensical.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-diff -Naurp ./snort-2.9.11.1-orig/configure.in snort-2.9.11.1/configure.in
---- ./snort-2.9.11.1-orig/configure.in	2018-05-10 12:20:19.253510678 +0200
-+++ snort-2.9.11.1/configure.in	2018-05-10 12:40:18.547584998 +0200
-@@ -900,8 +900,6 @@
- 
- # check for sparc %time register
- if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
--    OLD_CFLAGS="$CFLAGS"
--    CFLAGS="$CFLAGS -mcpu=v9 "
-     AC_MSG_CHECKING([for sparc %time register])
-     AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-@@ -915,8 +913,6 @@
-     AC_MSG_RESULT($sparcv9)
-     if test "x$sparcv9" = "xyes"; then
-         AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
--    else
--        CFLAGS="$OLD_CFLAGS"
-     fi
- fi
- 
diff --git a/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch b/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch
deleted file mode 100644
index ce9d5526c8..0000000000
--- a/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc2f54097da3cd493b8f4d06a14ef40be484d24f Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Thu, 21 Feb 2019 15:02:08 -0300
-Subject: [PATCH] Fix compile error when building against uclibc or musl
-
-The build fails when dereferencing the rpcent structure with uclibc or musl C libraries.
-
-../../../src/dynamic-preprocessors/appid/service_plugins/service_rpc.c:241:20:
-error: dereferencing pointer to incomplete type ‘struct rpcent’
-             if (rpc->r_name)
-
-That's because rpc.h should be included when using these C libraries.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- src/dynamic-preprocessors/appid/service_plugins/service_rpc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c b/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
-index 81bc8a5db8ab..2e45246083a8 100644
---- a/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
-+++ b/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
-@@ -32,7 +32,7 @@
- #include "flow.h"
- #include "service_api.h"
- 
--#if defined(FREEBSD) || defined(OPENBSD)
-+#if defined(FREEBSD) || defined(OPENBSD) || (defined(LINUX) && defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__) || !defined(__GLIBC__))
- #include "rpc/rpc.h"
- #endif
- 
--- 
-2.7.4
-
diff --git a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
deleted file mode 100644
index 66d4fa2839..0000000000
--- a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From eae97632157b73f0ca7c099232617b2777d0fa54 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sat, 21 Dec 2019 12:00:42 -0300
-Subject: [PATCH] Fix error when building on a Fedora host machine.
-
-Remove the code that adds unsafe header/library path when
-cross-compiling on a Fedora host machine.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
-[Fabrice: Update for 2.9.18.1 (also fix build on Centos host machine)]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.in | 24 ------------------------
- 1 file changed, 24 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index e6586f399898..fb35d4d7e3e3 100644
---- a/configure.in
-+++ b/configure.in
-@@ -957,54 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
-     AC_DEFINE([DISABLE_DLCLOSE_FOR_VALGRIND_TESTING],[1],[Don't close opened shared objects for valgrind leak testing of dynamic libraries])
- fi
- 
--##################################################
--# Fedora 28+ does not have inbuilt SunRPC support#
--# in glibc and is separately availble in tirpc   #
--# package. Make sure we've got the library and   #
--# link it                                        #
--##################################################
--
--if test -f /etc/fedora-release ; then
--    DISTRO_VERSION=$(awk '{ print $3 }' /etc/fedora-release)
--    if test $DISTRO_VERSION -ge 28 ; then
--        TIRPC=""
--        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
--        echo "$TIRPC"
--        if test "x$TIRPC" = "xno"; then
--            echo
--            echo " ERROR! tirpc not found, get it by running "
--            echo " yum install libtirpc-devel "
--            exit
--        fi
--        LIBS="${LIBS} -ltirpc"
--        extra_incl="-I/usr/include/tirpc"
--    fi
--fi
--
--##################################################
--# Centos 8+ does not have inbuilt SunRPC support  #
--# in glibc and is separately availble in tirpc   #
--# package. Make sure we've got the library and   #
--# link it                                        #
--##################################################
--if test -f /etc/centos-release ; then
--    LINUX_FLAVOUR=$(awk '{ print $1 }' /etc/centos-release)
--    DISTRO_VERSION=`cut -d ' ' -f 4 /etc/centos-release | cut -d '.' -f 1`
--    if [[ "$LINUX_FLAVOUR" == "CentOS" ]] && [[ $DISTRO_VERSION -ge 8 ]]; then
--        TIRPC=""
--        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
--        echo "$TIRPC"
--        if test "x$TIRPC" = "xno"; then
--            echo
--            echo " ERROR! tirpc not found, get it by running "
--            echo " yum install libtirpc-devel or dnf install libtirpc-devel"
--            exit
--        fi
--        LIBS="${LIBS} -ltirpc"
--        extra_incl="-I/usr/include/tirpc"
--    fi
--fi
--
- Z_LIB=""
- AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
- if test "x$Z_LIB" = "xno"; then
--- 
-2.17.1
-
diff --git a/package/snort/0008-Fix-NO-OPTIMIZE.patch b/package/snort/0008-Fix-NO-OPTIMIZE.patch
deleted file mode 100644
index 936973fdd6..0000000000
--- a/package/snort/0008-Fix-NO-OPTIMIZE.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix NO_OPTIMIZE
-
-Fix the following build failure when NO_OPTIMIZE is enabled (e.g. on
-sparc) and -Ofast:
-
-cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'
-
-Fixes:
- - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura snort-2.9.19.orig/configure.in snort-2.9.19/configure.in
---- snort-2.9.19.orig/configure.in	2022-08-09 20:21:00.236777320 +0200
-+++ snort-2.9.19/configure.in	2022-08-09 20:29:02.260993315 +0200
-@@ -1694,7 +1694,7 @@
- 
- # Set to no optimization regardless of what user or autostuff set
- if test "x$NO_OPTIMIZE" = "xyes"; then
--    CFLAGS=`echo $CFLAGS | sed -e "s/-O./-O0/"`
-+    CFLAGS=`echo $CFLAGS | sed -e "s/-O[0-9a-z]*/-O0/"`
- 
-     # in case user override doesn't include -O
-     if echo $CFLAGS | grep -qve -O0 ; then
diff --git a/package/snort/0009-gcc-15-fix.patch b/package/snort/0009-gcc-15-fix.patch
deleted file mode 100644
index 227ad5ffc5..0000000000
--- a/package/snort/0009-gcc-15-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix build with gcc-15.x
-
-Adapted from: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_2_8_snort/112466576
-
-Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/snort/files/snort-2.9.20-gcc-15-fix.patch?id=410cb3ac09ab3d55e96876634c4d58005d9ead89
-
-Upstream: https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
---- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
-+++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
-@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
- static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
- static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
- static uint32_t max(uint32_t a, uint32_t b);
--static uint32_t DCE2_GetReloadSafeMemcap();
-+static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
- 
- static bool dce2_file_cache_is_enabled = false;
- static bool dce2_file_cache_was_enabled = false;
---- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
-+++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
-@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
- 
- fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
- 
--fd_status_t File_Decomp_PDF();
-+fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
- 
- #endif /* FILE_DECOMP_PDF_H */
diff --git a/package/snort/Config.in b/package/snort/Config.in
deleted file mode 100644
index fc74efcfed..0000000000
--- a/package/snort/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-config BR2_PACKAGE_SNORT
-	bool "snort"
-	depends on BR2_USE_WCHAR
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # daq
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
-	select BR2_PACKAGE_LIBDNET
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_DAQ
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_PACKAGE_ZLIB
-	help
-	  Snort is a free and open source network intrusion
-	  prevention system (IPS) and network intrusion detection
-	  system (IDS). It can perform protocol analysis, content
-	  searching/matching, and can be used to detect a variety
-	  of attacks and probes, such as buffer overflows, stealth
-	  port scans, CGI attacks, SMB probes, OS fingerprinting
-	  attempts, and much more.
-
-	  https://www.snort.org
-
-comment "snort needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
deleted file mode 100644
index a807d051d9..0000000000
--- a/package/snort/snort.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# From https://www.snort.org/downloads/snort/md5s
-md5  b52cdf14e97ef953c800c3ef123beaa5  snort-2.9.20.tar.gz
-
-# Locally computed:
-sha256  29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84b4981c  snort-2.9.20.tar.gz
-
-# Hash for license files:
-sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
-sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
deleted file mode 100644
index 8ce8ed5fa6..0000000000
--- a/package/snort/snort.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# snort
-#
-################################################################################
-
-SNORT_VERSION = 2.9.20
-SNORT_SITE = https://www.snort.org/downloads/snort
-SNORT_LICENSE = GPL-2.0
-SNORT_LICENSE_FILES = LICENSE COPYING
-SNORT_CPE_ID_VENDOR = snort
-SNORT_SELINUX_MODULES = snort
-
-SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
-
-# patching configure.in
-SNORT_AUTORECONF = YES
-
-SNORT_CONF_OPTS = \
-	--with-libpcre-includes=$(STAGING_DIR)/usr/include \
-	--with-libpcre-libraries=$(STAGING_DIR)/usr/lib \
-	--with-libpcap-includes=$(STAGING_DIR)/usr/include/pcap \
-	--disable-static-daq
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-SNORT_CFLAGS += -O0
-endif
-
-ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-SNORT_DEPENDENCIES += libtirpc
-SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
-endif
-
-# luajit and openssl should be enabled to build with
-# OpenAppID support
-ifeq ($(BR2_PACKAGE_LUAJIT)$(BR2_PACKAGE_OPENSSL),yy)
-SNORT_DEPENDENCIES += luajit openssl
-SNORT_CONF_OPTS += --enable-open-appid
-else
-SNORT_CONF_OPTS += --disable-open-appid
-endif
-
-SNORT_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" \
-	LIBS="$(SNORT_LIBS)" \
-	have_inaddr_none=yes
-
-$(eval $(autotools-package))
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 8dae65381e..4680b13a4d 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_SNORT3
 	bool "snort3"
 	depends on !BR2_PACKAGE_LUA # luajit
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
-	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # daq3
@@ -38,7 +37,6 @@ config BR2_PACKAGE_SNORT3
 comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
 	depends on !BR2_PACKAGE_LUA
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \

--===============8069841393666488167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8069841393666488167==--
