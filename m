Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94CDC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E3660776;
	Sat, 15 Jul 2023 15:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E3660776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb72QLU4jBbQ; Sat, 15 Jul 2023 15:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DCC60777;
	Sat, 15 Jul 2023 15:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DCC60777
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F22EA1BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0B740948
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0B740948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebI6C9NwUPrH for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:49:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0346640947
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0346640947
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:49:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B66CA4C04DB;
 Sat, 15 Jul 2023 17:49:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60116)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKhWM-00022u-2W;
 Sat, 15 Jul 2023 17:49:23 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:49:22 +0200
Message-Id: <20230715154922.3711825-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689436163;
 bh=ciBVV8WenHUY7pNrLQp/M7xnLoYAu21DGiI3mtFM/9c=;
 h=From:To:Cc:Subject:Date:From;
 b=VVbAbKVAHiXnXAA8yRjLQryOtuTIWdxqSQswayIJTO/1VidvG4MCbNvcDSzlGycNS
 LwYKxz8J51gdqNCztWZqm24XPfSKzF+DPt3fPlyM1gdvIPahofV5Qw/mfoWpq5Rd3a
 z5C3y1ZwH1t9Jwd3ARJOW8ZDOhJEw70Az8Px/uCCpLR8wMlyDG6tJ57vyQmEpFDT+W
 zFMgru86+UUA15v9Zi5aNW6i4JEOX2ELT/ZQR7tA8bqqFNJucoyeaWOGtqyDpEcdhD
 JJWECfP2moEztQFXMABDxpP1z2Dh3/poOX2Ww5+SyIDiv0r3RE8MbuKv84OCwbfM4O
 IOqVikhgfhiow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VVbAbKVA
Subject: [Buildroot] [PATCH v3 20/20] package/erlang: bump version to 26.0.2
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
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for compatibility with OpenSSL 3.x which was added in version 25:
https://github.com/erlang/otp/commit/f11a9f2d3a0c0bdd7dbe204d6c4e50499eb63e4a

Added dependency to wchar due to upstream commit
https://github.com/erlang/otp/commit/bd0865ff86f06bba13a99e38db5d1f0a124e5cb3

Removed all patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: removed patches from .checkpackageignore
v2: added dependency to wchar

 .checkpackageignore                           |  3 -
 ...truct-libatomic_ops-we-do-require-CA.patch | 70 -------------------
 ...ulator-reorder-inclued-headers-paths.patch | 46 ------------
 ...0003-crypto-Fixes-for-LibreSSL-3-5-0.patch | 30 --------
 package/erlang/Config.in                      |  6 +-
 package/erlang/erlang.hash                    |  4 +-
 package/erlang/erlang.mk                      | 13 +---
 7 files changed, 8 insertions(+), 164 deletions(-)
 delete mode 100644 package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
 delete mode 100644 package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
 delete mode 100644 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a762d8e98b..ae90976e12 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -413,9 +413,6 @@ package/empty/0001-respect-LDFLAGS.patch Upstream
 package/erlang-p1-sip/0001-correct-include.patch Upstream
 package/erlang-p1-xmpp/0001-fix-includes.patch Upstream
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch Upstream
-package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch Upstream
-package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch Upstream
-package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch Upstream
 package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
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
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 15931b5896..8f9700bf5c 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -14,14 +14,16 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-comment "erlang needs a toolchain w/ dynamic library, threads"
+comment "erlang needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
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
