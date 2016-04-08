From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 04:33:16 +0200
Subject: [Buildroot] [git commit] libsrtp: security bump to version 1.5.4
Message-ID: <20160408023327.9F96D81DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c67a6d7c50f9e02ac942259771c594303ca882e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-6360: Prevent potential DoS attack due to lack of bounds
checking on RTP header CSRC count and extension header length.

Also, add a hash file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsrtp/libsrtp.hash | 2 ++
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
new file mode 100644
index 0000000..cb060d2
--- /dev/null
+++ b/package/libsrtp/libsrtp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 56a7b521c25134f48faff26b0b1e3d4378a14986a2d3d7bc6fefb48987304ff0 libsrtp-v1.5.4.tar.gz
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index bcf344f..40b85e6 100644
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
