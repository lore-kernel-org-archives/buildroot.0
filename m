From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:27 -0300
Subject: [Buildroot] [PATCH 06/13] patch: needs toolchain with wchar
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Patch needs a toolchain with WCHAR support
* Use real upstream gnu mirror

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/Config.in |    4 ++++
 package/patch/patch.mk  |    6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/patch/Config.in b/package/patch/Config.in
index 5a80ea5..dd6d51c 100644
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PATCH
 	bool "patch"
+	depends on BR2_USE_WCHAR
 	help
 	  Take patch files (containing difference listings) and apply them
 	  to original files, producing patched versions.
 
 	  http://www.gnu.org/software/patch/
+
+comment "patch needs a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 80d9db1..5c46c77 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -3,8 +3,8 @@
 # patch
 #
 #############################################################
-PATCH_VERSION:=2.6
-PATCH_SOURCE:=patch_$(PATCH_VERSION).orig.tar.gz
-PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/patch
+
+PATCH_VERSION = 2.6
+PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 
 $(eval $(call AUTOTARGETS,package,patch))
-- 
1.7.2.2
