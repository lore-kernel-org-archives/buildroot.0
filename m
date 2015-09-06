From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 6 Sep 2015 16:00:23 +0200
Subject: [Buildroot] [PATCH] uclibc: fix coreutils cut bug,
	enable needed config symbols
Message-ID: <20150906140023.GA10550@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Symbols needed for all versions/flavours of uClibc.

Fixes https://bugs.buildroot.org/show_bug.cgi?id=4099

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-0.9.33.config   |    4 ++--
 package/uclibc/uClibc-snapshot.config |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index afee4fd..104eb5c 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -204,8 +204,8 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
 # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index f999a75..cbb4737 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -24,8 +24,8 @@ UCLIBC_HAS_LIBNSL_STUB=y
 UCLIBC_HAS_CTYPE_CHECKED=y
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
-- 
1.7.10.4
