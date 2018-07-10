From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Jul 2018 17:48:51 +0300
Subject: [Buildroot] [PATCH] uemacs: bump to latest git commit
Message-ID: <c766077c60c93e66067960184fad2c127dbde571.1531234131.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license and license hash.

Change git download site. The git download method does not work with
BR2_KERNEL_MIRROR that is set to https://cdn.kernel.org/pub by default.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uemacs/uemacs.hash | 3 ++-
 package/uemacs/uemacs.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index a88be88b562c..33f50ca72d39 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 c6772ccb519f89731ac927c6bd229617fa4a488b966251e9147a03f998c39960  uemacs-8841922689769960fa074fbb053cb8507f2f3ed9.tar.gz
+sha256 d28aa611e377c178808b5fe9dcb4285391070d2b2b96931b7d5fa0e5f99ed30e  uemacs-31a16c0ccab9a4b69c79920244b9c623bee7bffe.tar.gz
+sha256 6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 19fda124674c..845d6107608a 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-UEMACS_VERSION = 8841922689769960fa074fbb053cb8507f2f3ed9
-UEMACS_SITE = $(BR2_KERNEL_MIRROR)/scm/editors/uemacs/uemacs.git
+UEMACS_VERSION = 31a16c0ccab9a4b69c79920244b9c623bee7bffe
+UEMACS_SITE = https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
 UEMACS_SITE_METHOD = git
 UEMACS_DEPENDENCIES = ncurses
+UEMACS_LICENSE = MicroEMACS copyright notice
+UEMACS_LICENSE_FILES = README
 
 define UEMACS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-- 
2.18.0
