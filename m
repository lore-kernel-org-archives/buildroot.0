From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:40:39 +0200
Subject: [Buildroot] [git commit] package/fmt: bump to version 7.0.3
Message-ID: <20200917193145.89DD28B8E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3942b180dfd82589407c1213029943ef8db5a2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to use uploaded zip archive instead of githubs provided tarball.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 8559d6605f..1f45c212f3 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7697e022f9cdc4f90b5e0a409643faa2cde0a6312f85e575c8388a1913374de5  fmt-7.0.2.tar.gz
+sha256  decfdf9ad274070fa85f26407b816f5a4d82205ae86bac1990be658d0795ea4d  fmt-7.0.3.zip
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 10e2f0f0b4..0539dcc024 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-FMT_VERSION = 7.0.2
-FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
+FMT_VERSION = 7.0.3
+FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
+FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
 FMT_INSTALL_STAGING = YES
@@ -14,4 +15,8 @@ FMT_CONF_OPTS = \
 	-DFMT_INSTALL=ON \
 	-DFMT_TEST=OFF
 
+define FMT_EXTRACT_CMDS
+	$(UNZIP) -d $(BUILD_DIR) $(FMT_DL_DIR)/$(FMT_SOURCE)
+endef
+
 $(eval $(cmake-package))
