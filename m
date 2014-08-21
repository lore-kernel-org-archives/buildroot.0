From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:45:18 +0200
Subject: [Buildroot] [PATCH v2 3/5] toolchainfile.cmake.in: set linker flags
In-Reply-To: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408653920-18954-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linker flags are part of the toolchain configuration, so set them for
the CMake-based packages.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- no change
---
 package/pkg-cmake.mk                | 1 +
 support/misc/toolchainfile.cmake.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3655751..2006b76 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -177,6 +177,7 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 		-e 's:@@STAGING_SUBDIR@@:$(call qstrip,$(STAGING_SUBDIR)):' \
 		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
 		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
+		-e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
 		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
 		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 46ed932..1dfbdba 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -14,6 +14,7 @@ set(CMAKE_SYSTEM_NAME Linux)
 
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS" FORCE)
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS" FORCE)
+set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
-- 
2.1.0
