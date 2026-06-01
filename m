Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F9CD6E65
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364354085F;
	Mon,  1 Jun 2026 20:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTAfKh-ES0bN; Mon,  1 Jun 2026 20:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F27240851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780344929;
	bh=ubtVfnvkuHdASpHHs81uLw3n0L1JVut7PAew1xcmRoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cp0a6anTYj/hBm9GBiClgDIKyTucoPVckVQyZQ8MFIXXfYJTLjNe5yuB46iqItYnA
	 s79OI6g/oqecsd7evZnnbT3Dnf1LIEQuSZvhBtsyBxNQfg4nZW6CLz3lxJ6rac18+O
	 XnH5WKMrafPgoX3I1IaHqpPuS0w8ccfvX47lTpKn82kAAUwB6X2DQJOqi7d7rDFlo8
	 qtiDQbELkZguf0+HjWJEMoFw/YQuk+8L2ElH0z3kBkOfPOkiHkRxwvdVlPQlX3lSSH
	 CNMNhA+Z7Mk0qe+HlWsPxrFwwIEM58WEvF95WlTv6jwKkdtYR9F/CsoL7KlI5bTFr4
	 Fw0AVTyVJY4PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F27240851;
	Mon,  1 Jun 2026 20:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F20D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E2640149
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvCCr4M62bDL for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32899400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32899400E3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:15:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20AAF86F89; Mon,  1 Jun 2026 20:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 22:14:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d85c36577f19715545cdfc6bee792913377e096
X-Git-Newrev: e2870919b2943c2d4a62127201a0d334fdb5a461
X-Patchwork-Hint: ignore
Message-Id: <20260601201512.20AAF86F89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sane-backends: bump
 version to 1.4.0
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
Content-Type: multipart/mixed; boundary="===============6118197394363129542=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6118197394363129542==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2870919b2943c2d4a62127201a0d334fdb5a461
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://gitlab.com/sane-project/backends/-/releases/1.2.1
https://gitlab.com/sane-project/backends/-/releases/1.3.1
https://gitlab.com/sane-project/backends/-/releases/1.4.0

Removed patch which is included in this release.

Added sha256 tarball provided by upstream.

The build of the umax_pp backend fails for microblazeel/mipsel/powerpc
when used with uClibc (detected by the Gitlab pipelines):

umax_pp_low.c: In function ‘sanei_umax_pp_initPort’:
umax_pp_low.c:835:7: error: implicit declaration of function 'iopl'
 [-Wimplicit-function-declaration]
  835 |   if (iopl (3) != 0)

Fix this by disabling that backend under those conditions. The proper
way to do that would be to patch configure.ac to add an option to
exclude specific backends, and then give the corresponding CONF_OPT.
However, that's quite a complex patch for such a corner case, so instead
simply patch configure to remove the umax_pp backend from ALL_BACKENDS.
We only want to do this conditionally, so do it with sed in a post-patch
hook rather than with a patch.

Fixes:
https://autobuild.buildroot.net/results/364/364bfa29f9df16079dd10be628ddefcf80f581f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Arnout: do it in a post-patch instead of post-extract hook]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...0002-sm3600.h-Fix-build-with-standard-C23.patch | 38 ----------------------
 package/sane-backends/sane-backends.hash           |  6 ++--
 package/sane-backends/sane-backends.mk             | 13 ++++++--
 3 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
deleted file mode 100644
index 287de48285..0000000000
--- a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 90815a9f2576c2428287a500cab6caeddb80f9a8 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 5 Feb 2025 13:19:11 +0100
-Subject: [PATCH] sm3600.h: Fix build with standard C23
-
-bool, true and false are keywords in the standard C23 - the sm3600
-backend defines them on its own, which is forbidden with the new
-standard.
-
-The patch adds ifdef guards for the affected typedef - the old code
-will be used for older standards, C23 will define TBool as bool.
-
-Upstream: https://gitlab.com/sane-project/backends/-/commit/90815a9f2576c2428287a500cab6caeddb80f9a8
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- backend/sm3600.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/backend/sm3600.h b/backend/sm3600.h
-index 2ecbeb236..5d8a8d809 100644
---- a/backend/sm3600.h
-+++ b/backend/sm3600.h
-@@ -77,7 +77,11 @@ Start: 2.4.2001
- 
- /* ====================================================================== */
- 
-+#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
- typedef enum { false, true } TBool;
-+#else
-+typedef bool TBool;
-+#endif /* GCC < 15 */
- 
- typedef SANE_Status TState;
- 
--- 
-GitLab
-
diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index 4282798d65..c2e032c130 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,5 +1,7 @@
-# From https://gitlab.com/sane-project/backends/uploads/d7cf858db3e2abb8fad09cf6b944fc10/sane-backends-1.1.1.sha512.txt
-sha512  25bd9f90d550cfe6a6d01c48e83716a53f4b0e3a294287e455ecb5e5b80c8fe1699f45c6c87f694475cceb85745c70597e18a7b1094669d5091c5fb183dfe94d  sane-backends-1.1.1.tar.gz
+# From https://gitlab.com/-/project/429008/uploads/34e1650a4242a94212983245f375cb8c/sane-backends-1.4.0.sha256.txt
+sha256  f99205c903dfe2fb8990f0c531232c9a00ec9c2c66ac7cb0ce50b4af9f407a72  sane-backends-1.4.0.tar.gz
+# From https://gitlab.com/-/project/429008/uploads/d83587250844bbcfb8678ddb40d643bc/sane-backends-1.4.0.sha512.txt
+sha512  a5ec0cb9e12075be3c4d5eb445a290216c5699645bb6885845868a8323848cef3aafec30f0c380638195a0a8085a8cff4e190741e79ae8f2f70b4d71abeee572  sane-backends-1.4.0.tar.gz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index fe89e7747d..e8fb7038d4 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.1.1
+SANE_BACKENDS_VERSION = 1.4.0
 SANE_BACKENDS_SITE = \
-	https://gitlab.com/sane-project/backends/uploads/7d30fab4e115029d91027b6a58d64b43
+	https://gitlab.com/-/project/429008/uploads/843c156420e211859e974f78f64c3ea3
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
@@ -81,6 +81,15 @@ endef
 
 SANE_BACKENDS_POST_CONFIGURE_HOOKS += SANE_BACKENDS_DISABLE_DOCS
 
+# uClibc does not provide iopl() on these platforms:
+# umax_pp_low.c:835:7: error: implicit declaration of function 'iopl'
+ifeq ($(BR2_microblazeel)$(BR2_mipsel)$(BR2_powerpc)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
+define SANE_BACKENDS_DISABLE_UMAX_PP
+	$(SED) 's/umax_pp //' $(@D)/configure
+endef
+SANE_BACKENDS_POST_PATCH_HOOKS += SANE_BACKENDS_DISABLE_UMAX_PP
+endif
+
 define SANE_BACKENDS_USERS
 	saned -1 saned -1 * /etc/sane.d - - Saned User
 endef

--===============6118197394363129542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6118197394363129542==--
