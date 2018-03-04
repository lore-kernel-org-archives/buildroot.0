From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 4 Mar 2018 11:17:26 +0100
Subject: [Buildroot] [PATCH next] uclibc: update to 1.0.29
Message-ID: <20180304101726.GA1833@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release adds a lot of bugfixes for x86_64 and aarch64.
It allows to compile and use more desktop applications.
For this gettext-tiny was integrated, but unfortunately it
fails to build in the context of buildroot, so I have to
disable UCLIBC_HAS_LIBINTL until this is fixed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uClibc-ng.config | 1 -
 package/uclibc/uclibc.hash      | 2 +-
 package/uclibc/uclibc.mk        | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 5beb2bd..f0a876f 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -23,7 +23,6 @@ UCLIBC_HAS_RESOLVER_SUPPORT=y
 UCLIBC_HAS_LIBRESOLV_STUB=y
 UCLIBC_HAS_LIBNSL_STUB=y
 UCLIBC_HAS_CTYPE_CHECKED=y
-UCLIBC_HAS_LIBINTL=y
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 UCLIBC_HAS_STDIO_GETC_MACRO=y
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0a15683..14f71d0 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  a1504ddc34a29cc9bfd1f5a7419c4b63bb510d9e2faed81618d1b596ceb0a5a9        uClibc-ng-1.0.28.tar.xz
+sha256  e014e34abb13e97ca81694927f8ba95484cca2d3abac64b71f1a7981a96cb99c        uClibc-ng-1.0.29.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c5b0c6b..8d198f6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.28
+UCLIBC_VERSION = 1.0.29
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.1.4
