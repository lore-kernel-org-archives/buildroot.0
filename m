From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:57 +0100
Subject: [Buildroot] [PATCH 6/8 RFC] packages: use HOST_PATH
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <79a4ac93cb757a4db8e715711e9cd76127dd2b14.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/Makefile.in   | 6 +++---
 package/pkg-cmake.mk  | 2 +-
 package/pkg-python.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 82a66c2..7517a62 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -272,7 +272,7 @@ TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
 
 HOST_CONFIGURE_OPTS = \
-	PATH=$(BR_PATH) \
+	PATH=$(HOST_PATH) \
 	AR="$(HOSTAR)" \
 	AS="$(HOSTAS)" \
 	LD="$(HOSTLD)" \
@@ -295,7 +295,7 @@ HOST_CONFIGURE_OPTS = \
 	INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = \
-	PATH=$(BR_PATH) \
+	PATH=$(HOST_PATH) \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
@@ -305,7 +305,7 @@ HOST_MAKE_ENV = \
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
 EXTRA_ENV = \
-	PATH=$(BR_PATH) \
+	PATH=$(HOST_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..101a551 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -109,7 +109,7 @@ define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
-	PATH=$$(BR_PATH) \
+	PATH=$$(HOST_PATH) \
 	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b7a702d..d94a485 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -43,7 +43,7 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(HOST_PATH)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
@@ -70,7 +70,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(HOST_PATH)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
-- 
1.9.1
