Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF23C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4AF460FD3;
	Tue, 26 Jul 2022 17:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AF460FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BebvznT8865M; Tue, 26 Jul 2022 17:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC00360D55;
	Tue, 26 Jul 2022 17:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC00360D55
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2C61BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45D5360D55
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D5360D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWufjIBfPuCs for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 751A960B94
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751A960B94
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 39B6085F2A; Tue, 26 Jul 2022 17:39:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 19:52:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3915a3f589d95b6793125f03d295671606d86e84
X-Git-Newrev: 736c4c1655d93652a9a7e79235bbe726b3d46176
X-Patchwork-Hint: ignore
Message-Id: <20220726173901.39B6085F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=736c4c1655d93652a9a7e79235bbe726b3d46176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRADIUS is an open source server which implements
a protocol for remote user Authorization, Authentication
and Accounting.

There are many modules. All modules without dependencies are enabled.
The modules with a dependency that we have are automatically enabled if
the dependency is enabled. Modules with dependencies we don't support
are explicitly disabled.

The configure script always looks in host directories for libraries, so
it is essential to explicitly disable everything that is not actually
provided.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@collins.com>
[Arnout:
 - remove second patch, superseded by other patches;
 - add upstream links to patches;
 - add more patches to avoid looking in host directories;
 - explicitly add dependency on !static inherited from talloc (redundant
   with glibc, but future-safe);
 - simplify Config.in comment;
 - check hash with PGP signature;
 - add conf opts for runtime paths;
 - add conf opts to disable unsupported modules;
 - add more optional dependencies;
 - enable/disable all modules that use a dependency;
 - search defaults file in /etc/default, not /etc/sysconfig.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |   2 +
 package/Config.in                                  |   1 +
 .../0001-jlibtool-cross-with-host-CC.patch         |  33 ++++
 .../0002-configure.ac-add-option-for-libcap.patch  |  75 +++++++
 ...0003-configure.ac-allow-cross-compilation.patch |  42 ++++
 ...-error-for-expansion-of-macro-in-thread.h.patch |  66 +++++++
 ...05-modules-rlm_sql-remove-mysql_version.h.patch |  37 ++++
 .../0006-configure.ac-add-option-for-pcap.patch    |  80 ++++++++
 ...onfigure.ac-add-option-for-collectdclient.patch |  67 +++++++
 ...c-try-execinfo-in-libc-before-searching-l.patch |  71 +++++++
 package/freeradius-server/Config.in                |  18 ++
 package/freeradius-server/freeradius-server.hash   |   4 +
 package/freeradius-server/freeradius-server.mk     | 215 +++++++++++++++++++++
 package/freeradius-server/radiusd.service          |  38 ++++
 14 files changed, 749 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dede4b83b..90319c3837 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -693,6 +693,7 @@ N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/freeradius-server/
 F:	package/librelp/
 F:	package/libtalloc/
 
@@ -1936,6 +1937,7 @@ F:	package/ethtool/
 F:	package/flashbench/
 F:	package/fmc/
 F:	package/fmlib/
+F:	package/freeradius-server/
 F:	package/git/
 F:	package/gnutls/
 F:	package/hostapd/
diff --git a/package/Config.in b/package/Config.in
index d264449b30..c9dcc4d37a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2223,6 +2223,7 @@ endif
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeradius-server/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/frr/Config.in"
diff --git a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
new file mode 100644
index 0000000000..398f88e4ad
--- /dev/null
+++ b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
@@ -0,0 +1,33 @@
+From 8a8506320acf3ea18940a6e3a447d7d394a3bd8e Mon Sep 17 00:00:00 2001
+From: David Gouarin <david.gouarin@thalesgroup.com>
+Date: Mon, 12 Apr 2021 11:05:54 -0500
+Subject: [PATCH] jlibtool cross with host CC
+
+jlibtool.c: while cross compiling, use host CC instead of target CC to build jlibtool
+
+Upstream: Not applicable
+
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ scripts/libtool.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/libtool.mk b/scripts/libtool.mk
+index 57915e1053..c28260dd7e 100644
+--- a/scripts/libtool.mk
++++ b/scripts/libtool.mk
+@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+     # binary!
+     ${JLIBTOOL}: ${top_makedir}/jlibtool.c
+ 	$(Q)mkdir -p $(dir $@)
+-	$(Q)echo CC jlibtool.c
+-	$(Q)${CC} $< -o $@
++	$(Q)echo HOSTCC jlibtool.c
++	$(Q)${HOSTCC} $< -o $@
+ 
+     clean: jlibtool_clean
+ 
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0002-configure.ac-add-option-for-libcap.patch b/package/freeradius-server/0002-configure.ac-add-option-for-libcap.patch
new file mode 100644
index 0000000000..77ef3d180f
--- /dev/null
+++ b/package/freeradius-server/0002-configure.ac-add-option-for-libcap.patch
@@ -0,0 +1,75 @@
+From 404f18da62e3708c9b290ee4eaf8461911df5475 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 22 Aug 2019 10:50:21 +0800
+Subject: [PATCH] configure.ac: add option for libcap
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+---
+ configure.ac | 36 +++++++++++++++++++++++++++---------
+ 1 file changed, 27 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c72511ab39..de016b28e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -941,6 +941,22 @@ fi
+ dnl Set by FR_SMART_CHECKLIB
+ LIBS="${old_LIBS}"
+ 
++dnl #
++dnl #  extra argument: --with-libcap
++dnl #
++WITH_LIBCAP=yes
++AC_ARG_WITH(libcap,
++[  --with-licap          use licap for debugger checks. (default=yes)],
++[ case "$withval" in
++  no)
++    WITH_LIBCAP=no
++    ;;
++  *)
++    WITH_LIBCAP=yes
++    ;;
++  esac ]
++)
++
+ dnl Check for cap
+ dnl extra argument: --with-cap-lib-dir=DIR
+ cap_lib_dir=
+@@ -974,15 +990,17 @@ AC_ARG_WITH(cap-include-dir,
+       ;;
+   esac])
+ 
+-smart_try_dir="$cap_lib_dir"
+-FR_SMART_CHECK_LIB(cap, cap_get_proc)
+-if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
+-  AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
+-else
+-  AC_DEFINE(HAVE_LIBCAP, 1,
+-    [Define to 1 if you have the `cap' library (-lcap).]
+-  )
+-  HAVE_LIBCAP=1
++if test "x$WITH_LIBCAP" = xyes; then
++  smart_try_dir="$cap_lib_dir"
++  FR_SMART_CHECK_LIB(cap, cap_get_proc)
++  if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
++    AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
++  else
++    AC_DEFINE(HAVE_LIBCAP, 1,
++      [Define to 1 if you have the `cap' library (-lcap).]
++    )
++    HAVE_LIBCAP=1
++  fi
+ fi
+ 
+ dnl #
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch b/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch
new file mode 100644
index 0000000000..d6d1bcfc78
--- /dev/null
+++ b/package/freeradius-server/0003-configure.ac-allow-cross-compilation.patch
@@ -0,0 +1,42 @@
+From d6c1da041da77902a06d10bf03ef454468921801 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 15:03:39 +0800
+Subject: [PATCH] configure.ac: allow cross-compilation
+
+The checking OpenSSL library and header version consistency will
+always fail in cross compiling, skip the check and give a warning
+instead for cross compiling.
+
+Upstream-Status: Inappropriate[embedded specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+update to new version 3.0.17 to fix patch warning
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+---
+ src/modules/rlm_krb5/configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
+index efc9f29d7f..98a97e438a 100644
+--- a/src/modules/rlm_krb5/configure.ac
++++ b/src/modules/rlm_krb5/configure.ac
+@@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
+ 		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
+ 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
+ 			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
+-				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
++				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
++				[AC_MSG_WARN(cross compiling: not checking)])
+ 		fi
+ 	else
+ 		krb5threadsafe=""
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch b/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch
new file mode 100644
index 0000000000..00eb63c0f2
--- /dev/null
+++ b/package/freeradius-server/0004-fix-error-for-expansion-of-macro-in-thread.h.patch
@@ -0,0 +1,66 @@
+From dae3b7c53171dfeacce91e0da1c8bd4e4166352e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 18 Jan 2017 14:59:39 +0800
+Subject: [PATCH] fix error for expansion of macro in thread.h
+
+The parameter declaration is missing in expansion of macro
+which cause the build error:
+| In file included from src/freeradius-devel/libradius.h:80:0,
+|                  from src/lib/log.c:26:
+| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
+| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
+|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
+|                                ^
+
+Add the missing declaration in macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+Upstream: N/A, code has changed
+---
+ src/include/threads.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/include/threads.h b/src/include/threads.h
+index e36d81dac0..2bcb6aadcb 100644
+--- a/src/include/threads.h
++++ b/src/include/threads.h
+@@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ #  define fr_thread_local_get(_n) _n
+ #elif defined(HAVE_PTHREAD_H)
+ #  include <pthread.h>
+-#  define fr_thread_local_setup(_t, _n) \
++#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
+ static pthread_key_t __fr_thread_local_key_##_n;\
+ static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
+ static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
+@@ -100,17 +100,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
+ static void __fr_thread_local_key_init_##_n(void)\
+ {\
+ 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
+-	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ }\
+ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ {\
+ 	__fr_thread_local_destructor_##_n = func;\
+ 	if (_n) return _n; \
+ 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
++	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ 	return _n;\
+ }
+-#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
+-#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
+-#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
++#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
++#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
++#  define fr_thread_local_get(_n) _n
+ #endif
+ #endif
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch b/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
new file mode 100644
index 0000000000..42e8c2088c
--- /dev/null
+++ b/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
@@ -0,0 +1,37 @@
+From 77b8c75f9904897768f87e20fef5d7739ddcd3c7 Mon Sep 17 00:00:00 2001
+From: Jared Bents <jared.bents@rockwellcollins.com>
+Date: Tue, 4 Feb 2020 08:22:11 -0600
+Subject: [PATCH] modules/rlm_sql: remove mysql_version.h
+
+remove mysql_version.h as mysql.h is included and mysql_version.h
+should not be included by per the header file warning
+
+Upstream: http://lists.freeradius.org/pipermail/freeradius-devel/2021-April/014218.html
+
+Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+[Applied upstream as https://github.com/FreeRADIUS/freeradius-server/commit/f20e80fce5f1b0589dccdf441b5d835188c0dfa2]
+---
+ src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c b/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
+index a7992647cd..ea44d0cc7a 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
++++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
+@@ -34,12 +34,10 @@ RCSID("$Id$")
+ #include "config.h"
+ 
+ #ifdef HAVE_MYSQL_MYSQL_H
+-#  include <mysql/mysql_version.h>
+ #  include <mysql/errmsg.h>
+ #  include <mysql/mysql.h>
+ #  include <mysql/mysqld_error.h>
+ #elif defined(HAVE_MYSQL_H)
+-#  include <mysql_version.h>
+ #  include <errmsg.h>
+ #  include <mysql.h>
+ #  include <mysqld_error.h>
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0006-configure.ac-add-option-for-pcap.patch b/package/freeradius-server/0006-configure.ac-add-option-for-pcap.patch
new file mode 100644
index 0000000000..266023dd79
--- /dev/null
+++ b/package/freeradius-server/0006-configure.ac-add-option-for-pcap.patch
@@ -0,0 +1,80 @@
+From 35494386a99a4e46be3a99849d2f48651e6ca268 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 26 Jul 2022 18:01:48 +0200
+Subject: [PATCH] configure.ac: add option for pcap
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+---
+ configure.ac | 46 +++++++++++++++++++++++++++++++---------------
+ 1 file changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 45d8e619e2..f760a5b236 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1004,6 +1004,20 @@ AC_CHECK_LIB(ws2_32, htonl)
+ dnl #
+ dnl #  Check the pcap library for the RADIUS sniffer.
+ dnl #
++dnl extra argument: --with-pcap=yes/no
++WITH_PCAP=yes
++AC_ARG_WITH(pcap,
++[  --with-pcap          use pcap library for the RADIUS sniffer. (default=yes)],
++[ case "$withval" in
++  no)
++    WITH_PCAP=no
++    ;;
++  *)
++    WITH_PCAP=yes
++    ;;
++  esac ]
++)
++
+ dnl extra argument: --with-pcap-lib-dir=DIR
+ pcap_lib_dir=
+ AC_ARG_WITH(pcap-lib-dir,
+@@ -1036,23 +1050,25 @@ AC_ARG_WITH(pcap-include-dir,
+       ;;
+   esac])
+ 
+-smart_try_dir="$pcap_lib_dir"
+-FR_SMART_CHECK_LIB(pcap, pcap_open_live)
+-if test "x$ac_cv_lib_pcap_pcap_open_live" != "xyes"; then
+-  AC_MSG_WARN([pcap library not found, silently disabling the RADIUS sniffer, and ARP listener.  Use --with-pcap-lib-dir=<path>.])
+-else
+-  AC_CHECK_FUNCS(\
+-    pcap_fopen_offline \
+-    pcap_dump_fopen \
+-    pcap_create \
+-    pcap_activate
+-  )
++if test "x$WITH_PCAP" = xyes; then
++  smart_try_dir="$pcap_lib_dir"
++  FR_SMART_CHECK_LIB(pcap, pcap_open_live)
++  if test "x$ac_cv_lib_pcap_pcap_open_live" != "xyes"; then
++    AC_MSG_WARN([pcap library not found, silently disabling the RADIUS sniffer, and ARP listener.  Use --with-pcap-lib-dir=<path>.])
++  else
++    AC_CHECK_FUNCS(\
++      pcap_fopen_offline \
++      pcap_dump_fopen \
++      pcap_create \
++      pcap_activate
++    )
+ 
+-  PCAP_LIBS="${smart_lib}"
+-  PCAP_LDFLAGS="${smart_ldflags}"
++    PCAP_LIBS="${smart_lib}"
++    PCAP_LDFLAGS="${smart_ldflags}"
++  fi
++  dnl Set by FR_SMART_CHECK_LIB
++  LIBS="${old_LIBS}"
+ fi
+-dnl Set by FR_SMART_CHECK_LIB
+-LIBS="${old_LIBS}"
+ 
+ dnl Check for collectdclient
+ dnl extra argument: --with-collectdclient-lib-dir=DIR
+-- 
+2.35.3
+
diff --git a/package/freeradius-server/0007-configure.ac-add-option-for-collectdclient.patch b/package/freeradius-server/0007-configure.ac-add-option-for-collectdclient.patch
new file mode 100644
index 0000000000..67a1932184
--- /dev/null
+++ b/package/freeradius-server/0007-configure.ac-add-option-for-collectdclient.patch
@@ -0,0 +1,67 @@
+From b8c75df6e252a1c0648448d6d561826ee9c464dd Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 26 Jul 2022 18:02:21 +0200
+Subject: [PATCH] configure.ac: add option for collectdclient
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+---
+ configure.ac | 34 +++++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f760a5b236..f431da6db5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1070,6 +1070,20 @@ if test "x$WITH_PCAP" = xyes; then
+   LIBS="${old_LIBS}"
+ fi
+ 
++dnl extra argument: --with-collectdclient=yes/no
++WITH_COLLECTDCLIENT=yes
++AC_ARG_WITH(collectdclient,
++[  --with-collectdclient  use collectd client. (default=yes)],
++[ case "$withval" in
++  no)
++    WITH_COLLECTDCLIENT=no
++    ;;
++  *)
++    WITH_COLLECTDCLIENT=yes
++    ;;
++  esac ]
++)
++
+ dnl Check for collectdclient
+ dnl extra argument: --with-collectdclient-lib-dir=DIR
+ collectdclient_lib_dir=
+@@ -1103,16 +1117,18 @@ AC_ARG_WITH(collectdclient-include-dir,
+       ;;
+   esac])
+ 
+-smart_try_dir="$collectdclient_lib_dir"
+-FR_SMART_CHECK_LIB(collectdclient, lcc_connect)
+-if test "x$ac_cv_lib_collectdclient_lcc_connect" != "xyes"; then
+-  AC_MSG_WARN([collectdclient library not found. Use --with-collectdclient-lib-dir=<path>.])
+-else
+-  COLLECTDC_LIBS="${smart_lib}"
+-  COLLECTDC_LDFLAGS="${smart_ldflags}"
++if test "x$WITH_COLLECTDCLIENT" = xyes; then
++  smart_try_dir="$collectdclient_lib_dir"
++  FR_SMART_CHECK_LIB(collectdclient, lcc_connect)
++  if test "x$ac_cv_lib_collectdclient_lcc_connect" != "xyes"; then
++    AC_MSG_WARN([collectdclient library not found. Use --with-collectdclient-lib-dir=<path>.])
++  else
++    COLLECTDC_LIBS="${smart_lib}"
++    COLLECTDC_LDFLAGS="${smart_ldflags}"
++  fi
++  dnl Set by FR_SMART_CHECKLIB
++  LIBS="${old_LIBS}"
+ fi
+-dnl Set by FR_SMART_CHECKLIB
+-LIBS="${old_LIBS}"
+ 
+ dnl #
+ dnl #  extra argument: --with-libcap
+-- 
+2.35.3
+
diff --git a/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch b/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch
new file mode 100644
index 0000000000..b4cbc61a89
--- /dev/null
+++ b/package/freeradius-server/0008-configure.ac-try-execinfo-in-libc-before-searching-l.patch
@@ -0,0 +1,71 @@
+From ba41a28cd526bccde4ec3db0998e1b00d3afc0e2 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 26 Jul 2022 18:31:14 +0200
+Subject: [PATCH] configure.ac: try execinfo in libc before searching
+ libexecinfo
+
+execinfo is provided by glibc, so the usual case is that it is part of
+libc. Do this before starting a redundant search for libexecinfo.
+
+This is especially relevant for cross-compilation, where
+FR_SMART_CHECK_LIB can find an incompatible library.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/4632
+---
+ configure.ac | 38 +++++++++++++++++++-------------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f431da6db5..faa7cfc2b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2165,26 +2165,26 @@ dnl #
+ smart_try_dir=$execinfo_include_dir
+ FR_SMART_CHECK_INCLUDE(execinfo.h)
+ if test "x$ac_cv_header_execinfo_h" = "xyes"; then
+-  smart_try_dir=$execinfo_lib_dir
+-  FR_SMART_CHECK_LIB(execinfo, backtrace_symbols)
++  dnl # Might be provided as part of libc
++  AC_MSG_CHECKING([if execinfo provided as part of libc])
++  AC_TRY_LINK(
++    [
++      #include <execinfo.h>
++    ],
++    [
++      void *sym[1];
++      backtrace_symbols(&sym, sizeof(sym)) ],
++    [
++      AC_MSG_RESULT(yes)
++      ac_cv_lib_execinfo_backtrace_symbols="yes"
++    ],
++    [
++      AC_MSG_RESULT(no)
++    ]
++  )
+   if test "x$ac_cv_lib_execinfo_backtrace_symbols" != "xyes"; then
+-    dnl # Might be provided as part of libc
+-    AC_MSG_CHECKING([if execinfo provided as part of libc])
+-    AC_TRY_LINK(
+-      [
+-        #include <execinfo.h>
+-      ],
+-      [
+-        void *sym[1];
+-        backtrace_symbols(&sym, sizeof(sym)) ],
+-      [
+-        AC_MSG_RESULT(yes)
+-        ac_cv_lib_execinfo_backtrace_symbols="yes"
+-      ],
+-      [
+-        AC_MSG_RESULT(no)
+-      ]
+-    )
++    smart_try_dir=$execinfo_lib_dir
++    FR_SMART_CHECK_LIB(execinfo, backtrace_symbols)
+   fi
+ 
+   if test "x$ac_cv_lib_execinfo_backtrace_symbols" = "xyes"; then
+-- 
+2.35.3
+
diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
new file mode 100644
index 0000000000..52a50bd3a7
--- /dev/null
+++ b/package/freeradius-server/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_FREERADIUS_SERVER
+	bool "freeradius-server"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # libtalloc
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBTALLOC
+	help
+	  FreeRADIUS is an open source server which implements
+	  a protocol for remote user Authorization, Authentication
+	  and Accounting.
+
+	  http://wiki.freeradius.org/
+
+comment "freeradius-server needs a glibc toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
new file mode 100644
index 0000000000..cd0281c478
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.hash
@@ -0,0 +1,4 @@
+# Locally computed, after checking
+# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.0.25.tar.gz.sig
+sha256  4883a68bb3cee46025359a97c1691ce655e8babfd6dc3c021d00e109a2ff4c10  freeradius-server-3.0.25.tar.gz
+sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
new file mode 100644
index 0000000000..04d8685813
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.mk
@@ -0,0 +1,215 @@
+################################################################################
+#
+# freeradius-server
+#
+################################################################################
+
+FREERADIUS_SERVER_VERSION = 3.0.25
+FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
+FREERADIUS_SERVER_LICENSE = GPL-2.0
+FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
+FREERADIUS_SERVER_DEPENDENCIES = libtalloc
+FREERADIUS_SERVER_AUTORECONF = YES
+
+# some compiler checks are not supported while cross compiling.
+# instead of removing those checks, we cache the answers
+FREERADIUS_SERVER_CONF_OPTS += \
+	ax_cv_cc_bounded_attribute=no \
+	ax_cv_cc_builtin_bswap64=no \
+	ax_cv_cc_builtin_choose_expr=no \
+	ax_cv_cc_builtin_types_compatible_p=no
+
+# Some paths are looked up in $PATH but used on the target.
+# Set them explicitly so they are still valid if it's in some other
+# place on the host. Note that some of those don't necessarily exist
+# on the target - in that case, the script will simply fail to work.
+# Note that some paths are actually used during the build, those
+# shouldn't be set explicitly here!
+FREERADIUS_SERVER_CONF_OPTS += \
+	ac_cv_path_RUSERS=/usr/bin/rusers \
+	ac_cv_path_SNMPGET=/usr/bin/snmpget \
+	ac_cv_path_SNMPWALK=/usr/bin/snmpwalk
+
+# Modules for which we don't have the dependencies must be disabled
+# explicitly, to avoid that they're searched on the host.
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_eap_ike \
+	--without-rlm_eap_tnc \
+	--without-rlm_mschap \
+	--without-rlm_perl \
+	--without-rlm_realm \
+	--without-rlm_sql_iodbc \
+	--without-rlm_sql_oracle \
+	--without-rlm_sql_freetds \
+	--without-rlm_yubikey
+
+ifeq ($(BR2_PACKAGE_COLLECTD),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-collectdclient
+FREERADIUS_SERVER_DEPENDENCIES += collectd
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-collectdclient
+endif
+
+ifeq ($(BR2_PACKAGE_GDBM),y)
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_counter \
+	--with-rlm_ippool
+FREERADIUS_SERVER_DEPENDENCIES += gdbm
+else
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_counter \
+	--without-rlm_ippool
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C)$(BR2_PACKAGE_LIBCURL),yy)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_rest
+FREERADIUS_SERVER_DEPENDENCIES += json-c libcurl
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_rest
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-libcap
+FREERADIUS_SERVER_DEPENDENCIES += libcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_DEPENDENCIES += libkrb5
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-pcap
+FREERADIUS_SERVER_DEPENDENCIES += libpcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-pcap
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_pam
+FREERADIUS_SERVER_DEPENDENCIES += linux-pam
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_pam
+endif
+
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ldap
+FREERADIUS_SERVER_DEPENDENCIES += openldap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ldap
+endif
+
+ifeq ($(BR2_PACKAGE_MEMCACHED),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_cache_memcached
+FREERADIUS_SERVER_DEPENDENCIES += mysql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_cache_memcached
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_mysql
+FREERADIUS_SERVER_DEPENDENCIES += mysql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-pcre
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python
+FREERADIUS_SERVER_DEPENDENCIES += python3
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-readline
+FREERADIUS_SERVER_DEPENDENCIES += readline
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-readline
+endif
+
+ifeq ($(BR2_PACKAGE_REDIS),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_redis --with-rlm_rediswho
+FREERADIUS_SERVER_DEPENDENCIES += redis
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_redis --without-rlm_rediswho
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
+FREERADIUS_SERVER_DEPENDENCIES += sqlite
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_unixodbc
+FREERADIUS_SERVER_DEPENDENCIES += unixodbc
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_unixodbc
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_postgresql
+FREERADIUS_SERVER_DEPENDENCIES += postgresql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+FREERADIUS_SERVER_DEPENDENCIES += openssl
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-openssl \
+	--with-rlm_eap \
+	--with-rlm_eap_pwd
+else
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-openssl \
+	--without-rlm_eap \
+	--without-rlm_eap_pwd
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-pcre
+endif
+
+ifeq ($(BR2_PACKAGE_RUBY),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
+FREERADIUS_SERVER_DEPENDENCIES += ruby
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ruby
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-systemd
+FREERADIUS_SERVER_DEPENDENCIES += systemd
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-systemd
+endif
+
+# TARGET_DIR is set to empty to avoid creation of symlinks in hardcoded host directories
+# freeradius Makefile does not support an alternate DESTDIR, instead it uses the magic $(R) variable
+FREERADIUS_SERVER_MAKE_ENV = R=$(TARGET_DIR) TARGET_DIR=""
+
+# use MAKE1 because make install does not support parallel build
+FREERADIUS_SERVER_MAKE = $(MAKE1)
+
+define FREERADIUS_SERVER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/freeradius-server/radiusd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/radiusd.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/freeradius-server/radiusd.service b/package/freeradius-server/radiusd.service
new file mode 100644
index 0000000000..1f29db0911
--- /dev/null
+++ b/package/freeradius-server/radiusd.service
@@ -0,0 +1,38 @@
+# Reference from: freeradius-server/redhat/radiusd.service
+
+[Unit]
+Description=FreeRADIUS multi-protocol policy server
+After=network-online.target
+Documentation=man:radiusd(8) man:radiusd.conf(5) http://wiki.freeradius.org/ http://networkradius.com/doc/
+
+[Service]
+Type=notify
+WatchdogSec=60
+NotifyAccess=all
+EnvironmentFile=-/etc/default/radiusd
+
+# FreeRADIUS can do static evaluation of policy language rules based
+# on environmental variables which is very useful for doing per-host
+# customization.
+# Unfortunately systemd does not allow variable substitutions such
+# as %H or $(hostname) in the EnvironmentFile.
+# We provide HOSTNAME here for convenience.
+Environment=HOSTNAME=%H
+
+# Limit memory to 2G this is fine for %99.99 of deployments.  FreeRADIUS
+# is not memory hungry, if it's using more than this, then there's probably
+# a leak somewhere.
+MemoryLimit=2G
+
+ExecStartPre=/usr/sbin/radiusd $FREERADIUS_OPTIONS -Cx -lstdout
+ExecStart=/usr/sbin/radiusd -f $FREERADIUS_OPTIONS
+Restart=on-failure
+RestartSec=5
+ExecReload=/usr/sbin/radiusd $FREERADIUS_OPTIONS -Cxm -lstdout
+ExecReload=/bin/kill -HUP $MAINPID
+
+# Only allow native system calls
+SystemCallArchitectures=native
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
