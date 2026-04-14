Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFDEF9D0ED
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0539A84DB2;
	Tue, 14 Apr 2026 17:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFGAlRbcirVU; Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA3484DB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188941;
	bh=JlzdBRXSVN68h2SSTkni2lOOoSN0uSh5qeqQ8Gi2YSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8tLCyjp7c3v+iNGgu87JcReUmmOdcBMrorqPWsXopsCiAdLhzFqHQZuMUU42+mcn
	 61uyXeNGORv2zJLp54wdLNNP5VzyW2PtJn07Csb9MOnYjHOX1JHupG/4apX2z+zUl0
	 SArbXC/RDWBrPEGOqNdaoBa084Kyy95z5CUx9D8xgub+Et8fJamaaPeO8mMn7sZrTO
	 oZ07dBJsx0U7esP/8NITHyNDtcbgKrcJvKYTyUgePu7Z3iiMKtozJ6uKTdwxCF9+br
	 uCItx9QqZ/ear+5ssiNrznNNA1aD3NOwWzb01D4rteMsHdkFopPODTrw0rsnBsbwe3
	 YnBTS6G1KAdaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA3484DB1;
	Tue, 14 Apr 2026 17:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A96EE375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98B816F4D8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpPWh8zVo_85 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A142C60A61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A142C60A61
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C40D7FB24; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f79afbfb042176dba99c51e26653523fbf58169
X-Git-Newrev: 20a87376c74f1640fa45dfee6a23600a30d3e715
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.3C40D7FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadowsocks-libev: bump version to
 3.3.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20a87376c74f1640fa45dfee6a23600a30d3e715
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/shadowsocks/shadowsocks-libev/releases/tag/v3.3.6

Upstream tarball does not contain submodules so we need to download the
git repo ourselves. Please note that these submodules cannot be provided
as system libraries:
https://github.com/shadowsocks/shadowsocks-libev/commit/6423c8e496fe2e8d37e02b9a2d0472f7f4d6f5c0
"These are vendored code built from git submodules, not system
 libraries, [...]"

Removed all patches, they were either autoconf-related or are included
in this release.

Added patch to fix build with toolchains without c++.

Switched build system to cmake due to upstream removal of autoconf and
switched to pcre2 instead of pcre:
https://github.com/shadowsocks/shadowsocks-libev/commit/7bb250739ef0067c62e4ffd533ec8cee2775995a

The cmake build system always builds dynamic libraries:
https://github.com/shadowsocks/shadowsocks-libev/blob/v3.3.6/src/CMakeLists.txt#L252
so we added a dependency to !BR2_STATIC_LIBS and -DWITH_STATIC=OFF as
configure option.

Please note that this bump will not fix the build errors introduced by
the bump of glibc to version 2.43:
https://github.com/shadowsocks/shadowsocks-libev/issues/3032

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   3 -
 ...txt-Add-LANGUAGES-option-to-project-varia.patch |  29 +++
 ...c-use-pkg-config-to-find-netfilter_conntr.patch |  62 ------
 .../0002-fix-maybe-uninitialized-errors.patch      |  93 ---------
 ...ib-Makefile.am-remove-static-from-LDFLAGS.patch |  61 ------
 .../0004-fix-mbedtls-3-6-compatibility.patch       | 231 ---------------------
 package/shadowsocks-libev/Config.in                |   7 +-
 package/shadowsocks-libev/shadowsocks-libev.hash   |   2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk     |  22 +-
 9 files changed, 45 insertions(+), 465 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a708b081e7..7f230796c0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -861,9 +861,6 @@ package/sentry-native/0001-sentry.h-include-ucontext.h.patch lib_patch.Upstream
 package/ser2net/S50ser2net Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch lib_patch.Upstream
 package/setserial/0001-build-system-fix.patch lib_patch.Upstream
