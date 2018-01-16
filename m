From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Jan 2018 15:17:56 +0200
Subject: [Buildroot] [PATCH] picocom: bump to version 3.0
Message-ID: <1a63141e34939dac4fac56fb58ff42110b751ab4.1516108676.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop LDFLAGS forcing. Makefile now uses appends to environment LDFLAGS.

Add license hash.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/picocom/picocom.hash | 3 ++-
 package/picocom/picocom.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 16db03e10485..f1558304930d 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 3e3904158d675541f0fcfdcd1f671b38445338f536080f5de8d6674b5f33d4ce  picocom-2.2.tar.gz
+sha256 a539db95bde3a5ebd52ae58a21f40d00cc2c97bf14b1f50caffc07257989112e  picocom-3.0.tar.gz
+sha256 9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 4e25556f4c55..0fa60f99c3b3 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 2.2
+PICOCOM_VERSION = 3.0
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
-- 
2.15.1
