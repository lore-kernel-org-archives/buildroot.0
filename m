From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Apr 2019 21:39:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 1.1.5
Message-ID: <20190413193949.2227-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Use WITH_EXAMPLES=OFF (option added with
  https://git.cryptomilk.org/projects/cmocka.git/commit?id=ee264da1aa222b354cee36184ab48c2072f62243)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ime-include-stdint.h-before-cmocka.h.patch | 35 -------------------
 package/cmocka/cmocka.hash                    |  2 +-
 package/cmocka/cmocka.mk                      |  3 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch

diff --git a/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch b/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch
deleted file mode 100644
index 68dbc11da8..0000000000
--- a/package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From dd8449ae3ba7fd05ac172f0227cd93af7f37005e Mon Sep 17 00:00:00 2001
-From: Joel Carlson <joelsoncarl@gmail.com>
-Date: Mon, 1 Oct 2018 15:01:56 -0600
-Subject: [PATCH] examples: uptime: include stdint.h before cmocka.h
-
-Fixes a build error encountered on one MIPS64 toolchain about uintptr_t
-being declared twice, first by cmocka.h and then later by the toolchains
-stdint.h.
-
-Fixes #7
-
-Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
----
-Fixes build error with br-mips64-n64-full
-Upstream commit: dd8449ae3ba7fd05ac172f0227cd93af7f37005e
----
- example/mock/uptime/test_uptime.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/example/mock/uptime/test_uptime.c b/example/mock/uptime/test_uptime.c
-index badfac9..183c276 100644
---- a/example/mock/uptime/test_uptime.c
-+++ b/example/mock/uptime/test_uptime.c
-@@ -16,6 +16,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
--- 
-2.17.1
-
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 1cbda22428..007dd7a7fc 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 43eabcf72a9c80e3d03f7c8a1c04e408c18d2db5121eb058a3ef732a9dfabfaf cmocka-1.1.3.tar.xz
+sha256 f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6 cmocka-1.1.5.tar.xz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 281410abb3..eafb4898e1 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.3
+CMOCKA_VERSION = 1.1.5
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/1.1
 CMOCKA_LICENSE = Apache-2.0
 CMOCKA_LICENSE_FILES = COPYING
 CMOCKA_INSTALL_STAGING = YES
+CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
 
 # cmocka only supports out of source builds
 CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.20.1
