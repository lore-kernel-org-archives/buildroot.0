Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6607CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E8234000B;
	Fri, 25 Nov 2022 14:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8234000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBKBI99vXRhh; Fri, 25 Nov 2022 14:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9012E40017;
	Fri, 25 Nov 2022 14:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9012E40017
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC3D1BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 656FB41D0F
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656FB41D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilCdWGjtPyh7 for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:09:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB5F41C94
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAB5F41C94
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:09:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8759520008;
 Fri, 25 Nov 2022 14:09:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oyZOA-00FvmY-3U; Fri, 25 Nov 2022 15:09:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 15:09:06 +0100
Message-Id: <20221125140907.3796987-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/netsnmp: security bump to version 5.9.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2022-24805 A buffer overflow in the handling of the INDEX of
  NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.

- CVE-2022-24809 A malformed OID in a GET-NEXT to the nsVacmAccessTable can
  cause a NULL pointer dereference.

- CVE-2022-24806 Improper Input Validation when SETing malformed OIDs in
  master agent and subagent simultaneously

- CVE-2022-24807 A malformed OID in a SET request to
  SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an out-of-bounds memory
  access.

- CVE-2022-24808 A malformed OID in a SET request to
  NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer dereference

- CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTable
  can cause a NULL pointer dereference.

Drop openssl linking patches as they are merged upstream / upstream changed
to use pkg-config for openssl since:

https://github.com/net-snmp/net-snmp/commit/8c3a094fbe9ebe38ed762488082d52c6d4e04ddb

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
./utils/test-pkg -c test.pkg -p netsnmp -a
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: OK
                      br-arm-full-static [29/44]: OK
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 ...figure-static-linking-Fix-SSL-checks.patch | 146 ------------------
 .../0002-configure-Fix-lcrypto-lz-test.patch  |  44 ------
 ..._CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch |  39 -----
 ..._CHECK_FUNCS-TLS_method-TLSv1_method.patch |  39 -----
 package/netsnmp/netsnmp.hash                  |   4 +-
 package/netsnmp/netsnmp.mk                    |   2 +-
 6 files changed, 3 insertions(+), 271 deletions(-)
 delete mode 100644 package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
 delete mode 100644 package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
 delete mode 100644 package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
 delete mode 100644 package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch

