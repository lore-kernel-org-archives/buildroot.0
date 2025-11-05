Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E12FCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD25613D1;
	Wed,  5 Nov 2025 21:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCNWvNBG1djR; Wed,  5 Nov 2025 21:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D46612E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D46612E6;
	Wed,  5 Nov 2025 21:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 376EB4C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AC24101C
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd9vkVXmCb5Q for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 21:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CACF4101B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CACF4101B
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:04:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3749B83D77; Wed,  5 Nov 2025 21:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 21:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac4dc0b95a049a83041716085101d28fb24c424e
X-Git-Newrev: 885f452df12bc0a0c3671ecf4016fb7f6e10606e
X-Patchwork-Hint: ignore
Message-Id: <20251105210433.3749B83D77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: bump to version 6.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4135393469935672715=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4135393469935672715==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=885f452df12bc0a0c3671ecf4016fb7f6e10606e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] has made ncurses a requirement for building the package.

The added patches fix the following build errors:

/usr/bin/install -c -d ../../../lib
buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -shared   -Wl,-export-dynamic -o ../../../lib/libbrlttyxfv.so screen.o -ltinfo
buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/14.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -ltinfo: No such file or directory
collect2: error: ld returned 1 exit status

./unicode.c: In function ‘getTransliteratedCharacter’:
./unicode.c:349:27: error: initialization of ‘iconv_t’ {aka ‘long int’} from ‘void *’ makes integer from pointer without a cast [-Wint-conversion]
  349 |   static iconv_t handle = NULL;
      |                           ^~~~

Update README hash:
- v6.8:
  - Update the copyright from 2024 to 2025.
- v6.7:
  - Update the supported braille devices lists.
  - Add support for the HIMS eMotion.
  - Add support for HT's Activator Pro models.
  - Add support for the KGS Next Touch 40.
  - Change the copyright from 2023 to 2024.
  - Document that HT's Basic Braille Plus models are supported.

Release notes:
https://github.com/brltty/brltty/blob/BRLTTY-6.8/Documents/ChangeLog

[1] https://github.com/brltty/brltty/commit/8f7d65569ef77eec8b8e4b97e68cb5689cf57ef9
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...c-link-fv-driver-with-ltinfo-only-if-avai.patch | 58 +++++++++++++++++
 ...ization-of-iconv_t-with-GCC-14.x-and-uCli.patch | 72 ++++++++++++++++++++++
 package/brltty/Config.in                           |  1 +
 package/brltty/brltty.hash                         |  4 +-
 package/brltty/brltty.mk                           |  9 ++-
 5 files changed, 139 insertions(+), 5 deletions(-)