-package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch lib_patch.Upstream
-package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch lib_patch.Upstream
-package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
diff --git a/package/shadowsocks-libev/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch b/package/shadowsocks-libev/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch
new file mode 100644
index 0000000000..8a47e6dded
--- /dev/null
+++ b/package/shadowsocks-libev/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch
@@ -0,0 +1,29 @@
+From cfff08f2ebc0edc89801c6dea97ca9b47d593608 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 4 Apr 2026 09:25:07 +0200
+Subject: [PATCH] CMakeLists.txt: Add LANGUAGES option to project variable
+
+Fixes build with toolchains without c++.
+
+Upstream: https://github.com/shadowsocks/shadowsocks-libev/pull/3033
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 52ff13e..0d9528f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 3.5)
+ 
+-set(PROJECT_NAME shadowsocks-libev)
++set(PROJECT_NAME shadowsocks-libev LANGUAGES C)
+ set(RELEASE_DATE 2026-02-09)
+ set(PROJECT_VERSION "3.3.6")
+ set(PROJECT_DESC "a lightweight secured socks5 proxy")
+-- 
+2.47.3
+
diff --git a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch b/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
deleted file mode 100644
index 781d3c0e64..0000000000
--- a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b3c61360a93b7f08fc9c33526056211408301ea9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 23 Nov 2020 21:16:38 +0100
-Subject: [PATCH] configure.ac: use pkg-config to find netfilter_conntrack
-
-Use pkg-config to retrieve the dependencies of netfilter_conntrack
-and avoid the following build failure when building statically:
-
-configure:13096: /data/buildroot-test/instance-1/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -I/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include -DPCRE_STATIC -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -L/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lnetfilter_conntrack -lnfnetlink -lev  -lcares -lsodium -lmbedcrypto -lpcre  >&5
-/data/buildroot-test/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
-api.c:(.text+0x3f): undefined reference to `mnl_nlmsg_put_header'
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cad497a7ab941a0ee3fd7007defc81e30cdcbe0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/shadowsocks/shadowsocks-libev/pull/2773]
----
- configure.ac    | 5 +++--
- src/Makefile.am | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9787bc2..207c041 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -252,7 +252,8 @@ AC_ARG_ENABLE(connmarktos,
- if test x"$enable_connmarktos" = "xyes" ; then
- 	AC_MSG_NOTICE([Linux Netfilter Conntrack support requested by --enable-connmarktos: ${enable_connmarktos}])
- 	if test "x$enable_connmarktos" != "xno"; then
--	    AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
-+	    PKG_CHECK_MODULES([NETFILTER_CONNTRACK], [libnetfilter_conntrack],,
-+	    [AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
- 	        if test x"$enable_connmarktos" = "xyes"; then
- 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack library not found])
- 	        fi
-@@ -262,7 +263,7 @@ if test x"$enable_connmarktos" = "xyes" ; then
- 	        if test x"$enable_connmarktos" = "xyes"; then
- 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack headers not found])
- 	        fi
--	        with_netfilter_conntrack=no])
-+	        with_netfilter_conntrack=no])])
- 	  # If nothing is broken; enable the libraries usage.
- 	  if test "x$with_netfilter_conntrack" != "xno"; then
- 		with_netfilter_conntrack=yes
-diff --git a/src/Makefile.am b/src/Makefile.am
-index c261ed0..b81ced7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -9,7 +9,7 @@ AM_CFLAGS += -I$(top_srcdir)/libcork/include
- endif
- AM_CFLAGS += $(LIBPCRE_CFLAGS)
- 
--SS_COMMON_LIBS = $(INET_NTOP_LIB) $(LIBPCRE_LIBS)
-+SS_COMMON_LIBS = $(INET_NTOP_LIB) $(LIBPCRE_LIBS) $(NETFILTER_CONNTRACK_LIBS)
- if !USE_SYSTEM_SHARED_LIB
- SS_COMMON_LIBS += $(top_builddir)/libbloom/libbloom.la \
-                   $(top_builddir)/libipset/libipset.la \
--- 
-2.29.2
-
diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
deleted file mode 100644
index 5275323e65..0000000000
--- a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 7 Apr 2022 18:27:58 +0200
-Subject: [PATCH] fix maybe-uninitialized errors
-
-Set {listen,server}_sock to -1 when needed as already done in
-src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
-avoid the following build failure:
-
-local.c: In function 'create_and_bind':
-local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  218 |     return listen_sock;
-      |            ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b1097414979367655a27fa6d60]
----
- src/local.c    | 2 +-
- src/redir.c    | 2 +-
- src/server.c   | 2 +-
- src/tunnel.c   | 2 +-
- src/udprelay.c | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/local.c b/src/local.c
-index b1ab040bb..47d634ce5 100644
---- a/src/local.c
-+++ b/src/local.c
-@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/redir.c b/src/redir.c
-index 4a5a489f0..e60bd4870 100644
---- a/src/redir.c
-+++ b/src/redir.c
-@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/server.c b/src/server.c
-index e9cdc2619..073e38b22 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port, int mptcp)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp, *ipv4v6bindall;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
-diff --git a/src/tunnel.c b/src/tunnel.c
-index e0886bdb9..6641fe62a 100644
---- a/src/tunnel.c
-+++ b/src/tunnel.c
-@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/udprelay.c b/src/udprelay.c
-index 23a042497..580ad4bd8 100644
---- a/src/udprelay.c
-+++ b/src/udprelay.c
-@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp, *ipv4v6bindall;
--    int s, server_sock;
-+    int s, server_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
diff --git a/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch b/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
deleted file mode 100644
index aebdb2305b..0000000000
--- a/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e8ba4d6fd11ce795d9ed7b7a2c0ee0f6bf50f352 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 23 Jul 2022 18:20:00 +0200
-Subject: [PATCH] lib*/Makefile.am: remove -static from LDFLAGS
-
-The libbloom, libcork and libipset libraries are "convenience
-libraries" in libtool speak, and their code ends up being used in a
-shared library, so building them with -static does not work as it
-causes the code to be built without fPIC.
-
-https://www.gnu.org/software/libtool/manual/html_node/Static-libraries.html
-explains:
-
-"""
-If you omit both -rpath and -static, libtool will create a convenience
-library that can be used to create other libtool libraries, even
-shared ones. Just like in the static case, the library behaves as an
-alias to a set of object files and dependency libraries, but in this
-case the object files are suitable for inclusion in shared libraries.
-"""
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libbloom/Makefile.am | 2 --
- libcork/Makefile.am  | 2 --
- libipset/Makefile.am | 2 --
- 3 files changed, 6 deletions(-)
-
-diff --git a/libbloom/Makefile.am b/libbloom/Makefile.am
-index 17c0761..6b2eddd 100644
---- a/libbloom/Makefile.am
-+++ b/libbloom/Makefile.am
-@@ -2,5 +2,3 @@ noinst_LTLIBRARIES = libbloom.la
- 
- libbloom_la_SOURCES = bloom.c murmur2/MurmurHash2.c
- libbloom_la_CFLAGS = -I$(top_srcdir)/libbloom -I$(top_srcdir)/libbloom/murmur2
--
--libbloom_la_LDFLAGS = -static
-diff --git a/libcork/Makefile.am b/libcork/Makefile.am
-index 82ce062..e466a68 100644
---- a/libcork/Makefile.am
-+++ b/libcork/Makefile.am
-@@ -17,5 +17,3 @@ endif
- 
- libcork_la_SOURCES = $(cli_src) $(core_src) $(ds_src) $(pthreads_src) $(posix_src)
- libcork_la_CFLAGS = -I$(top_srcdir)/libcork/include -DCORK_API=CORK_LOCAL
--					 
--libcork_la_LDFLAGS = -static
-diff --git a/libipset/Makefile.am b/libipset/Makefile.am
-index 3edfde6..bee8493 100644
---- a/libipset/Makefile.am
-+++ b/libipset/Makefile.am
-@@ -23,5 +23,3 @@ set_src = src/libipset/set/allocation.c \
- 
- libipset_la_SOURCES = src/libipset/general.c ${bdd_src} ${map_src} ${set_src}
- libipset_la_CFLAGS = -I$(top_srcdir)/libipset/include -I$(top_srcdir)/libcork/include
--
--libipset_la_LDFLAGS = -static
--- 
-2.37.1
-
diff --git a/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch b/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
deleted file mode 100644
index ca46425c4d..0000000000
--- a/package/shadowsocks-libev/0004-fix-mbedtls-3-6-compatibility.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From 9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6 Mon Sep 17 00:00:00 2001
-From: Lu jicong <jiconglu58@gmail.com>
-Date: Fri, 10 Jan 2025 22:05:31 +0800
-Subject: [PATCH] Fix in 'mbedtls 3.6.0 ver' compilation failure issue
-
-Fix mbedtls 3.6 compatibility
-
-Co-authored-by: Zxl hhyccc <zxlhhy@gmail.com>
-Signed-off-by: Lu jicong <jiconglu58@gmail.com>
-Upstream: https://github.com/shadowsocks/shadowsocks-libev/commit/9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- m4/mbedtls.m4 | 20 ++++++++++++++++++++
- src/aead.c    | 23 +++++++++++------------
- src/crypto.c  |  2 +-
- src/crypto.h  |  1 -
- src/stream.c  | 51 ++++++---------------------------------------------
- 5 files changed, 38 insertions(+), 59 deletions(-)
-
-diff --git a/m4/mbedtls.m4 b/m4/mbedtls.m4
-index 2c478b960..a795790ca 100644
---- a/m4/mbedtls.m4
-+++ b/m4/mbedtls.m4
-@@ -31,7 +31,12 @@ AC_DEFUN([ss_MBEDTLS],
-   AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-       [[
-+#include <mbedtls/version.h>
-+#if MBEDTLS_VERSION_NUMBER >= 0x03000000
-+#include <mbedtls/mbedtls_config.h>
-+#else
- #include <mbedtls/config.h>
-+#endif
-       ]],
-       [[
- #ifndef MBEDTLS_CIPHER_MODE_CFB
-@@ -48,7 +53,12 @@ AC_DEFUN([ss_MBEDTLS],
-   AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-       [[
-+#include <mbedtls/version.h>
-+#if MBEDTLS_VERSION_NUMBER >= 0x03000000
-+#include <mbedtls/mbedtls_config.h>
-+#else
- #include <mbedtls/config.h>
-+#endif
-       ]],
-       [[
- #ifndef MBEDTLS_ARC4_C
-@@ -64,7 +74,12 @@ AC_DEFUN([ss_MBEDTLS],
-   AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-       [[
-+#include <mbedtls/version.h>
-+#if MBEDTLS_VERSION_NUMBER >= 0x03000000
-+#include <mbedtls/mbedtls_config.h>
-+#else
- #include <mbedtls/config.h>
-+#endif
-       ]],
-       [[
- #ifndef MBEDTLS_BLOWFISH_C
-@@ -80,7 +95,12 @@ AC_DEFUN([ss_MBEDTLS],
-   AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-       [[
-+#include <mbedtls/version.h>
-+#if MBEDTLS_VERSION_NUMBER >= 0x03000000
-+#include <mbedtls/mbedtls_config.h>
-+#else
- #include <mbedtls/config.h>
-+#endif
-       ]],
-       [[
- #ifndef MBEDTLS_CAMELLIA_C
-diff --git a/src/aead.c b/src/aead.c
-index 358ec9381..73349da64 100644
---- a/src/aead.c
-+++ b/src/aead.c
-@@ -177,9 +177,13 @@ aead_cipher_encrypt(cipher_ctx_t *cipher_ctx,
-     // Otherwise, just use the mbedTLS one with crappy AES-NI.
-     case AES192GCM:
-     case AES128GCM:
--
-+#if MBEDTLS_VERSION_NUMBER < 0x03000000
-         err = mbedtls_cipher_auth_encrypt(cipher_ctx->evp, n, nlen, ad, adlen,
-                                           m, mlen, c, clen, c + mlen, tlen);
-+#else
-+        err = mbedtls_cipher_auth_encrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
-+                                              m, mlen, c, mlen + tlen, clen, tlen);
-+#endif
-         *clen += tlen;
-         break;
-     case CHACHA20POLY1305IETF:
-@@ -226,8 +230,13 @@ aead_cipher_decrypt(cipher_ctx_t *cipher_ctx,
-     // Otherwise, just use the mbedTLS one with crappy AES-NI.
-     case AES192GCM:
-     case AES128GCM:
-+#if MBEDTLS_VERSION_NUMBER < 0x03000000
-         err = mbedtls_cipher_auth_decrypt(cipher_ctx->evp, n, nlen, ad, adlen,
-                                           m, mlen - tlen, p, plen, m + mlen - tlen, tlen);
-+#else
-+        err = mbedtls_cipher_auth_decrypt_ext(cipher_ctx->evp, n, nlen, ad, adlen,
-+                                              m, mlen, p, mlen - tlen, plen, tlen);
-+#endif
-         break;
-     case CHACHA20POLY1305IETF:
-         err = crypto_aead_chacha20poly1305_ietf_decrypt(p, &long_plen, NULL, m, mlen,
-@@ -721,17 +730,7 @@ aead_key_init(int method, const char *pass, const char *key)
-     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
-     memset(cipher, 0, sizeof(cipher_t));
- 
--    if (method >= CHACHA20POLY1305IETF) {
--        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
--        cipher->info             = cipher_info;
--        cipher->info->base       = NULL;
--        cipher->info->key_bitlen = supported_aead_ciphers_key_size[method] * 8;
--        cipher->info->iv_size    = supported_aead_ciphers_nonce_size[method];
--    } else {
--        cipher->info = (cipher_kt_t *)aead_get_cipher_type(method);
--    }
--
--    if (cipher->info == NULL && cipher->key_len == 0) {
-+    if (method < CHACHA20POLY1305IETF && aead_get_cipher_type(method) == NULL) {
-         LOGE("Cipher %s not found in crypto library", supported_aead_ciphers[method]);
-         FATAL("Cannot initialize cipher");
-     }
-diff --git a/src/crypto.c b/src/crypto.c
-index b44d8674c..76c426b53 100644
---- a/src/crypto.c
-+++ b/src/crypto.c
-@@ -103,7 +103,7 @@ crypto_md5(const unsigned char *d, size_t n, unsigned char *md)
-     if (md == NULL) {
-         md = m;
-     }
--#if MBEDTLS_VERSION_NUMBER >= 0x02070000
-+#if MBEDTLS_VERSION_NUMBER < 0x03000000 && MBEDTLS_VERSION_NUMBER >= 0x02070000
-     if (mbedtls_md5_ret(d, n, md) != 0)
-         FATAL("Failed to calculate MD5");
- #else
-diff --git a/src/crypto.h b/src/crypto.h
-index 1791551ff..70707932b 100644
---- a/src/crypto.h
-+++ b/src/crypto.h
-@@ -97,7 +97,6 @@ typedef struct buffer {
- typedef struct {
-     int method;
-     int skey;
--    cipher_kt_t *info;
-     size_t nonce_len;
-     size_t key_len;
-     size_t tag_len;
-diff --git a/src/stream.c b/src/stream.c
-index 35d9050b3..b2e2cea82 100644
---- a/src/stream.c
-+++ b/src/stream.c
-@@ -168,33 +168,6 @@ crypto_stream_xor_ic(uint8_t *c, const uint8_t *m, uint64_t mlen,
-     return 0;
- }
- 
--int
--cipher_nonce_size(const cipher_t *cipher)
--{
--    if (cipher == NULL) {
--        return 0;
--    }
--    return cipher->info->iv_size;
--}
--
--int
--cipher_key_size(const cipher_t *cipher)
--{
--    /*
--     * Semi-API changes (technically public, morally prnonceate)
--     * Renamed a few headers to include _internal in the name. Those headers are
--     * not supposed to be included by users.
--     * Changed md_info_t into an opaque structure (use md_get_xxx() accessors).
--     * Changed pk_info_t into an opaque structure.
--     * Changed cipher_base_t into an opaque structure.
--     */
--    if (cipher == NULL) {
--        return 0;
--    }
--    /* From Version 1.2.7 released 2013-04-13 Default Blowfish keysize is now 128-bits */
--    return cipher->info->key_bitlen / 8;
--}
--
- const cipher_kt_t *
- stream_get_cipher_type(int method)
- {
-@@ -642,34 +615,22 @@ stream_key_init(int method, const char *pass, const char *key)
-     cipher_t *cipher = (cipher_t *)ss_malloc(sizeof(cipher_t));
-     memset(cipher, 0, sizeof(cipher_t));
- 
--    if (method == SALSA20 || method == CHACHA20 || method == CHACHA20IETF) {
--        cipher_kt_t *cipher_info = (cipher_kt_t *)ss_malloc(sizeof(cipher_kt_t));
--        cipher->info             = cipher_info;
--        cipher->info->base       = NULL;
--        cipher->info->key_bitlen = supported_stream_ciphers_key_size[method] * 8;
--        cipher->info->iv_size    = supported_stream_ciphers_nonce_size[method];
--    } else {
--        cipher->info = (cipher_kt_t *)stream_get_cipher_type(method);
--    }
--
--    if (cipher->info == NULL && cipher->key_len == 0) {
-+    if (method < SALSA20 && stream_get_cipher_type(method) == NULL) {
-         LOGE("Cipher %s not found in crypto library", supported_stream_ciphers[method]);
-         FATAL("Cannot initialize cipher");
-     }
- 
-     if (key != NULL)
--        cipher->key_len = crypto_parse_key(key, cipher->key, cipher_key_size(cipher));
-+        cipher->key_len = crypto_parse_key(key, cipher->key,
-+                                           supported_stream_ciphers_key_size[method]);
-     else
--        cipher->key_len = crypto_derive_key(pass, cipher->key, cipher_key_size(cipher));
-+        cipher->key_len = crypto_derive_key(pass, cipher->key,
-+                                            supported_stream_ciphers_key_size[method]);
- 
-     if (cipher->key_len == 0) {
-         FATAL("Cannot generate key and NONCE");
-     }
--    if (method == RC4_MD5) {
--        cipher->nonce_len = 16;
--    } else {
--        cipher->nonce_len = cipher_nonce_size(cipher);
--    }
-+    cipher->nonce_len = supported_stream_ciphers_nonce_size[method];
-     cipher->method = method;
- 
-     return cipher;
diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index fefb27bcc1..b5be19f939 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -4,11 +4,12 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64 # for libcork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_MBEDTLS
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
@@ -27,8 +28,8 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 
 	  If unsure, don't enable this option
 
-comment "shadowsocks-libev needs a toolchain w/ threads"
+comment "shadowsocks-libev needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index 4f1d6d2fa5..1b6febebdd 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb87433488  shadowsocks-libev-3.3.5.tar.gz
+sha256  2de1dbbc9b643e8655b0ed0534b5e10d7182eb2009046897f20ac5383d4c6919  shadowsocks-libev-v3.3.6-git4.tar.gz
 
 # License files, locally calculated
 sha256  736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index c76983ce5e..778daf37b9 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,24 +4,24 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.3.5
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_VERSION = v3.3.6
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev.git
+SHADOWSOCKS_LIBEV_SITE_METHOD = git
+SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_CPE_ID_VENDOR = shadowsocks
-SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
+SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre2
 SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
-# We're patching configure.ac
-SHADOWSOCKS_LIBEV_AUTORECONF = YES
-SHADOWSOCKS_LIBEV_CONF_OPTS = \
-	--with-pcre=$(STAGING_DIR)/usr \
-	--disable-ssp
+SHADOWSOCKS_LIBEV_CONF_OPTS += \
+	-DDISABLE_SSP=ON \
+	-DWITH_STATIC=OFF
 
 ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
 SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
-SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
+SHADOWSOCKS_LIBEV_CONF_OPTS += -DENABLE_CONNMARKTOS=ON
 else
-SHADOWSOCKS_LIBEV_CONF_OPTS += --disable-connmarktos
+SHADOWSOCKS_LIBEV_CONF_OPTS += -DENABLE_CONNMARKTOS=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
