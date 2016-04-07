From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  8 Apr 2016 01:09:37 +0300
Subject: [Buildroot] [PATCH] libsrtp: security bump to version 1.5.4
Message-ID: <e7defdf081d86eb2f052a4fc77fc329c813a0a75.1460066977.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-6360: Prevent potential DoS attack due to lack of bounds
checking on RTP header CSRC count and extension header length.

Also, add a hash file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsrtp/libsrtp.hash | 2 ++
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libsrtp/libsrtp.hash

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
new file mode 100644
index 000000000000..cb060d27b9a1
--- /dev/null
+++ b/package/libsrtp/libsrtp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 56a7b521c25134f48faff26b0b1e3d4378a14986a2d3d7bc6fefb48987304ff0 libsrtp-v1.5.4.tar.gz
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index bcf344fa55bf..40b85e69f3cf 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = v1.5.2
+LIBSRTP_VERSION = v1.5.4
 LIBSRTP_SITE = $(call github,cisco,libsrtp,$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3c
-- 
2.8.0.rc3