diff --git a/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
new file mode 100644
index 0000000000..121237ee49
--- /dev/null
+++ b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
@@ -0,0 +1,58 @@
+From a4f55ee941fdc94511c72c1831dedcf5bea7935d Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Thu, 30 Oct 2025 16:52:53 +0100
+Subject: [PATCH] configure.ac: link fv driver with -ltinfo only if available
+
+During the brltty bump to version 6.8 in Buildroot, the build failed on
+systems without libtinfo:
+
+  /usr/bin/ld: cannot find -ltinfo: No such file or directory
+
+Link libtinfo only if the library is present.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/brltty/brltty/pull/503
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 68c9c6d1b7f5..5c931f71b79a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -813,6 +813,7 @@ BRLTTY_ARG_ENABLE(
+ ])
+ AC_SUBST(fuzzer_libs)
+ 
++have_tinfo="no"
+ brltty_curses_libs_save="${LIBS}"
+ BRLTTY_PACKAGE_CHOOSE([curses],
+    [ncursesw ncursesw/ncurses.h],
+@@ -823,8 +824,10 @@ BRLTTY_PACKAGE_CHOOSE([curses],
+    [pdcurses curses.h])
+ if test -n "${curses_package}"
+ then
+-   AC_CHECK_LIB([tinfo], [intrflush])
++   AC_CHECK_LIB([tinfo], [intrflush],
++                [have_tinfo="yes"])
+ fi
++
+ curses_libs="${LIBS%${brltty_curses_libs_save}}"
+ LIBS="${brltty_curses_libs_save}"
+ AC_SUBST([curses_libs])
+@@ -1882,7 +1885,11 @@ in
+       ;;
+ esac
+ 
+-BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++if test "${have_tinfo}" = "yes"; then
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++else
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer])
++fi
+ 
+ all_brltty_pty=""
+ install_brltty_pty=""
+-- 
+2.43.0
+
diff --git a/package/brltty/0003-Fix-initialization-of-iconv_t-with-GCC-14.x-and-uCli.patch b/package/brltty/0003-Fix-initialization-of-iconv_t-with-GCC-14.x-and-uCli.patch
new file mode 100644
index 0000000000..c15cdffac6
--- /dev/null
+++ b/package/brltty/0003-Fix-initialization-of-iconv_t-with-GCC-14.x-and-uCli.patch
@@ -0,0 +1,72 @@
+From 229a5c4319ef32ab837c7029d3a565c4673fdbf7 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Mon, 3 Nov 2025 11:39:53 +0100
+Subject: [PATCH] =?UTF-8?q?Fix=20initialization=20of=20=E2=80=98iconv=5Ft?=
+ =?UTF-8?q?=E2=80=99=20with=20GCC=2014.x=20and=20uClibc?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The patch fixes the following error raised by the compilation of brltty
+with the combination of GCC 14.x and uClibc.
+
+./unicode.c:349:27: error: initialization of ‘iconv_t’ {aka ‘long int’} from ‘void *’ makes integer from pointer without a cast [-Wint-conversion]
+  349 |   static iconv_t handle = NULL;
+      |                           ^~~~
+make[3]: *** [Makefile:366: unicode.o] Error 1
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/brltty/brltty/pull/504
+---
+ Drivers/Braille/TTY/braille.c | 7 ++++---
+ Programs/unicode.c            | 2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/Drivers/Braille/TTY/braille.c b/Drivers/Braille/TTY/braille.c
+index c8cba4999459..a2080532bc53 100644
+--- a/Drivers/Braille/TTY/braille.c
++++ b/Drivers/Braille/TTY/braille.c
+@@ -30,7 +30,8 @@
+ 
+ #ifdef HAVE_ICONV_H
+ #include <iconv.h>
+-static iconv_t conversionDescriptor = NULL;
++#define ICONV_NULL ((iconv_t)-1)
++static iconv_t conversionDescriptor = ICONV_NULL;
+ #endif /* HAVE_ICONV_H */
+ 
+ #include "log.h"
+@@ -211,7 +212,7 @@ brl_construct (BrailleDisplay *brl, char **parameters, const char *device) {
+     logSystemError("iconv_open");
+   }
+ 
+-  conversionDescriptor = NULL;
++  conversionDescriptor = ICONV_NULL;
+ #endif /* HAVE_ICONV_H */
+ 
+   return 0;
+@@ -240,7 +241,7 @@ brl_destruct (BrailleDisplay *brl) {
+ #ifdef HAVE_ICONV_H
+   if (conversionDescriptor) {
+     iconv_close(conversionDescriptor);
+-    conversionDescriptor = NULL;
++    conversionDescriptor = ICONV_NULL;
+   }
+ #endif /* HAVE_ICONV_H */
+ }
+diff --git a/Programs/unicode.c b/Programs/unicode.c
+index 45e43be292c7..cbdcb4382291 100644
+--- a/Programs/unicode.c
++++ b/Programs/unicode.c
+@@ -346,7 +346,7 @@ getBaseCharacter (wchar_t character) {
+ wchar_t
+ getTransliteratedCharacter (wchar_t character) {
+ #ifdef HAVE_ICONV_H
+-  static iconv_t handle = NULL;
++  static iconv_t handle = (iconv_t)-1;
+   if (!handle) handle = iconv_open("ASCII//TRANSLIT", "WCHAR_T");
+ 
+   if (handle != (iconv_t)-1) {
+-- 
+2.43.0
+
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index 3527df6161..70708df6c1 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  A daemon providing access to the Linux console for a blind
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 9b707fc1c2..9b75e0023f 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ab11cfc5fbd7ef0ec876ffea7e131e424b2fd004b6158064e1a2e46412825529  brltty-6.6.tar.xz
+sha256  9f3c6dc2b65059d20f60836e8f9ebc58d8e518d6a8f8fee33e1d1e50ab43c3bc  brltty-6.8.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  72740317768530c60046c591160d4552afb3ac49657b04c7b8452c1bbe7b834e  README
+sha256  a9a8b3eef5f3e2b4716912a4ed60eca78a3f561515ed17ebe80348f2f033b395  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 22d58ebd00..5e24288cbb 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.6
+BRLTTY_VERSION = 6.8
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
@@ -17,6 +17,7 @@ BRLTTY_DEPENDENCIES = \
 	host-autoconf \
 	host-gawk \
 	host-pkgconf \
+	ncurses \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
 BRLTTY_CONF_ENV = \
@@ -37,8 +38,10 @@ BRLTTY_CONF_OPTS = \
 	--without-theta
 
 # Autoreconf is needed because we're patching configure.ac in
-# 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
-# because this package is only autoconf-based.
+# 0001-Fix-linking-error-on-mips64el and
+# 0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.
+# However, a plain autoreconf doesn't work, because this package
+# is only autoconf-based.
 define BRLTTY_AUTOCONF
 	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
 endef

--===============4135393469935672715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4135393469935672715==--
