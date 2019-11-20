From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:22 +0000
Subject: [Buildroot] [RFC PATCH v3 08/30] package/compiler-rt: Fix to
 install the blacklist datafiles for host-clang.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-9-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/compiler-rt/compiler-rt.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
index febd71b906..c41ebcd5c1 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/compiler-rt/compiler-rt.mk
@@ -28,7 +28,18 @@ COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
 # standalone.
 define COMPILER_RT_SETUP_RUNTIME_LIBS
 	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
+	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
 	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share/asan_blacklist.txt \
+	      $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share/asan_blacklist.txt
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share/cfi_blacklist.txt \
+	      $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share/cfi_blacklist.txt
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share/dfsan_abilist.txt \
+	      $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share/dfsan_abilist.txt
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share/hwasan_blacklist.txt \
+	      $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share/hwasan_blacklist.txt
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share/msan_blacklist.txt \
+	      $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share/msan_blacklist.txt
 endef
 COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
 
-- 
2.20.1
