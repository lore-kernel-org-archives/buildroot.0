From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:42 +0100
Subject: [Buildroot] [PATCH 5/8] packages: remove "consecutive empty lines"
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <65d3b7e00fb26f0f0228431f055e19227dfa55b1.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... as reported by utils/check-package

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Yegor Yefremov<yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 2 --
 package/setools/setools.mk | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1d2201eec7..6e61108661 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -159,7 +159,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-idle3 \
 	--disable-pyc-build
 
-
 #
 # Some of CPython's source code is generated using Python interpreter
 # and some helper tools such as "Programs/_freeze_importlib" or
@@ -201,7 +200,6 @@ endef
 
 PYTHON3_PRE_BUILD_HOOKS += PYTHON3_MAKE_REGEN_IMPORTLIB
 
-
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 8b93ccf45e..6748c95c23 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -13,7 +13,6 @@ SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
 HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol
 
-
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
-- 
2.11.0
