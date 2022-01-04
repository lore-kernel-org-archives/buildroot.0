Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A235C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 21:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B453F410AC;
	Tue,  4 Jan 2022 21:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bL7wY6DdohaB; Tue,  4 Jan 2022 21:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA576410BB;
	Tue,  4 Jan 2022 21:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3C8D1BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D24A2813D5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 21:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgF5PaxhQzSu for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 21:55:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ch3vs02.rockwellcollins.com (ch3vs02.rockwellcollins.com
 [205.175.226.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 338D281290
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 21:55:44 +0000 (UTC)
IronPort-SDR: by96pKh4ivSGJStbPzTNsaYyT4wldFPtLpfI9efxlWTgCWdEU7CtaX9EPJZEYYIiFwhfSZd/VS
 66bv98MKmpSF+WTR/eCoSZ5yxYQGT5eakDpho4w4JTaqrCBEIXH9ZyX71tA5ACBrtHlgDmpL3K
 N86DMAud1qSoCgyUPgTZ3TODCpdG2VnTHHb9/awCAMRDQP7ctmtSasiDcsUYXKNHc+iwtNEijI
 fZSFtFkeqmQHZ7lHvke5qTn1xjZqO5bi527nCmBvT7ueig9+FAriaHhXz0obCzl9gOfwsUghN+
 U60=
Received: from ofwch3n02.rockwellcollins.com (HELO
 dtulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs02.rockwellcollins.com with ESMTP; 04 Jan 2022 15:55:43 -0600
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 9E60D6032B;
 Tue,  4 Jan 2022 15:55:42 -0600 (CST)
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 15:55:41 -0600
Message-Id: <20220104215541.23003-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH v9] package/freeradius-server: new package
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: David GOUARIN <dgouarin@gmail.com>,
 Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>,
 Matt Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: David GOUARIN <dgouarin@gmail.com>

FreeRADIUS is an open source server which implements
a protocol for remote user Authorization, Authentication
and Accounting.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@collins.com>
---
Changes
v8 -> v9:
 - A systemd unit is installed if systemd is enabled. The default provided
   by `freeradius-server/redhat/radiusd.service` was not used because of
   extra options not compatible with Buildroot. The unit is instead based
   on a simplified version of that upstream file.

v7 -> v8:
  - added dependencies to include libpcap
  - version bump to 3.0.25

v6 -> v7
  - resolve rlm_sql module compilation error (Newer GCC)
    (remove mysql_version.h as mysql.h is included)

v5 -> v6:
  - cleaned up patches to all be git formatted
  - added depends on BR2_USE_MMU
  - rebased on master
  - added CPE info

v4 -> v5:
  - better package patches formatting

v3 -> v4:
  Taken in account Thomas review
  - fix build with BR2_COMPILER_PARANOID_UNSAFE_PATH
  - import patches inside package directory instead of downloading them
  - remove config.cache file, pass the answers on the command line instead
  - add comments for weird TARGET_DIR and R directives
  - remove broken python optional feature. Managed to get it to build
    with python 2.7, not 3.0 and it still fails basic testing

v2 -> v3:
  - As suggested by Matt, merge with pending upstream patch. Included most of it,
    including patches based on Yocto work :
    http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
    Didn't kept all the --without directive, as they do not seem useful, nor
    the custom INSTALL_TARGET_CMDS.

v1 -> v2:
   - fix invalid characters in Config.in
---
 DEVELOPERS                                    |   2 +
 package/Config.in                             |   1 +
 .../0001-jlibtool-cross-with-host-CC.patch    |  33 +++
 .../0002-avoid-searching-host-dirs.patch      | 201 ++++++++++++++++++
 ...3-configure.ac-add-option-for-libcap.patch |  74 +++++++
 ...configure.ac-allow-cross-compilation.patch |  41 ++++
 ...r-for-expansion-of-macro-in-thread.h.patch |  65 ++++++
 ...dules-rlm_sql-remove-mysql_version.h.patch |  36 ++++
 package/freeradius-server/Config.in           |  21 ++
 .../freeradius-server/freeradius-server.hash  |   3 +
 .../freeradius-server/freeradius-server.mk    | 124 +++++++++++
 package/freeradius-server/radiusd.service     |  38 ++++
 12 files changed, 639 insertions(+)
 create mode 100644 package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
 create mode 100644 package/freeradius-server/0002-avoid-searching-host-dirs.patch
 create mode 100644 package/freeradius-server/0003-configure.ac-add-option-for-libcap.patch
 create mode 100644 package/freeradius-server/0004-configure.ac-allow-cross-compilation.patch
 create mode 100644 package/freeradius-server/0005-fix-error-for-expansion-of-macro-in-thread.h.patch
 create mode 100644 package/freeradius-server/0006-modules-rlm_sql-remove-mysql_version.h.patch
 create mode 100644 package/freeradius-server/Config.in
 create mode 100644 package/freeradius-server/freeradius-server.hash
 create mode 100644 package/freeradius-server/freeradius-server.mk
 create mode 100644 package/freeradius-server/radiusd.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c792816a..095e711197 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -658,6 +658,7 @@ N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/freeradius-server/
 F:	package/librelp/
 F:	package/libtalloc/
 
@@ -1833,6 +1834,7 @@ F:	package/ethtool/
 F:	package/flashbench/
 F:	package/fmc/
 F:	package/fmlib/
+F:	package/freeradius-server/
 F:	package/git/
 F:	package/gnutls/
 F:	package/hostapd/
diff --git a/package/Config.in b/package/Config.in
index 7148639735..a095f6c536 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2186,6 +2186,7 @@ endif
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
diff --git a/package/freeradius-server/0002-avoid-searching-host-dirs.patch b/package/freeradius-server/0002-avoid-searching-host-dirs.patch
new file mode 100644
index 0000000000..163f10346c
--- /dev/null
+++ b/package/freeradius-server/0002-avoid-searching-host-dirs.patch
@@ -0,0 +1,201 @@
+From 1dcbfce955edb834c9bb619b5ca44b0d58959de2 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 4 Jan 2016 01:44:04 -0500
+Subject: [PATCH] avoid searching host dirs
+
+Don't search the hardcoded host dirs to avoid
+host contamination.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Fetch from: http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
+Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ acinclude.m4                                                | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      | 6 +++---
+ src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     | 2 +-
+ src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   | 4 ++--
+ 8 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index da48acc08a..b513ae10cf 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -178,7 +178,7 @@ if test "x$smart_lib" = "x"; then
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1${libltdl_cv_shlibext}])
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1.a])
+ 
+-  for try in $smart_lib_dir /usr/local/lib /opt/lib; do
++  for try in $smart_lib_dir; do
+     AC_MSG_CHECKING([for $2 in -l$1 in $try])
+     LIBS="-l$1 $old_LIBS"
+     CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
+@@ -218,7 +218,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+ old_CPPFLAGS="$CPPFLAGS"
+ smart_include=
+ dnl #  The default directories we search in (in addition to the compilers search path)
+-smart_include_dir="/usr/local/include /opt/include"
++smart_include_dir=
+ 
+ dnl #  Our local versions
+ _smart_try_dir=
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+index 75c851a135..a262d71d1a 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -ldb2
+-	smart_try_dir="$ibmdb2_lib_dir /usr/local/db2/lib /usr/IBMdb2/V7.1/lib"
++	smart_try_dir="$ibmdb2_lib_dir"
+ 	FR_SMART_CHECK_LIB(db2, SQLConnect)
+ 	if test "x$ac_cv_lib_db2_SQLConnect" != xyes; then
+ 		fail="$fail libdb2"
+ 	fi
+ 
+ 	dnl Check for sqlcli.h
+-	smart_try_dir="$ibmdb2_include_dir /usr/local/db2/include /usr/IBMdb2/V7.1/include"
++	smart_try_dir="$ibmdb2_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sqlcli.h)
+ 	if test "x$ac_cv_header_sqlcli_h" != xyes; then
+ 		fail="$fail sqlcli.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+index 4da57b308e..752b043ffb 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+@@ -56,14 +56,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for isc_attach_database in -lfbclient
+-	smart_try_dir="$firebird_lib_dir /usr/lib/firebird2/lib /usr/local/firebird/lib"
++	smart_try_dir="$firebird_lib_dir"
+ 	FR_SMART_CHECK_LIB(fbclient, isc_attach_database)
+ 	if test "x$ac_cv_lib_fbclient_isc_attach_database" != xyes; then
+ 		fail="$fail libfbclient"
+ 	fi
+ 
+ 	dnl Check for ibase.h
+-	smart_try_dir="$firebird_include_dir /usr/lib/firebird2/include /usr/local/firebird/include"
++	smart_try_dir="$firebird_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(ibase.h)
+ 	if test "x$ac_cv_header_ibase_h" != xyes; then
+ 		fail="$fail ibase.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+index ba6304fdcd..3393557cdb 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -liodbc
+-	smart_try_dir="$iodbc_lib_dir /usr/lib /usr/lib/iodbc /usr/local/lib/iodbc /usr/local/iodbc/lib/iodbc"
++	smart_try_dir="$iodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(iodbc, SQLConnect)
+ 	if test "x$ac_cv_lib_iodbc_SQLConnect" != xyes; then
+ 		fail="$fail libiodbc"
+ 	fi
+ 
+ 	dnl Check for isql.h
+-	smart_try_dir="$iodbc_include_dir /usr/include /usr/include/iodbc /usr/local/iodbc/include"
++	smart_try_dir="$iodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(isql.h)
+ 	if test "x$ac_cv_header_isql_h" != xyes; then
+ 		fail="$fail isql.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+index fbe57b6c1d..ac6caacf71 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+@@ -136,7 +136,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient_r
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -145,7 +145,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -239,7 +239,7 @@ if test x$with_[]modname != xno; then
+     fi
+ 
+     if test "x$have_mysql_h" != "xyes"; then
+-		smart_try_dir="$mysql_include_dir /usr/local/include /usr/local/mysql/include"
++		smart_try_dir="$mysql_include_dir"
+ 		FR_SMART_CHECK_INCLUDE(mysql/mysql.h)
+ 		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
+ 	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+index 2a97fd6764..2b4a4baed4 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+@@ -64,7 +64,7 @@ if test x$with_[]modname != xno; then
+     dnl # Check for header files
+     dnl ############################################################
+ 
+-    smart_try_dir="$oracle_include_dir /usr/local/instaclient/include"
++    smart_try_dir="$oracle_include_dir"
+ 
+     if test "x$ORACLE_HOME" != "x"; then
+ 	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+index 4f9a890ba0..e1cf811ce8 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+@@ -41,7 +41,7 @@ if test x$with_[]modname != xno; then
+ 	  esac ]
+ 	)
+ 
+-	smart_try_dir="$rlm_sql_postgresql_include_dir /usr/include/postgresql /usr/local/pgsql/include /usr/include/pgsql"
++	smart_try_dir="$rlm_sql_postgresql_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
+ 	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
+ 		fail="$fail libpq-fe.h"
+@@ -76,7 +76,7 @@ if test x$with_[]modname != xno; then
+ 		  ])
+ 	fi
+ 
+-	smart_try_dir="$rlm_sql_postgresql_lib_dir /usr/lib /usr/local/pgsql/lib"
++	smart_try_dir="$rlm_sql_postgresql_lib_dir"
+ 	FR_SMART_CHECK_LIB(pq, PQconnectdb)
+ 	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
+ 		fail="$fail libpq"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+index 35453879e3..c543ed4d51 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -lodbc
+-	smart_try_dir="$unixodbc_lib_dir /usr/local/unixodbc/lib"
++	smart_try_dir="$unixodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(odbc, SQLConnect)
+ 	if test "x$ac_cv_lib_odbc_SQLConnect" != xyes; then
+ 		fail="$fail libodbc"
+ 	fi
+ 
+ 	dnl Check for sql.h
+-	smart_try_dir="$unixodbc_include_dir /usr/local/unixodbc/include"
++	smart_try_dir="$unixodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sql.h)
+ 	if test "x$ac_cv_header_sql_h" != xyes; then
+ 		fail="$fail sql.h"
+-- 
+2.17.1
+
diff --git a/package/freeradius-server/0003-configure.ac-add-option-for-libcap.patch b/package/freeradius-server/0003-configure.ac-add-option-for-libcap.patch
new file mode 100644
index 0000000000..05137ec6a8
--- /dev/null
+++ b/package/freeradius-server/0003-configure.ac-add-option-for-libcap.patch
@@ -0,0 +1,74 @@
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
diff --git a/package/freeradius-server/0004-configure.ac-allow-cross-compilation.patch b/package/freeradius-server/0004-configure.ac-allow-cross-compilation.patch
new file mode 100644
index 0000000000..248a5f0e34
--- /dev/null
+++ b/package/freeradius-server/0004-configure.ac-allow-cross-compilation.patch
@@ -0,0 +1,41 @@
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
diff --git a/package/freeradius-server/0005-fix-error-for-expansion-of-macro-in-thread.h.patch b/package/freeradius-server/0005-fix-error-for-expansion-of-macro-in-thread.h.patch
new file mode 100644
index 0000000000..cf6ad81a14
--- /dev/null
+++ b/package/freeradius-server/0005-fix-error-for-expansion-of-macro-in-thread.h.patch
@@ -0,0 +1,65 @@
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
diff --git a/package/freeradius-server/0006-modules-rlm_sql-remove-mysql_version.h.patch b/package/freeradius-server/0006-modules-rlm_sql-remove-mysql_version.h.patch
new file mode 100644
index 0000000000..03f8ef8805
--- /dev/null
+++ b/package/freeradius-server/0006-modules-rlm_sql-remove-mysql_version.h.patch
@@ -0,0 +1,36 @@
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
diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
new file mode 100644
index 0000000000..0f796e21d2
--- /dev/null
+++ b/package/freeradius-server/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_FREERADIUS_SERVER
+	bool "freeradius-server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBTALLOC
+	help
+	  FreeRADIUS is an open source server which implements
+	  a protocol for remote user Authorization, Authentication
+	  and Accounting.
+
+	  http://wiki.freeradius.org/
+
+comment "freeradius-server needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "freeradius-server needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "freeradius-server needs a target w/ MMU"
+	depends on !BR2_USE_MMU
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
new file mode 100644
index 0000000000..68f7e05435
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4883a68bb3cee46025359a97c1691ce655e8babfd6dc3c021d00e109a2ff4c10  freeradius-server-3.0.25.tar.gz
+sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
new file mode 100644
index 0000000000..0c071a2378
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.mk
@@ -0,0 +1,124 @@
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
+
+# some compiler checks are not supported while cross compiling.
+# instead of removing those checks, we cache the answers
+FREERADIUS_SERVER_CONF_OPTS += \
+	ax_cv_cc_bounded_attribute=no \
+	ax_cv_cc_builtin_bswap64=no \
+	ax_cv_cc_builtin_choose_expr=no \
+	ax_cv_cc_builtin_types_compatible_p=no
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-libcap
+FREERADIUS_SERVER_DEPENDENCIES += libcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-libpcap
+FREERADIUS_SERVER_DEPENDENCIES += libpcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-libpcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_DEPENDENCIES += libkrb5
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
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
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_mysql
+FREERADIUS_SERVER_DEPENDENCIES += mysql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
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
+FREERADIUS_SERVER_CONF_OPTS += --with-openssl
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-openssl
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
index 0000000000..a55bce62d3
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
+EnvironmentFile=-/etc/sysconfig/radiusd
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
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
