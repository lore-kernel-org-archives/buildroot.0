Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C014018B;
	Fri, 14 Jan 2022 15:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3GZW8FCOHfi; Fri, 14 Jan 2022 15:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5648D40134;
	Fri, 14 Jan 2022 15:56:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF2701C115D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD33404B0
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uWYSeVR1RSL for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA0C1400FE
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A01E83545; Fri, 14 Jan 2022 15:50:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:53:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: de4e10e8d16c2eebb302954ba44609c6ff4ee279
X-Git-Newrev: 6af6a010f26d1839b3387c80369d4321500ea3ee
X-Patchwork-Hint: ignore
Message-Id: <20220114155006.8A01E83545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pcre2: bump
 version to 10.36
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6af6a010f26d1839b3387c80369d4321500ea3ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- removed 0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
  (upstream [1])

- license file hash update (email update for Philip Hazel)

[1] https://vcs.pcre.org/pcre2?view=revision&revision=1281

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 973990c36fd267168d6a813d010a82c17e943a8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-code-path-of-sljit_emit_cmov-on-mips-r6.patch | 59 ----------------------
 package/pcre2/pcre2.hash                           |  7 +--
 package/pcre2/pcre2.mk                             |  2 +-
 3 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch b/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
deleted file mode 100644
index 9d8e44a3af..0000000000
--- a/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5d7f6573c1eef30a9720edd31a92c1a4b99b7d86 Mon Sep 17 00:00:00 2001
-From: Zoltan Herczeg <zherczeg.u-szeged@partner.samsung.com>
-Date: Tue, 3 Nov 2020 14:12:01 +0100
-Subject: [PATCH] Use the standard code path of sljit_emit_cmov on mips r6.
- (#97)
-
-[Retrieved (and updated to fix paths) from:
-https://github.com/zherczeg/sljit/commit/5d7f6573c1eef30a9720edd31a92c1a4b99b7d86
-SVN commit: https://vcs.pcre.org/pcre2?view=revision&revision=1281]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- sljit_src/sljitLir.c               | 2 +-
- sljit_src/sljitNativeMIPS_common.c | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/sljit/sljitLir.c b/src/sljit/sljitLir.c
-index 4078613..d817c90 100644
---- a/src/sljit/sljitLir.c
-+++ b/src/sljit/sljitLir.c
-@@ -2043,7 +2043,7 @@ static SLJIT_INLINE sljit_s32 emit_mov_before_return(struct sljit_compiler *comp
- #if (defined SLJIT_CONFIG_X86 && SLJIT_CONFIG_X86) \
- 		|| (defined SLJIT_CONFIG_PPC && SLJIT_CONFIG_PPC) \
- 		|| (defined SLJIT_CONFIG_SPARC_32 && SLJIT_CONFIG_SPARC_32) \
--		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1))
-+		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6))
- 
- static SLJIT_INLINE sljit_s32 sljit_emit_cmov_generic(struct sljit_compiler *compiler, sljit_s32 type,
- 	sljit_s32 dst_reg,
-diff --git a/src/sljit/sljitNativeMIPS_common.c b/src/sljit/sljitNativeMIPS_common.c
-index 8b8c12a..ecf4dac 100644
---- a/src/sljit/sljitNativeMIPS_common.c
-+++ b/src/sljit/sljitNativeMIPS_common.c
-@@ -2186,14 +2186,14 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
- 	sljit_s32 dst_reg,
- 	sljit_s32 src, sljit_sw srcw)
- {
--#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
-+#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
- 	sljit_ins ins;
--#endif /* SLJIT_MIPS_REV >= 1 */
-+#endif /* SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6 */
- 
- 	CHECK_ERROR();
- 	CHECK(check_sljit_emit_cmov(compiler, type, dst_reg, src, srcw));
- 
--#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
-+#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
- 
- 	if (SLJIT_UNLIKELY(src & SLJIT_IMM)) {
- #if (defined SLJIT_CONFIG_MIPS_64 && SLJIT_CONFIG_MIPS_64)
-@@ -2250,7 +2250,7 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
- 
- 	return push_inst(compiler, ins | S(src) | D(dst_reg), DR(dst_reg));
- 
--#else /* SLJIT_MIPS_REV < 1 */
-+#else /* SLJIT_MIPS_REV < 1 || SLJIT_MIPS_REV >= 6 */
- 	return sljit_emit_cmov_generic(compiler, type, dst_reg, src, srcw);
- #endif /* SLJIT_MIPS_REV >= 1 */
- }
diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 81313039f0..b30a290968 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2.sig
-sha256  9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613  pcre2-10.35.tar.bz2
+# Locally calculated after checking pgp signature
+# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
+sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
 # Locally computed
-sha256  9cb35e4fe442e49d1fbe9c7e07d9601ac959774b24e1884665a3e2f88b7f0831  LICENCE
+sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 84a8413f8e..d02772650f 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.35
+PCRE2_VERSION = 10.36
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
