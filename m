From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 5 Sep 2015 17:24:23 +0200
Subject: [Buildroot] [PATCH 2/3] uclibc: fix coreutils cut bug,
 enable needed config symbols
Message-ID: <20150905152423.GA23237@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.buildroot.org/show_bug.cgi?id=4099

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-ng.config |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 6523585..c17603d 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
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
