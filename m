From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jul 2021 23:55:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: bump to latest git commit
Message-ID: <20210718215516.3296585-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Update indention in hash file (two spaces)
- This will fix a static build failure with gcc-10 thanks to
  https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=18ac1e26f756dd47fef33f5f706b0ec8fa696216

Fixes:
 - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tftpd/tftpd.hash | 6 +++---
 package/tftpd/tftpd.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index c876b2edc2..3cccb0f20e 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
-sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
+# Locally calculated
+sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-br1.tar.gz
 
 # Hash for license file
-sha256	5efef82650b8ece733e37790fc70f05e426c9e1ef9640d4ebcb04867bd3f5e28	tftpd/tftpd.c
+sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 494e963d64..ffd52ce0d0 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-TFTPD_VERSION = 5.2
-TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
-TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
+TFTPD_VERSION = b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7
+TFTPD_SITE = git://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
 TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
 TFTPD_CPE_ID_PRODUCT = tftpd-hpa
+# From git
+TFTPD_AUTORECONF = YES
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
-- 
2.30.2