diff --git a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
deleted file mode 100644
index bf61fdfe7a..0000000000
--- a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From bd59be8e4e339870a1400f6866a7b73ca11f6460 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Wed, 12 Sep 2018 20:16:39 +0200
-Subject: [PATCH] configure, static linking: Fix SSL checks
-
-During checking of DTLS_method, the stub program is linked only with -ssl
-libssl.a lacks some function from -lcrypto:
-RAND_*()
-ERR_*()
-BUF_MEM_*()
-etc.
-and -lz:
-- inflate()
-- deflate()
-
-Append -lcrypto and -lz to LIBS variable when checking DTLS_method.
-
-See also https://sourceforge.net/p/net-snmp/patches/1374/.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-[bvanassche: Edited subject / rewrote this patch]
-[yann.morin.1998@free.fr:
-  - use an actual backport of bd59be8e4e339870a1400f6866a7b73ca11f6460
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure                   | 52 ++++++++++++++++++++++++++++++++++---
- configure.d/config_os_libs2 | 14 +++++++---
- 2 files changed, 58 insertions(+), 8 deletions(-)
-
-diff --git a/configure b/configure
-index 6504a8e58a..1116cecaad 100755
---- a/configure
-+++ b/configure
-@@ -23228,16 +23228,60 @@ fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_crypto_EVP_md5" >&5
- $as_echo "$ac_cv_lib_crypto_EVP_md5" >&6; }
- if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
--  CRYPTO="crypto"
-+  CRYPTO="crypto"; LIBCRYPTO="-lcrypto"
-+else
-+
-+		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for EVP_md5 in -lcrypto" >&5
-+$as_echo_n "checking for EVP_md5 in -lcrypto... " >&6; }
-+if ${ac_cv_lib_crypto_EVP_md5+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  ac_check_lib_save_LIBS=$LIBS
-+LIBS="-lcrypto -lz $LIBS"
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+
-+/* Override any GCC internal prototype to avoid an error.
-+   Use char because int might match the return type of a GCC
-+   builtin and then its argument prototype would still apply.  */
-+#ifdef __cplusplus
-+extern "C"
-+#endif
-+char EVP_md5 ();
-+int
-+main ()
-+{
-+return EVP_md5 ();
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_link "$LINENO"; then :
-+  ac_cv_lib_crypto_EVP_md5=yes
-+else
-+  ac_cv_lib_crypto_EVP_md5=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext \
-+    conftest$ac_exeext conftest.$ac_ext
-+LIBS=$ac_check_lib_save_LIBS
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_crypto_EVP_md5" >&5
-+$as_echo "$ac_cv_lib_crypto_EVP_md5" >&6; }
-+if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
-+  CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"
-+fi
-+
-+
- fi
- 
--        fi
-+	else
-+	    LIBCRYPTO="-l${CRYPTO}"
-+	fi
- 
-         if test x$CRYPTO != x; then
- 
- $as_echo "#define HAVE_LIBCRYPTO 1" >>confdefs.h
- 
--            LIBCRYPTO="-l${CRYPTO}"
-             netsnmp_save_LIBS="$LIBS"
-             LIBS="$LIBCRYPTO"
-             for ac_func in AES_cfb128_encrypt                           EVP_sha224        EVP_sha384                                   EVP_MD_CTX_create EVP_MD_CTX_destroy                           EVP_MD_CTX_new    EVP_MD_CTX_free                              DH_set0_pqg DH_get0_pqg DH_get0_key                           ASN1_STRING_get0_data X509_NAME_ENTRY_get_object                           X509_NAME_ENTRY_get_data X509_get_signature_nid
-@@ -23291,7 +23335,7 @@ _ACEOF
-             LIBS="$netsnmp_save_LIBS"
-         fi
-         netsnmp_save_LIBS="$LIBS"
--        LIBS="-lssl"
-+        LIBS="-lssl $LIBCRYPTO"
-         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings		       ERR_get_error_all
- do :
-   as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 4a1ad1551f..75214cfff3 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -306,13 +306,19 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
-         LIBS="$netsnmp_save_LIBS"
- 
-         if test x$CRYPTO = x; then
--            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"])
--        fi
-+            AC_CHECK_LIB([crypto], [EVP_md5],
-+			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
-+		AC_CHECK_LIB([crypto], [EVP_md5],
-+			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
-+			     [-lz])
-+	    ])
-+	else
-+	    LIBCRYPTO="-l${CRYPTO}"
-+	fi
- 
-         if test x$CRYPTO != x; then
-             AC_DEFINE(HAVE_LIBCRYPTO, 1,
-                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
--            LIBCRYPTO="-l${CRYPTO}"
-             netsnmp_save_LIBS="$LIBS"
-             LIBS="$LIBCRYPTO"
-             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
-@@ -342,7 +348,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
-             LIBS="$netsnmp_save_LIBS"
-         fi
-         netsnmp_save_LIBS="$LIBS"
--        LIBS="-lssl"
-+        LIBS="-lssl $LIBCRYPTO"
-         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
-                        [SSL_library_init SSL_load_error_strings])
-         LIBS="$netsnmp_save_LIBS"
--- 
-2.25.1
-
diff --git a/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch b/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
deleted file mode 100644
index 50387c8390..0000000000
--- a/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 13da2bcde8e22dd0127a668374fdf79bed04d353 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Mon, 17 Sep 2018 07:33:34 -0700
-Subject: [PATCH] configure: Fix -lcrypto -lz test
-
-Avoid that the second crypto library test uses the cached result from
-the first test by explicitly clearing the cached test result.
-
-[yann.morin.1998@free.fr:
-  - use an actual backport of 13da2bcde8e22dd0127a668374fdf79bed04d353
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure                   | 1 +
- configure.d/config_os_libs2 | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 1116cecaad..33b8c93e57 100755
---- a/configure
-+++ b/configure
-@@ -23231,6 +23231,7 @@ if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
-   CRYPTO="crypto"; LIBCRYPTO="-lcrypto"
- else
- 
-+		unset ac_cv_lib_crypto_EVP_md5
- 		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for EVP_md5 in -lcrypto" >&5
- $as_echo_n "checking for EVP_md5 in -lcrypto... " >&6; }
- if ${ac_cv_lib_crypto_EVP_md5+:} false; then :
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 75214cfff3..81788a2096 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -308,6 +308,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
-         if test x$CRYPTO = x; then
-             AC_CHECK_LIB([crypto], [EVP_md5],
- 			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
-+		unset ac_cv_lib_crypto_EVP_md5
- 		AC_CHECK_LIB([crypto], [EVP_md5],
- 			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
- 			     [-lz])
--- 
-2.25.1
-
diff --git a/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch b/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
deleted file mode 100644
index 4293e15d25..0000000000
--- a/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8e273c688aa235ed9c68570a700d31596bac14df Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Mon, 15 Oct 2018 19:07:05 +0200
-Subject: [PATCH] configure: fix AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
- failure on static linking
-
-If building as static lib, AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
-fails due to missing -lz in $LIBS.
-At the moment, $LIBS contains $LIBCRYPTO only discarding previous $LIBS
-content.
-
-Add $LIBS to:
-LIBS="$LIBCRYPTO"
-as:
-LIBS="$LIBCRYPTO $LIBS"
-This way $LIBS will contain -lz at the end of linking command that in
-static linking build is mandatory.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- configure.d/config_os_libs2 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 81788a209..93044000b 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -321,7 +321,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
-             AC_DEFINE(HAVE_LIBCRYPTO, 1,
-                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
-             netsnmp_save_LIBS="$LIBS"
--            LIBS="$LIBCRYPTO"
-+            LIBS="$LIBCRYPTO $LIBS"
-             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
-                            [EVP_sha224        EVP_sha384        ]dnl
-                            [EVP_MD_CTX_create EVP_MD_CTX_destroy]dnl
--- 
-2.17.1
-
diff --git a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
deleted file mode 100644
index 8fcce2a5c7..0000000000
--- a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1ab6e3fc3cf61fa5a7b7363e59095e868474524b Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Mon, 15 Oct 2018 19:34:26 +0200
-Subject: [PATCH] configure: fix AC_CHECK_FUNCS(TLS_method TLSv1_method
- ...) failure on static linking
-
-If building as static lib, AC_CHECK_FUNCS(TLS_method TLSv1_method ...)
-fails due to missing -lz in $LIBS.
-At the moment, $LIBS contains "-lssl $LIBCRYPTO" only discarding
-previous $LIBS content.
-
-Add $LIBS to:
-LIBS="-lssl $LIBCRYPTO"
-as:
-LIBS="-lssl $LIBCRYPTO $LIBS"
-This way $LIBS will contain -lz at the end of linking command that in
-static linking build is mandatory.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- configure.d/config_os_libs2 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 93044000b..c811c63ec 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -349,7 +349,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
-             LIBS="$netsnmp_save_LIBS"
-         fi
-         netsnmp_save_LIBS="$LIBS"
--        LIBS="-lssl $LIBCRYPTO"
-+        LIBS="-lssl $LIBCRYPTO $LIBS"
-         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
-                        [SSL_library_init SSL_load_error_strings]dnl
- 		       [ERR_get_error_all])
--- 
-2.17.1
-
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index 9d196c8bee..e1e9d10898 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.3/net-snmp-5.9.3.tar.gz.asc
 # using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
-sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
+sha256  2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a  net-snmp-5.9.3.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 985cfeac72..56a07e2ccd 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9
+NETSNMP_VERSION = 5.9.3
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
