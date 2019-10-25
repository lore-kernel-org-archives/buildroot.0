From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 19:27:44 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external: add support
 for D language
Message-ID: <20191025172118.455A887FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa12b06b6017b64caca4ccd420f826a395fdc66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk             | 4 ++++
 .../toolchain-external/toolchain-external-custom/Config.in.options | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 5eecd2a269..5147da0104 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -152,6 +152,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_DLANG),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgdruntime.so* libgphobos.so*
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 83d9ed61d7..a36747f490 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -415,6 +415,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_DLANG
+	bool "Toolchain has D support?"
+	select BR2_TOOLCHAIN_HAS_DLANG
+	help
+	  Select this option if your external toolchain has D
+	  support.
+
 config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
 	bool "Toolchain has Fortran support?"
 	select BR2_TOOLCHAIN_HAS_FORTRAN
