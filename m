From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 May 2020 07:39:11 +0300
Subject: [Buildroot] [PATCH next] package/uhubctl: bump to version 2.2.0
Message-ID: <73c54402e688998f5a2a811cb3613a41bc164302.1590640751.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force GIT_VERSION to avoid git version logic that takes the Buildroot
git commit id.

Update LICENSE hash; copyright year update.

Format hashes file with two space delimiters.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uhubctl/uhubctl.hash | 4 ++--
 package/uhubctl/uhubctl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 255f7aa111e9..c477301c786e 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 227fdd541067b84eaa0e15cdc171458a56de7591f7a1deaff3e6d42d2809450b uhubctl-2.1.0.tar.gz
-sha256 05d376f74b3b539e2758d2b8a4bef5b15e567350d19c8581b5344bf4ce84414a LICENSE
+sha256  e5a722cb41967903bedbab4eea566ab332241a7f05fc7bc9c386b9a5e1762d8b  uhubctl-2.2.0.tar.gz
+sha256  2d3aa0737e8db9dfd710f9a282b446cb7b15b2b3eecac383f0c45c64d736eea0  LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index da217a7bd709..0633152cce94 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.1.0
+UHUBCTL_VERSION = 2.2.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
 UHUBCTL_DEPENDENCIES = libusb
 
 define UHUBCTL_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) GIT_VERSION=v$(UHUBCTL_VERSION) -C $(@D)
 endef
 
 define UHUBCTL_INSTALL_TARGET_CMDS
-- 
2.26.2
