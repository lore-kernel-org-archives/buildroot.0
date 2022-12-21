Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0061BC4167B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB7A640BC1;
	Wed, 21 Dec 2022 18:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB7A640BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmvBAuxr8Paz; Wed, 21 Dec 2022 18:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E86A40BD7;
	Wed, 21 Dec 2022 18:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E86A40BD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D21D1BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3CF61094
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3CF61094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c75za3rntPYP for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 185EE6108A
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 185EE6108A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0744D86C75; Wed, 21 Dec 2022 18:03:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:59:40 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0922bbf9055e23bb6bf6b09c5ff08dc76486e3f1
X-Git-Newrev: aaea3f2c3136c0eb4d91a7e0db6d41ec72235367
X-Patchwork-Hint: ignore
Message-Id: <20221221180303.0744D86C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mbedtls: security
 bump to version 2.28.2
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
Content-Type: multipart/mixed; boundary="===============5446880866188936966=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5446880866188936966==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=aaea3f2c3136c0eb4d91a7e0db6d41ec72235367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following security issues:
- Fix potential heap buffer overread and overwrite in DTLS if
  MBEDTLS_SSL_DTLS_CONNECTION_ID is enabled and
  MBEDTLS_SSL_CID_IN_LEN_MAX > 2 * MBEDTLS_SSL_CID_OUT_LEN_MAX.
- An adversary with access to precise enough information about memory
  accesses (typically, an untrusted operating system attacking a secure
  enclave) could recover an RSA private key after observing the victim
  performing a single private-key operation if the window size used for
  the exponentiation was 3 or smaller.

Drop patch (already in version:
https://github.com/Mbed-TLS/mbedtls/commit/9d9d45c6b2aeaedfdfdadfec3d05d168db685968)

https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c2baa583c350b9d594e87f9cab1db597789904df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-x86-PIC-inline-ASM-compilation-with-GCC.patch | 74 ----------------------
 package/mbedtls/mbedtls.hash                       |  4 +-
 package/mbedtls/mbedtls.mk                         |  2 +-
 3 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch b/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
deleted file mode 100644
index 60bf53f6e4..0000000000
--- a/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From a0ae2ba37ca479c6edddec8634b25686be965e0d Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 27 Aug 2018 22:50:57 +0200
-Subject: [PATCH] bn_mul.h: fix x86 PIC inline ASM compilation with GCC < 5
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes #1910
-
-With ebx added to the MULADDC_STOP clobber list to fix #1550, the inline
-assembly fails to build with GCC < 5 in PIC mode with the following error:
-
-include/mbedtls/bn_mul.h:46:13: error: PIC register clobbered by ‘ebx’ in ‘asm’
-
-This is because older GCC versions treated the x86 ebx register (which is
-used for the GOT) as a fixed reserved register when building as PIC.
-
-This is fixed by an improved register allocator in GCC 5+.  From the release
-notes:
-
-Register allocation improvements: Reuse of the PIC hard register, instead of
-using a fixed register, was implemented on x86/x86-64 targets.  This
-improves generated PIC code performance as more hard registers can be used.
-
-https://www.gnu.org/software/gcc/gcc-5/changes.html
-
-As a workaround, detect this situation and disable the inline assembly,
-similar to the MULADDC_CANNOT_USE_R7 logic.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://github.com/ARMmbed/mbedtls/pull/1986
----
- include/mbedtls/bn_mul.h | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/include/mbedtls/bn_mul.h b/include/mbedtls/bn_mul.h
-index b587317d9..74a2d29be 100644
---- a/include/mbedtls/bn_mul.h
-+++ b/include/mbedtls/bn_mul.h
-@@ -50,13 +50,29 @@
- #if defined(__GNUC__) && \
-     ( !defined(__ARMCC_VERSION) || __ARMCC_VERSION >= 6000000 )
- 
-+/*
-+ * GCC < 5.0 treated the x86 ebx (which is used for the GOT) as a
-+ * fixed reserved register when building as PIC, leading to errors
-+ * like: bn_mul.h:46:13: error: PIC register clobbered by ‘ebx’ in ‘asm’
-+ *
-+ * This is fixed by an improved register allocator in GCC 5+. From the
-+ * release notes:
-+ * Register allocation improvements: Reuse of the PIC hard register,
-+ * instead of using a fixed register, was implemented on x86/x86-64
-+ * targets. This improves generated PIC code performance as more hard
-+ * registers can be used.
-+ */
-+#if defined(__GNUC__) && __GNUC__ < 5 && defined(__PIC__)
-+#define MULADDC_CANNOT_USE_EBX
-+#endif
-+
- /*
-  * Disable use of the i386 assembly code below if option -O0, to disable all
-  * compiler optimisations, is passed, detected with __OPTIMIZE__
-  * This is done as the number of registers used in the assembly code doesn't
-  * work with the -O0 option.
-  */
--#if defined(__i386__) && defined(__OPTIMIZE__)
-+#if defined(__i386__) && defined(__OPTIMIZE__) && !defined(MULADDC_CANNOT_USE_EBX)
- 
- #define MULADDC_INIT                        \
-     asm(                                    \
--- 
-2.11.0
-
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 38182fe119..876cd7b77e 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.1:
-sha256  6797a7b6483ef589deeab8d33d401ed235d7be25eeecda1be8ddfed406d40ff4  mbedtls-2.28.1.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.2:
+sha256  bc55232bf71fd66045122ba9050a29ea7cb2e8f99b064a9e6334a82f715881a0  mbedtls-2.28.2.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index af87d62b30..743664a060 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.1
+MBEDTLS_VERSION = 2.28.2
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \

--===============5446880866188936966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5446880866188936966==--
