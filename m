From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jan 2021 19:11:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: security bump to version
 0.23.22
Message-ID: <20210108181157.606055-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361,
  CVE-2020-29362 and CVE-2020-29363)
- Update indentation in hash file (two spaces)

https://github.com/p11-glue/p11-kit/blob/0.23.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-c-Add-stdint-h-to-fix-compilation.patch | 28 +++++++++++++++++++
 package/p11-kit/p11-kit.hash                  |  4 +--
 package/p11-kit/p11-kit.mk                    |  3 +-
 3 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch

diff --git a/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch b/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
new file mode 100644
index 0000000000..d4828666d3
--- /dev/null
+++ b/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
@@ -0,0 +1,28 @@
+From 507c394cfcf4edffc5e4450c5d737e545c26b857 Mon Sep 17 00:00:00 2001
+From: Daniel Engberg <daniel.engberg.lists@pyret.net>
+Date: Sat, 12 Dec 2020 18:56:38 +0100
+Subject: [PATCH] p11-kit/lists.c: Add stdint.h to fix compilation
+
+Add stdint.h otherwise compilation fails on FreeBSD 13-CURRENT with "use of undeclared identifier 'SIZE_MAX'"
+
+Signed-off-by: Daniel Engberg <daniel.engberg.lists@pyret.net>
+
+[Retrieved from:
+https://github.com/p11-glue/p11-kit/commit/507c394cfcf4edffc5e4450c5d737e545c26b857]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ p11-kit/lists.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/p11-kit/lists.c b/p11-kit/lists.c
+index 365a6d89..1d9062be 100644
+--- a/p11-kit/lists.c
++++ b/p11-kit/lists.c
+@@ -39,6 +39,7 @@
+ 
+ #include <assert.h>
+ #include <ctype.h>
++#include <stdint.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdlib.h>
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 45f0f1d64e..3481a40b00 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 4b34e92ae36fa493e0d94366c767f06d5f9951e3d8581d10fd935d738db1574d  p11-kit-0.23.16.1.tar.gz
+sha256  8a8f40153dd5a3f8e7c03e641f8db400133fb2a6a9ab2aee1b6d0cb0495ec6b6  p11-kit-0.23.22.tar.xz
 # Locally computed
-sha256 2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
+sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 1ffc7e21c8..81972f811b 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.16.1
+P11_KIT_VERSION = 0.23.22
+P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPTS = --disable-static
-- 
2.29.2
