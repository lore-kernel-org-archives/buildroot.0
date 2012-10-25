From: Xinglong Liao <xinglong.liao@gmail.com>
Date: Thu, 25 Oct 2012 16:30:43 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/uClibc: correct a slip of the pen
In-Reply-To: <n>
References: <n>
Message-ID: <1351153843-16204-1-git-send-email-xinglong.liao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

UCLIB_EXTRA_CFLAGS -> UCLIBC_EXTRA_CFLAGS

Signed-off-by: Xinglong Liao <xinglong.liao@gmail.com>
---
 toolchain/uClibc/uclibc.mk |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index d1cd718..397cdd4 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -379,7 +379,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
 	touch $@
@@ -398,7 +398,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" headers \
 		lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
@@ -420,7 +420,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLO
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		all
 	touch -c $@
@@ -432,7 +432,7 @@ uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	touch -c $(UCLIBC_DIR)/.config
@@ -445,7 +445,7 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		install_runtime install_dev
 	# Install the kernel headers to the staging dir if necessary
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
@@ -475,7 +475,7 @@ $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIB_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		install_runtime
 	touch -c $@
 
-- 
1.7.9.5
