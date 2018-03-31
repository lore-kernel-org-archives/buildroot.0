From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:24:04 +0200
Subject: [Buildroot] [v3 10/13] package: share downloaded files for big
 packages
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-10-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk   | 5 +++++
 package/linux-headers/linux-headers.mk   | 3 +++
 package/mesa3d-headers/mesa3d-headers.mk | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index c476b2faeb..07da50afa8 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -8,6 +8,11 @@ GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
+# We do not have a 'gcc' package per-se; we only have two incarnations,
+# gcc-initial and gcc-final. gcc-initial is just am internal step that
+# users should not care about, while gcc-final is the one they shall see.
+HOST_GCC_INITIAL_SAME_SOURCE_AS = host-gcc-final
+
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index f1e3790608..6f4071c61a 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -82,6 +82,9 @@ endif
 
 endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
+# linux-headers really is the same as the linux package
+LINUX_HEADERS_SAME_SOURCE_AS = linux
+
 LINUX_HEADERS_LICENSE = GPL-2.0
 LINUX_HEADERS_LICENSE_FILES = COPYING
 
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b48d965d8a..39a25270db 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -15,6 +15,7 @@ endif
 MESA3D_HEADERS_VERSION = 18.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
+MESA3D_HEADERS_SAME_SOURCE_AS = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.html
 
-- 
2.16.2
