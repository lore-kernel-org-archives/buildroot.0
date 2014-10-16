From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 16:02:40 -0300
Subject: [Buildroot] [PATCH] libxml2: security bump to version 2.9.2
Message-ID: <1413486160-7541-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3660 - billion laugh variant
CVE-2014-0191 - Do not fetch external parameter entities

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml2/libxml2.hash | 2 ++
 package/libxml2/libxml2.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/libxml2/libxml2.hash

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
new file mode 100644
index 0000000..69f4fdc
--- /dev/null
+++ b/package/libxml2/libxml2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc	libxml2-2.9.2.tar.gz
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f27c993..4e296fa 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.1
+LIBXML2_VERSION = 2.9.2
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
@@ -19,6 +19,7 @@ endif
 LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug --without-lzma
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
+LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
-- 
2.0.4
