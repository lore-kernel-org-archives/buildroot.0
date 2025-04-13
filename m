Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB7CC369B4
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF2E607B0;
	Sun, 13 Apr 2025 09:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahbBAoJMOWCJ; Sun, 13 Apr 2025 09:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF56606EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF56606EB;
	Sun, 13 Apr 2025 09:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A84108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A20B82CEC
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av6rBJEtbEnM for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FB4782C8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB4782C8F
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EA7384558; Sun, 13 Apr 2025 09:42:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 11:33:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06f3d593f65cc52baddadf2c55e582f7310b2ede
X-Git-Newrev: 3358c3e8a8e9cdd06ff93d174e4b674af69fa50a
X-Patchwork-Hint: ignore
Message-Id: <20250413094217.5EA7384558@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmlib: bump version to
 lf-6.12.3-1.0.0-3-g7a58eca
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
Content-Type: multipart/mixed; boundary="===============7233429615075118064=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7233429615075118064==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3358c3e8a8e9cdd06ff93d174e4b674af69fa50a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is technically the master branch, a few commits post release tag.
Change log:

7a58ecaf0d90 fm_lib: explicit conversion to ioc_fm_pcd_exceptions in FM_PCD_SetException()
22a0d3f1867e fm_lib: make REPORT_ERROR() definition more function-like
08ac8b3112a8 fm_lib: fix conversion warnings between e_FmPcdEngine and enum ioc_fm_pcd_engine
168eae74fd8a fm_lib: fix integer-to-pointer conversion build warning in GetDeviceId()

The build fix patch from Buildroot is no longer necessary, remove it.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[Julien: switch _VERSION to use git describe syntax]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eger-conversion-error-and-enum-compare-wa.patch | 79 ----------------------
 package/fmlib/fmlib.hash                           |  2 +-
 package/fmlib/fmlib.mk                             |  2 +-
 3 files changed, 2 insertions(+), 81 deletions(-)

diff --git a/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch b/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch
deleted file mode 100644
index e38b36128f..0000000000
--- a/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 3a1962a70cec74b3dac979e52a2cbcaa8897b9c8 Mon Sep 17 00:00:00 2001
-From: Akhilesh Nema <nemaakhilesh@gmail.com>
-Date: Fri, 10 Jan 2025 20:20:50 -0800
-Subject: [PATCH] Fix the integer conversion error and enum compare
- warnings on build under gcc-14
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Error:
-src/fm_lib.c: In function ‘GetDeviceId’:
-src/fm_lib.c:139:21: error: returning ‘uintptr_t’ {aka ‘long unsigned int’} from a function with return type ‘t_Handle’ {aka ‘void *’} makes pointer from integer without a cast [-Wint-conversion]
-  139 |         return p_Dev->id;
-      |                ~~~~~^~~~
-
-Warnings:
-
-src/fm_lib.c: In function ‘FM_PCD_CcRootModifyNextEngine’:
-src/fm_lib.c:997:51: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
-  997 |         if (p_FmPcdCcNextEngineParams->nextEngine == e_IOC_FM_PCD_FR) {
-      |                                                   ^~
-src/fm_lib.c: In function ‘FM_PCD_MatchTableAddKey’:
-src/fm_lib.c:1103:57: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
- 1103 |     else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
-      |                                                         ^~
-src/fm_lib.c: In function ‘FM_PCD_MatchTableModifyKeyAndNextEngine’:
-src/fm_lib.c:1174:57: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
- 1174 |     else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
-
-Upstream: https://github.com/nxp-qoriq/fmlib/pull/1
-
-Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
----
- src/fm_lib.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/fm_lib.c b/src/fm_lib.c
-index 4ea40ff..85b4a66 100644
---- a/src/fm_lib.c
-+++ b/src/fm_lib.c
-@@ -136,7 +136,7 @@ t_Handle GetDeviceId(t_Handle h_Dev)
- {
- 	t_Device *p_Dev = (t_Device*)h_Dev;
- 
--	return p_Dev->id;
-+	return (t_Handle) p_Dev->id;
- }
- 
- 
-@@ -994,7 +994,7 @@ t_Error FM_PCD_CcRootModifyNextEngine(t_Handle                  h_CcTree,
-     }
- 
- #if (DPAA_VERSION >= 11)
--	if (p_FmPcdCcNextEngineParams->nextEngine == e_IOC_FM_PCD_FR) {
-+	if (p_FmPcdCcNextEngineParams->nextEngine == e_FM_PCD_FR) {
-         t_Device *p_NextDev = (t_Device*) p_FmPcdCcNextEngineParams->params.frParams.h_FrmReplic;
-         params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
-     }
-@@ -1100,7 +1100,7 @@ t_Error FM_PCD_MatchTableAddKey(t_Handle            h_CcNode,
-     	params.key_params.cc_next_engine_params.params.kg_params.p_direct_scheme = UINT_TO_PTR(p_NextDev->id);
-     }
- #if (DPAA_VERSION >= 11)
--    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
-+    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_FM_PCD_FR) {
-     	t_Device *p_NextDev = (t_Device*) p_KeyParams->ccNextEngineParams.params.frParams.h_FrmReplic;
-     	params.key_params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
-     }
-@@ -1171,7 +1171,7 @@ t_Error FM_PCD_MatchTableModifyKeyAndNextEngine(t_Handle            h_CcNode,
-     	params.key_params.cc_next_engine_params.params.kg_params.p_direct_scheme = UINT_TO_PTR(p_NextDev->id);
-     }
- #if (DPAA_VERSION >= 11)
--    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
-+    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_FM_PCD_FR) {
-     	t_Device *p_NextDev = (t_Device*) p_KeyParams->ccNextEngineParams.params.frParams.h_FrmReplic;
-     	params.key_params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
-     }
--- 
-2.25.1
-
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index edf87426df..2d63a615c0 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  173f1c41207e50dd3908c7dad192962240fd1a9269bca6e368f401134b3503bf  fmlib-lf-6.6.52-2.2.0.tar.gz
+sha256  087e1be3584a390cf0a75fa3730589edf76aa9a4832fa012a67c381cbf5b57a3  fmlib-lf-6.12.3-1.0.0-3-g7a58eca.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 601a3e16ef..2d25c0845c 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = lf-6.6.52-2.2.0
+FMLIB_VERSION = lf-6.12.3-1.0.0-3-g7a58eca
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = LICENSE

--===============7233429615075118064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7233429615075118064==--
