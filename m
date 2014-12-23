From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 23 Dec 2014 09:54:58 +0100
Subject: [Buildroot] [PATCH v5 1/4] Rename the variable "QUIET" to
	"BR_QUIET" for conformance
In-Reply-To: <1419324901-14003-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419324901-14003-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419324901-14003-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the variable "QUIET" to "BR_QUIET" accordingly to the convention
that internal variables should be named BR_XXX.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v5:
     - add this patch (Yann)

 Makefile                           | 2 +-
 package/Makefile.in                | 2 +-
 package/berkeleydb/berkeleydb.mk   | 2 +-
 package/gcc/gcc-final/gcc-final.mk | 2 +-
 package/pkg-autotools.mk           | 4 ++--
 package/pkg-download.mk            | 8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 10445a2..3baa709 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+BR_QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
diff --git a/package/Makefile.in b/package/Makefile.in
index a63a2e8..bad49c3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -223,7 +223,7 @@ BISON := $(shell which bison || type -p bison)
 SED := $(shell which sed || type -p sed) -i -e
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(BR_QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 30fc518..a7b8a70 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -25,7 +25,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		../dist/configure $(QUIET) \
+		../dist/configure $(BR_QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c014bc5..875579c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -36,7 +36,7 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
 		--prefix="$(HOST_DIR)/usr" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-static \
-		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
+		$(BR_QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
 	)
 endef
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b20e20e..4bad10f 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -204,7 +204,7 @@ define $(2)_CONFIGURE_CMDS
 		$$(DISABLE_IPV6) \
 		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
-		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
+		$$(BR_QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
 else
@@ -233,7 +233,7 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-dependency-tracking \
-		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
+		$$(BR_QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
 endif
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ba72fc1..884daff 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,14 +8,14 @@
 ################################################################################
 
 # Download method commands
-export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+export WGET := $(call qstrip,$(BR2_WGET)) $(BR_QUIET)
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
-export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
-SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
+export HG := $(call qstrip,$(BR2_HG)) $(BR_QUIET)
+export SCP := $(call qstrip,$(BR2_SCP)) $(BR_QUIET)
+SSH := $(call qstrip,$(BR2_SSH)) $(BR_QUIET)
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-- 
2.2.1
