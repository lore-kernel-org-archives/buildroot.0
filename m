Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAABCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6012D6088E;
	Tue,  3 Sep 2024 19:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVoqrHjf-I65; Tue,  3 Sep 2024 19:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E75E608B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E75E608B9;
	Tue,  3 Sep 2024 19:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95DD61BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B9A40296
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VN-3qxdyiTu for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D31140292
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D31140292
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B42186BB4; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:57:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a5b0519fc772fa9b29690b8ea207aa01a3f8cf51
X-Git-Newrev: 76dda5f00af8d65ec6f4e1ae5d9896bf78bd36ac
X-Patchwork-Hint: ignore
Message-Id: <20240903193519.7B42186BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nginx: security
 update to 1.26.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=76dda5f00af8d65ec6f4e1ae5d9896bf78bd36ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

See here for a Changelog and CVE's:
http://nginx.org/en/CHANGES-1.26

Patch 0006 is no longer required as the openssl library is found without
this patch, which does not apply anymore.

Patch 0009 is no longer required as it was fixed in another way upstream:
https://hg.nginx.org/nginx/rev/fb989e24c60a

Patch 0011 is upstream:
https://hg.nginx.org/nginx/rev/f58b6f636238

Reorder the remaining patches and update .checkpackageignore accordingly.

The LICENSE file is changed, the year changed from 2022 to 2024.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 761259c93400bc806611a242c7dc3df7ff67c231)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   8 +-
 ... 0006-auto-lib-libgd-conf-use-pkg-config.patch} |   0
 ...0006-auto-lib-openssl-conf-use-pkg-config.patch | 251 ---------------------
 ...ngx_linux_config.h-only-include-dlfcn.h-.patch} |   0
 ...cing-of-endianness-for-cross-compilation.patch} |   0
 ...09-auto-os-linux-fix-build-with-libxcrypt.patch |  38 ----
 ...011-Fix-compile-error-in-configure-script.patch |  33 ---
 package/nginx/nginx.hash                           |   4 +-
 package/nginx/nginx.mk                             |   2 +-
 9 files changed, 6 insertions(+), 330 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 15ef1ace68..0fd82e1eb4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -875,11 +875,9 @@ package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch Up
 package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch Upstream
 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch Upstream
 package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch Upstream
-package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch Upstream
-package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch Upstream
-package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch Upstream
-package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch Upstream
-package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch Upstream
+package/nginx/0006-auto-lib-libgd-conf-use-pkg-config.patch Upstream
+package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch Upstream
+package/nginx/0008-Allow-forcing-of-endianness-for-cross-compilation.patch Upstream
 package/nginx/S50nginx Indent Variables
 package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch Upstream
 package/nmap/0001-libdnet-wrapper-configure.patch Upstream
diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-libgd-conf-use-pkg-config.patch
similarity index 100%
rename from package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
rename to package/nginx/0006-auto-lib-libgd-conf-use-pkg-config.patch
diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
deleted file mode 100644
index 4338729658..0000000000
--- a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 4ba4b1e0bd1b69e124eb34c95ae9e7c087370efa Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Fri, 6 May 2016 14:48:31 +0100
-Subject: [PATCH] auto/lib/openssl/conf: use pkg-config
-
-Change to using pkg-config to find the path to openssl and its
-dependencies.
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- auto/lib/openssl/conf | 187 +++++++++++++++++++++---------------------
- 1 file changed, 94 insertions(+), 93 deletions(-)
-
-diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
-index 4fb52df7..9f30490d 100644
---- a/auto/lib/openssl/conf
-+++ b/auto/lib/openssl/conf
-@@ -1,4 +1,3 @@
--
- # Copyright (C) Igor Sysoev
- # Copyright (C) Nginx, Inc.
- 
-@@ -7,123 +6,125 @@ if [ $OPENSSL != NONE ]; then
- 
-     case "$CC" in
- 
--        cl | bcc32)
--            have=NGX_OPENSSL . auto/have
--            have=NGX_SSL . auto/have
--
--            CFLAGS="$CFLAGS -DNO_SYS_TYPES_H"
--
--            CORE_INCS="$CORE_INCS $OPENSSL/openssl/include"
--            CORE_DEPS="$CORE_DEPS $OPENSSL/openssl/include/openssl/ssl.h"
--
--            if [ -f $OPENSSL/ms/do_ms.bat ]; then
--                # before OpenSSL 1.1.0
--                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/ssleay32.lib"
--                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libeay32.lib"
--            else
--                # OpenSSL 1.1.0+
--                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libssl.lib"
--                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libcrypto.lib"
--            fi
--
--            # libeay32.lib requires gdi32.lib
--            CORE_LIBS="$CORE_LIBS gdi32.lib"
--            # OpenSSL 1.0.0 requires crypt32.lib
--            CORE_LIBS="$CORE_LIBS crypt32.lib"
--        ;;
--
--        *)
--            have=NGX_OPENSSL . auto/have
--            have=NGX_SSL . auto/have
--
--            CORE_INCS="$CORE_INCS $OPENSSL/.openssl/include"
--            CORE_DEPS="$CORE_DEPS $OPENSSL/.openssl/include/openssl/ssl.h"
--            CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libssl.a"
--            CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libcrypto.a"
--            CORE_LIBS="$CORE_LIBS $NGX_LIBDL"
--            CORE_LIBS="$CORE_LIBS $NGX_LIBPTHREAD"
--
--            if [ "$NGX_PLATFORM" = win32 ]; then
--                CORE_LIBS="$CORE_LIBS -lgdi32 -lcrypt32 -lws2_32"
--            fi
--        ;;
-+	cl | bcc32)
-+	    have=NGX_OPENSSL . auto/have
-+	    have=NGX_SSL . auto/have
-+
-+	    CFLAGS="$CFLAGS -DNO_SYS_TYPES_H"
-+
-+	    CORE_INCS="$CORE_INCS $OPENSSL/openssl/include"
-+	    CORE_DEPS="$CORE_DEPS $OPENSSL/openssl/include/openssl/ssl.h"
-+
-+	    if [ -f $OPENSSL/ms/do_ms.bat ]; then
-+		# before OpenSSL 1.1.0
-+		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/ssleay32.lib"
-+		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libeay32.lib"
-+	    else
-+		# OpenSSL 1.1.0+
-+		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libssl.lib"
-+		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libcrypto.lib"
-+	    fi
-+
-+	    # libeay32.lib requires gdi32.lib
-+	    CORE_LIBS="$CORE_LIBS gdi32.lib"
-+	    # OpenSSL 1.0.0 requires crypt32.lib
-+	    CORE_LIBS="$CORE_LIBS crypt32.lib"
-+	;;
-+
-+	*)
-+	    have=NGX_OPENSSL . auto/have
-+	    have=NGX_SSL . auto/have
-+
-+	    CORE_INCS="$CORE_INCS $OPENSSL/.openssl/include"
-+	    CORE_DEPS="$CORE_DEPS $OPENSSL/.openssl/include/openssl/ssl.h"
-+	    CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libssl.a"
-+	    CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libcrypto.a"
-+	    CORE_LIBS="$CORE_LIBS $NGX_LIBDL"
-+	    CORE_LIBS="$CORE_LIBS $NGX_LIBPTHREAD"
-+
-+	    if [ "$NGX_PLATFORM" = win32 ]; then
-+		CORE_LIBS="$CORE_LIBS -lgdi32 -lcrypt32 -lws2_32"
-+	    fi
-+	;;
-     esac
- 
- else
- 
-     if [ "$NGX_PLATFORM" != win32 ]; then
- 
--        OPENSSL=NO
-+	OPENSSL=NO
- 
--        ngx_feature="OpenSSL library"
--        ngx_feature_name="NGX_OPENSSL"
--        ngx_feature_run=no
--        ngx_feature_incs="#include <openssl/ssl.h>"
--        ngx_feature_path=
--        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL $NGX_LIBPTHREAD"
--        ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
--        . auto/feature
-+	ngx_feature="OpenSSL library"
-+	ngx_feature_name="NGX_OPENSSL"
-+	ngx_feature_run=no
-+	ngx_feature_incs="#include <openssl/ssl.h>"
-+	ngx_feature_path=
-+	ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
-+			    sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
-+	ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
-+	ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
-+	. auto/feature
- 
--        if [ $ngx_found = no ]; then
-+	if [ $ngx_found = no ]; then
- 
--            # FreeBSD port
-+	    # FreeBSD port
- 
--            ngx_feature="OpenSSL library in /usr/local/"
--            ngx_feature_path="/usr/local/include"
-+	    ngx_feature="OpenSSL library in /usr/local/"
-+	    ngx_feature_path="/usr/local/include"
- 
--            if [ $NGX_RPATH = YES ]; then
--                ngx_feature_libs="-R/usr/local/lib -L/usr/local/lib -lssl -lcrypto"
--            else
--                ngx_feature_libs="-L/usr/local/lib -lssl -lcrypto"
--            fi
-+	    if [ $NGX_RPATH = YES ]; then
-+		ngx_feature_libs="-R/usr/local/lib -L/usr/local/lib -lssl -lcrypto"
-+	    else
-+		ngx_feature_libs="-L/usr/local/lib -lssl -lcrypto"
-+	    fi
- 
--            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
-+	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
- 
--            . auto/feature
--        fi
-+	    . auto/feature
-+	fi
- 
--        if [ $ngx_found = no ]; then
-+	if [ $ngx_found = no ]; then
- 
--            # NetBSD port
-+	    # NetBSD port
- 
--            ngx_feature="OpenSSL library in /usr/pkg/"
--            ngx_feature_path="/usr/pkg/include"
-+	    ngx_feature="OpenSSL library in /usr/pkg/"
-+	    ngx_feature_path="/usr/pkg/include"
- 
--            if [ $NGX_RPATH = YES ]; then
--                ngx_feature_libs="-R/usr/pkg/lib -L/usr/pkg/lib -lssl -lcrypto"
--            else
--                ngx_feature_libs="-L/usr/pkg/lib -lssl -lcrypto"
--            fi
-+	    if [ $NGX_RPATH = YES ]; then
-+		ngx_feature_libs="-R/usr/pkg/lib -L/usr/pkg/lib -lssl -lcrypto"
-+	    else
-+		ngx_feature_libs="-L/usr/pkg/lib -lssl -lcrypto"
-+	    fi
- 
--            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
-+	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
- 
--            . auto/feature
--        fi
-+	    . auto/feature
-+	fi
- 
--        if [ $ngx_found = no ]; then
-+	if [ $ngx_found = no ]; then
- 
--            # MacPorts
-+	    # MacPorts
- 
--            ngx_feature="OpenSSL library in /opt/local/"
--            ngx_feature_path="/opt/local/include"
-+	    ngx_feature="OpenSSL library in /opt/local/"
-+	    ngx_feature_path="/opt/local/include"
- 
--            if [ $NGX_RPATH = YES ]; then
--                ngx_feature_libs="-R/opt/local/lib -L/opt/local/lib -lssl -lcrypto"
--            else
--                ngx_feature_libs="-L/opt/local/lib -lssl -lcrypto"
--            fi
-+	    if [ $NGX_RPATH = YES ]; then
-+		ngx_feature_libs="-R/opt/local/lib -L/opt/local/lib -lssl -lcrypto"
-+	    else
-+		ngx_feature_libs="-L/opt/local/lib -lssl -lcrypto"
-+	    fi
- 
--            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
-+	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
- 
--            . auto/feature
--        fi
-+	    . auto/feature
-+	fi
- 
--        if [ $ngx_found = yes ]; then
--            have=NGX_SSL . auto/have
--            CORE_INCS="$CORE_INCS $ngx_feature_path"
--            CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
--            OPENSSL=YES
--        fi
-+	if [ $ngx_found = yes ]; then
-+	    have=NGX_SSL . auto/have
-+	    CORE_INCS="$CORE_INCS $ngx_feature_path"
-+	    CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
-+	    OPENSSL=YES
-+	fi
-     fi
- 
-     if [ $OPENSSL != YES ]; then
-@@ -136,7 +137,7 @@ into the system, or build the OpenSSL library statically from the source
- with nginx by using --with-openssl=<path> option.
- 
- END
--        exit 1
-+	exit 1
-     fi
- 
- fi
--- 
-2.17.1
-
diff --git a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
similarity index 100%
rename from package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
rename to package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
diff --git a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch b/package/nginx/0008-Allow-forcing-of-endianness-for-cross-compilation.patch
similarity index 100%
rename from package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
rename to package/nginx/0008-Allow-forcing-of-endianness-for-cross-compilation.patch
diff --git a/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch b/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
deleted file mode 100644
index 8b368d946f..0000000000
--- a/package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 79f1fe5251afc4e22a138b0c8f44fc9c94093b8b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Apr 2021 09:18:26 +0200
-Subject: [PATCH] auto/os/linux: fix build with libxcrypt
-
-If crypt_r is found in libcrypt, add -lcrypt to CORE_LIBS to avoid the
-following build failure with libxcrypt:
-
-objs/ngx_modules.o \
--lpcre -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lcrypto -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lxslt -lxml2 -lGeoIP \
--Wl,-E
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: objs/src/os/unix/ngx_user.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/nginx-1.18.0/src/os/unix/ngx_user.c:18: undefined reference to `crypt_r'
-
-Fixes:
- - http://autobuild.buildroot.org/results/79a51b0d348e756517b5c9ce815a67f5c657e7e6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- auto/os/linux | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/auto/os/linux b/auto/os/linux
-index 5e280eca..04682812 100644
---- a/auto/os/linux
-+++ b/auto/os/linux
-@@ -232,6 +232,9 @@ ngx_feature_test="struct crypt_data  cd;
-                   crypt_r(\"key\", \"salt\", &cd);"
- . auto/feature
- 
-+if [ $ngx_found = yes ]; then
-+    CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
-+fi
- 
- ngx_include="sys/vfs.h";     . auto/include
- 
--- 
-2.30.2
-
diff --git a/package/nginx/0011-Fix-compile-error-in-configure-script.patch b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
deleted file mode 100644
index 672162759e..0000000000
--- a/package/nginx/0011-Fix-compile-error-in-configure-script.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e1bcac837f6aeabc4ddece06ecbcf2bcca8dd651 Mon Sep 17 00:00:00 2001
-From: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Date: Thu, 16 May 2024 11:15:10 +0200
-Subject: [PATCH] Configure: fixed building libatomic test.
-
-Using "long *" instead of "AO_t *" leads either to -Wincompatible-pointer-types
-or -Wpointer-sign warnings, depending on whether long and size_t are compatible
-types (e.g., ILP32 versus LP64 data models).  Notably, -Wpointer-sign warnings
-are enabled by default in Clang only, and -Wincompatible-pointer-types is an
-error starting from GCC 14.
-
-Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
-Upstream: https://hg.nginx.org/nginx/rev/f58b6f636238
----
- auto/lib/libatomic/conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
-index d1e484a..0f12b9c 100644
---- a/auto/lib/libatomic/conf
-+++ b/auto/lib/libatomic/conf
-@@ -20,7 +20,7 @@ else
-                       #include <atomic_ops.h>"
-     ngx_feature_path=
-     ngx_feature_libs="-latomic_ops"
--    ngx_feature_test="long  n = 0;
-+    ngx_feature_test="AO_t  n = 0;
-                       if (!AO_compare_and_swap(&n, 0, 1))
-                           return 1;
-                       if (AO_fetch_and_add(&n, 1) != 1)
--- 
-2.34.1
-
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 24bc588d85..0b45f96a45 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d  nginx-1.24.0.tar.gz
+sha256  f9187468ff2eb159260bfd53867c25ff8e334726237acf227b9e870e53d3e36b  nginx-1.26.1.tar.gz
 # License files, locally calculated
-sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
+sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 7bd2173b48..e63acc7b16 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.24.0
+NGINX_VERSION = 1.26.1
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
