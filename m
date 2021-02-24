From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 24 Feb 2021 11:31:50 +0100
Subject: [Buildroot] [PATCH 1/4] package/lttng-tools: bump version to 2.12.3
Message-ID: <20210224103154.174602-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch 001 as it has been fixed upstream.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...nts-ns-tp.h-Fix-build-with-musl-libc.patch | 46 -------------------
 package/lttng-tools/lttng-tools.hash          |  4 +-
 package/lttng-tools/lttng-tools.mk            |  2 +-
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch

diff --git a/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch b/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch
deleted file mode 100644
index e3e0f3a777..0000000000
--- a/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 73f906d4d6806afb1962751ccb0fe6c15f320d94 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Mon, 18 May 2020 16:39:26 +0300
-Subject: [PATCH] tests: gen-ust-events-ns/tp.h: Fix build with musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix the following build error with musl libc:
-In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
-                 from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |          ^~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |          ^~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |  ^~~~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |  ^~~~~~~
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: Ic7a73c6754fc30a62bdf6519062c07be65a2eaba
-[Retrieved from:
-https://github.com/lttng/lttng-tools/commit/73f906d4d6806afb1962751ccb0fe6c15f320d94]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/utils/testapp/gen-ust-events-ns/tp.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/utils/testapp/gen-ust-events-ns/tp.h b/tests/utils/testapp/gen-ust-events-ns/tp.h
-index 4dbfed51a..e0ddb29a6 100644
---- a/tests/utils/testapp/gen-ust-events-ns/tp.h
-+++ b/tests/utils/testapp/gen-ust-events-ns/tp.h
-@@ -11,6 +11,7 @@
- #if !defined(_TRACEPOINT_TP_H) || defined(TRACEPOINT_HEADER_MULTI_READ)
- #define _TRACEPOINT_TP_H
- 
-+#include <sys/types.h>
- #include <lttng/tracepoint.h>
- 
- TRACEPOINT_EVENT(tp, tptest,
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index a27b419e75..a94ecc4a35 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.12.1.tar.bz2.sha256
-sha256  0de7afc1f40a5acbede933cdfd6cf47b32ff84d02e170a1321f7fc86141585b8  lttng-tools-2.12.1.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2.sha256
+sha256  2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153  lttng-tools-2.12.3.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e0e99e3270..d66233414e 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.12.1
+LTTNG_TOOLS_VERSION = 2.12.3
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-- 
2.30.0
