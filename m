Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ED4C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D08A60E91;
	Sat, 15 Jul 2023 15:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D08A60E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FUZRAZMln7x; Sat, 15 Jul 2023 15:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D61F860E8B;
	Sat, 15 Jul 2023 15:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D61F860E8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8B121BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C3A81375
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C3A81375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQQNJdv4vhc1 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:09:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EAEF81366
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EAEF81366
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:09:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F970A4C0FEC;
 Sat, 15 Jul 2023 17:05:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq2-0002tE-3C;
 Sat, 15 Jul 2023 17:05:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:36 +0200
Message-Id: <20230715150536.2959313-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433539;
 bh=u/gFMFxaeG3Gwbx739vmgVIiJ43/oxvH/fk3EOUa+UU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Np5aJa9t/nxSg0aJQpS3XwlsOYlmOIYYIojCqn8cg68hNY1ShppUl0uV7FRTmA9Et
 OcqWWDbwk8j/4117LJjhPswEwbKhRA6QdpUb8U15JMUMpQQo9jnROMiiXUNRFZUA3v
 ZAP3y09fLjv0NtjihxqEwTW2nri1mZSH1T9dFK3OXcFBtAvyfXRNYIuTEVOHmSkecV
 WDReFeUN/K/9I10h+2WP0q0jPWpIhO1ukOx7cT1muUTsLrfZnxBcuCsdFdsvZ+Xnp4
 PLHigbGXQ6h4QkMR5wSsLTE8fUfKQlvDlXex+mJ7bY8NHdBSt8Zdqr4Y6cDsSXab4L
 LvOdhen0S0jiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Np5aJa9t
Subject: [Buildroot] [PATCH 20/20] package/erlang: bump version to 26.0.2
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for compatibility with OpenSSL 3.x which was added in version 25:
https://github.com/erlang/otp/commit/f11a9f2d3a0c0bdd7dbe204d6c4e50499eb63e4a

Removed all patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...truct-libatomic_ops-we-do-require-CA.patch | 70 -------------------
 ...ulator-reorder-inclued-headers-paths.patch | 46 ------------
 ...0003-crypto-Fixes-for-LibreSSL-3-5-0.patch | 30 --------
 package/erlang/erlang.hash                    |  4 +-
 package/erlang/erlang.mk                      | 13 +---
 5 files changed, 4 insertions(+), 159 deletions(-)
 delete mode 100644 package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
 delete mode 100644 package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
 delete mode 100644 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch

