From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 08:43:51 +0100
Subject: [Buildroot] [PATCH] package/tpm2-totp: bump version to 0.2.1
Message-ID: <20200113074352.20992-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop patch now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-src-libtpm2-totp.c-include-endian.h.patch | 34 -------------------
 package/tpm2-totp/tpm2-totp.hash              |  2 +-
 package/tpm2-totp/tpm2-totp.mk                |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/tpm2-totp/0001-src-libtpm2-totp.c-include-endian.h.patch

diff --git a/package/tpm2-totp/0001-src-libtpm2-totp.c-include-endian.h.patch b/package/tpm2-totp/0001-src-libtpm2-totp.c-include-endian.h.patch
deleted file mode 100644
index 5887af36b6..0000000000
--- a/package/tpm2-totp/0001-src-libtpm2-totp.c-include-endian.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a69c50fc2b8c35814e195eacb01f0d60feb54dd1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 Dec 2019 19:26:32 +0100
-Subject: [PATCH] src/libtpm2-totp.c: include <endian.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix the following build failure with musl:
-
-src/libtpm2-totp.c: In function ?tpm2totp_calculate?:
-src/libtpm2-totp.c:826:11: warning: implicit declaration of function ?htobe64? [-Wimplicit-function-declaration]
-     tmp = htobe64(tmp);
-           ^~~~~~~
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/tpm2-software/tpm2-totp/commit/a69c50fc2b8c35814e195eacb01f0d60feb54dd1]
----
- src/libtpm2-totp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libtpm2-totp.c b/src/libtpm2-totp.c
-index a364b7a..2d3f00d 100644
---- a/src/libtpm2-totp.c
-+++ b/src/libtpm2-totp.c
-@@ -8,6 +8,7 @@
- 
- #include <tpm2-totp.h>
- 
-+#include <endian.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index 417b583b17..a3fcb394cf 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 4bcb8b8ff320727f707841d839c242149649ad07edbced94f2984ade26a69d6c  tpm2-totp-0.2.0.tar.gz
+sha256 0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
 sha256 67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index a41f899a71..250a016a50 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOTP_VERSION = 0.2.0
+TPM2_TOTP_VERSION = 0.2.1
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
-- 
2.20.1
