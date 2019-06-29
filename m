From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 17:19:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/nasm: bump version to 2.14.02
Message-ID: <20190629151946.28648-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://nasm.us/doc/nasmdocc.html

Removed patch applied upstream:
https://repo.or.cz/nasm.git/commitdiff/5eb1838b4d3752fd863d19442943983a2a5ee87c

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-nasmlib-Drop-unused-seg_init.patch   | 32 -------------------
 package/nasm/nasm.hash                        |  2 +-
 package/nasm/nasm.mk                          |  4 +--
 3 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 package/nasm/0001-nasmlib-Drop-unused-seg_init.patch

diff --git a/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch b/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
deleted file mode 100644
index a18d121bfb..0000000000
--- a/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5eb1838b4d3752fd863d19442943983a2a5ee87c Mon Sep 17 00:00:00 2001
-From: Cyrill Gorcunov <gorcunov@gmail.com>
-Date: Sat, 10 Feb 2018 00:33:41 +0300
-Subject: [PATCH] nasmlib: Drop unused seg_init
-
-The helper has been eliminated in 2c4a4d5810d0a59b033a07876a2648ef5d4c2859
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392461
-
-Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
----
- include/nasmlib.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 79e866b5..fee1b5ea 100644
---- a/include/nasmlib.h
-+++ b/include/nasmlib.h
-@@ -188,10 +188,8 @@ int64_t readnum(char *str, bool *error);
- int64_t readstrnum(char *str, int length, bool *warn);
- 
- /*
-- * seg_init: Initialise the segment-number allocator.
-  * seg_alloc: allocate a hitherto unused segment number.
-  */
--void pure_func seg_init(void);
- int32_t pure_func seg_alloc(void);
- 
- /*
--- 
-2.17.0
-
diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index db5b857193..d824f22b86 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 812ecfb0dcbc5bd409aaa8f61c7de94c5b8752a7b00c632883d15b2ed6452573  nasm-2.13.03.tar.xz
+sha256 e24ade3e928f7253aa8c14aa44726d1edf3f98643f87c9d72ec1df44b26be8f5  nasm-2.14.02.tar.xz
 sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 76bcca3bbf..5a46fd0a4b 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.13.03
+NASM_VERSION = 2.14.02
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
-NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
+NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
 NASM_LICENSE_FILES = LICENSE
 
-- 
2.20.1
