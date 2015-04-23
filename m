From: =?UTF-8?q?C=C3=A9dric=20Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 23 Apr 2015 21:46:13 +0200
Subject: [Buildroot] [PATCH] host-cmake: Install with install/fast target
Message-ID: <1429818373-1788-1-git-send-email-cedric.marie@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use install/fast target in order to skip compilation in installation
step. The same trick has just been used in pkg-cmake.mk for all CMake
packages.

Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
---
 package/cmake/cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6b9e563..9ca6443 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -44,7 +44,7 @@ define HOST_CMAKE_BUILD_CMDS
 endef
 
 define HOST_CMAKE_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install/fast
 endef
 
 define CMAKE_REMOVE_EXTRA_DATA
-- 
2.1.4