diff --git a/package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch b/package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
deleted file mode 100644
index 8e401430fe..0000000000
--- a/package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 439fa2eae78a8900bda120072335be19d626498c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 28 Dec 2014 23:39:40 +0100
-Subject: [PATCH] erts/ethread: instruct libatomic_ops we do require CAS
-
-We do require compare-and-swap (CAS), so we must instruct libatomic_ops
-to provide it, even if the architecture does not have instructions for
-it.
-
-For example, on ARM, LDREX is required for fast CAS. But LDREX is only
-available on ARMv6, so by default libatomic_ops will not have CAS for
-anything below, like ARMv5. But ARMv5 is always UP, so using an
-emulated CAS (that is signal-asyn-safe) is still possible (albeit much
-slower).
-
-Tell libatomic_ops to provide CAS, even if the hardware is not capable
-of it, by using emulated CAS, as per libatomic_ops dosc:
-    https://github.com/ivmai/libatomic_ops/blob/master/doc/README.txt#L28
-
-    If this is included after defining AO_REQUIRE_CAS, then the package
-    will make an attempt to emulate compare-and-swap in a way that (at
-    least on Linux) should still be async-signal-safe.
-
-Thanks go to Thomas for all this insight! :-)
-Thanks go to Frank for reporting the issue! :-)
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Cc: Frank Hunleth <fhunleth@troodon-software.com>
----
- erts/include/internal/libatomic_ops/ethread.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/erts/include/internal/libatomic_ops/ethread.h b/erts/include/internal/libatomic_ops/ethread.h
-index d65ee19..71d3598 100644
---- a/erts/include/internal/libatomic_ops/ethread.h
-+++ b/erts/include/internal/libatomic_ops/ethread.h
-@@ -35,6 +35,7 @@
- 
- #define ETHR_NATIVE_IMPL__ "libatomic_ops"
- 
-+#define AO_REQUIRE_CAS
- #include "atomic_ops.h"
- #include "ethr_membar.h"
- #include "ethr_atomic.h"
-diff --git a/erts/aclocal.m4 b/erts/aclocal.m4
-index d65ee19..71d3598 100644
---- a/erts/aclocal.m4
-+++ b/erts/aclocal.m4
-@@ -1414,7 +1414,8 @@
- 	    	    fi;;
- 	    esac
- 	    ethr_have_libatomic_ops=no
--	    AC_TRY_LINK([#include "atomic_ops.h"],
-+	    AC_TRY_LINK([#define AO_REQUIRE_CAS
-+                    #include "atomic_ops.h"],
- 	    	        [
- 	    	    	    volatile AO_t x;
- 	    	    	    AO_t y;
-@@ -1455,6 +1455,7 @@
- 	        AC_CHECK_SIZEOF(AO_t, ,
- 	    	    	        [
- 	    	    	    	    #include <stdio.h>
-+	    	    	    	    #define AO_REQUIRE_CAS
- 	    	    	    	    #include "atomic_ops.h"
- 	    	    	        ])
- 	        AC_DEFINE_UNQUOTED(ETHR_SIZEOF_AO_T, $ac_cv_sizeof_AO_t, [Define to the size of AO_t if libatomic_ops is used])
--- 
-1.9.1
-
diff --git a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
deleted file mode 100644
index 7a6e469dff..0000000000
--- a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 85a3e5b4f65e5284e59dcdd90e92ea7d50ef6907 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 8 Feb 2015 17:23:13 +0100
-Subject: [PATCH] erts/emulator: reorder inclued headers paths
-
-If the Perl Compatible Regular Expressions is installed on the
-host and the path to the headers is added to the CFLAGS, the
-pcre.h from the host is used instead of the one provided by
-erlang.
-
-Erlang use an old version of this file which is incompatible
-with the upstream one.
-
-Move INCLUDES before CFLAGS to use pcre.h from erlang.
-
-http://autobuild.buildroot.net/results/cbd/cbd8b54eef535f19d7d400fd269af1b3571d6143/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-[Bernd: rebased for erlang-21.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- erts/emulator/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/erts/emulator/Makefile.in b/erts/emulator/Makefile.in
-index 7145824..d079487 100644
---- a/erts/emulator/Makefile.in
-+++ b/erts/emulator/Makefile.in
-@@ -712,7 +712,7 @@
- # Usually the same as the default rule, but certain platforms (e.g. win32) mix
- # different compilers
- $(OBJDIR)/beam_emu.o: beam/beam_emu.c
--	$(V_EMU_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
-+	$(V_EMU_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
- 
- $(OBJDIR)/beam_emu.S: beam/beam_emu.c
- 	$(V_EMU_CC) -S -fverbose-asm $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
-@@ -765,7 +765,7 @@
- # General targets
- #
- $(OBJDIR)/%.o: beam/%.c
--	$(V_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
-+	$(V_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
- 
- $(OBJDIR)/%.o: $(TARGET)/%.c
- 	$(V_CC) $(CFLAGS) $(INCLUDES) -Idrivers/common -c $< -o $@
diff --git a/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
deleted file mode 100644
index 84c75fef83..0000000000
--- a/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8e5170d79e387d7e898d948a78e0c70407a4030c Mon Sep 17 00:00:00 2001
-From: Hans Nilsson <hans@erlang.org>
-Date: Mon, 14 Feb 2022 15:51:35 +0100
-Subject: [PATCH] crypto: Fixes for LibreSSL 3.5.0
-
-[Retrieved (and backported) from:
-https://github.com/erlang/otp/commit/8e5170d79e387d7e898d948a78e0c70407a4030c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/crypto/c_src/openssl_config.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
-index 6fdd049fb30a..39e4b2d9d7c0 100644
---- a/lib/crypto/c_src/openssl_config.h
-+++ b/lib/crypto/c_src/openssl_config.h
-@@ -122,7 +122,14 @@
- # endif
- #endif
- 
-+#ifdef HAS_LIBRESSL
-+# if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
-+#  define HAS_EVP_PKEY_CTX
-+#  define HAVE_EVP_CIPHER_CTX_COPY
-+# endif
-+#endif
-+
- #ifndef HAS_LIBRESSL
- # if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION_PLAIN(1,0,0)
- #  define HAS_EVP_PKEY_CTX
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 338545a0ba..9fc5a6eabf 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,5 +1,5 @@
-# From https://github.com/erlang/otp/releases/download/OTP-22.3.4.22/SHA256.txt
-sha256  e7f0793e62f8da4f7551dc9c1c0de76c40f19773ba516121fc56315c840f60cc  otp_src_22.3.4.22.tar.gz
+# From https://github.com/erlang/otp/releases/download/OTP-26.0.2/SHA256.txt
+sha256  47853ea9230643a0a31004433f07a71c1b92d6e0094534f629e3b75dbc62f193  otp_src_26.0.2.tar.gz
 
 # Hash for license file
 sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index ac2c204a49..71cca737a3 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 22.3.4.22
+ERLANG_VERSION = 26.0.2
 ERLANG_SITE = \
 	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -27,18 +27,9 @@ define ERLANG_REMOVE_SSL_DEPS
 endef
 ERLANG_POST_PATCH_HOOKS += ERLANG_REMOVE_SSL_DEPS
 
-# Patched erts/aclocal.m4
-define ERLANG_RUN_AUTOCONF
-	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
-endef
-ERLANG_DEPENDENCIES += host-autoconf
-ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
-HOST_ERLANG_DEPENDENCIES += host-autoconf
-HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
-
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.13.2.2
+ERLANG_EI_VSN = 5.4
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
