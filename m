From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 18 May 2017 08:56:18 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: bump version to 20170516
Message-ID: <20170518065618.9438-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch accepted upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...-unused-and-not-available-for-uClibc-ng-l.patch | 157 ---------------------
 package/ltp-testsuite/ltp-testsuite.hash           |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   2 +-
 3 files changed, 3 insertions(+), 160 deletions(-)
 delete mode 100644 package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch

diff --git a/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch b/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch
deleted file mode 100644
index fc3dce97e..000000000
--- a/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 780bec6c2742231ca73d4dee51c727815cf857b3 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 30 Sep 2016 17:45:31 +0200
-Subject: [PATCH] rusers.h is unused and not available for uClibc-ng / libtirpc
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Erico: Rebase for ltp 20160920]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- .../tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c    | 1 -
- .../rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c         | 1 -
- .../rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c         | 1 -
- .../rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c   | 1 -
- .../rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c  | 1 -
- .../rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c     | 1 -
- .../rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c     | 1 -
- .../rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c      | 1 -
- .../rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c   | 1 -
- .../rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c  | 1 -
- .../rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c     | 1 -
- 11 files changed, 11 deletions(-)
-
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
-index 7f157e1..728c023 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
-index d9a3111..8d80a5e 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
-index cabffc7..a4d1d6f 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
-index 4f10466..863aec7 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
-index 290f357..e849468 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
-index 55bac16..8c1800b 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
-index 09d1bf9..384a00d 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
-index 3e15306..285eb21 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
-index a7030a2..1f2690a 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
-index 06f4740..faa8ef6 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
-index ca38aa0..974f5fb 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
--- 
-2.7.4
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index b8311e094..68b95234d 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20170116/ltp-full-20170116.tar.xz.sha1
-sha1 b42047fe0d30db9b2c760bd1ab901ecb133835fc  ltp-full-20170116.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20170516/ltp-full-20170516.tar.xz.sha1
+sha1 bd5210b73b14708c88449089a3a3c64ace3cd22a  ltp-full-20170516.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7f26bd2a5..1790309f8 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20170116
+LTP_TESTSUITE_VERSION = 20170516
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
-- 
2.12.2
