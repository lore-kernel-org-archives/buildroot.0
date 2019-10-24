From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 24 Oct 2019 20:16:21 +0200
Subject: [Buildroot] [PATCH v2 3/3] toolchain-external: add support for D
 language
In-Reply-To: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk    | 4 ++++
 .../toolchain-external-custom/Config.in.options           | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c00211d59c..9c5321ea36 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -148,6 +148,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 83d9ed61d7..f686cb3305 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -415,6 +415,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_DLANG
+	bool "Toolchain has D support?"
+	select BR2_TOOLCHAIN_HAS_DLANG
+	help
+	  Select this option if your external toolchain has D
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
 	bool "Toolchain has Fortran support?"
 	select BR2_TOOLCHAIN_HAS_FORTRAN
-- 
2.21.0
