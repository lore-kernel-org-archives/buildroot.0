From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Feb 2009 14:28:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090203142844.7A87176272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-03 14:28:43 +0000 (Tue, 03 Feb 2009)
New Revision: 25225

Log:
uClibc: enable LDSO_RUNPATH in defconfigs (use ELF RPATH info)

Fixes mysql-client package (installs shared libraries into /usr/lib/mysql
and sets RPATH).

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
   trunk/buildroot/toolchain/uClibc/uClibc-snapshot.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2009-02-02 23:43:57 UTC (rev 25224)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2009-02-03 14:28:43 UTC (rev 25225)
@@ -75,7 +75,7 @@
 LDSO_CACHE_SUPPORT=y
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
-# LDSO_RUNPATH is not set
+LDSO_RUNPATH=y
 # DL_FINI_CRT_COMPAT is not set
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config	2009-02-02 23:43:57 UTC (rev 25224)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-wchar.config	2009-02-03 14:28:43 UTC (rev 25225)
@@ -80,7 +80,7 @@
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
 # UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
+LDSO_RUNPATH=y
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2009-02-02 23:43:57 UTC (rev 25224)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2009-02-03 14:28:43 UTC (rev 25225)
@@ -64,7 +64,7 @@
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
 # UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
+LDSO_RUNPATH=y
 # DL_FINI_CRT_COMPAT is not set
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-02-02 23:43:57 UTC (rev 25224)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-02-03 14:28:43 UTC (rev 25225)
@@ -63,7 +63,7 @@
 # LDSO_CACHE_SUPPORT is not set
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
+LDSO_RUNPATH=y
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set

Modified: trunk/buildroot/toolchain/uClibc/uClibc-snapshot.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-snapshot.config	2009-02-02 23:43:57 UTC (rev 25224)
+++ trunk/buildroot/toolchain/uClibc/uClibc-snapshot.config	2009-02-03 14:28:43 UTC (rev 25225)
@@ -68,7 +68,7 @@
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
 # UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
+LDSO_RUNPATH=y
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
