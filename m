From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:45 +0200
Subject: [Buildroot] [PATCH 07/44] cmake: new package
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <73b1ab73d7fcbf3c6db46c8e7c6eb612b7a2b27a.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only compilation for the host is supported, why explains why we don't
have a Config.in and the corresponding BR2_PACKAGE_CMAKE option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/cmake/cmake.mk

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
new file mode 100644
index 0000000..42d4ff5
--- /dev/null
+++ b/package/cmake/cmake.mk
@@ -0,0 +1,20 @@
+CMAKE_VERSION=2.8.0
+CMAKE_SOURCE=cmake-$(CMAKE_VERSION).tar.gz
+CMAKE_SITE=http://www.cmake.org/files/v2.8/
+
+define HOST_CMAKE_CONFIGURE_CMDS
+ (cd $(@D); \
+   ./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(BR2_JLEVEL) \
+ )
+endef
+
+define HOST_CMAKE_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_CMAKE_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(call GENTARGETS,package,cmake))
+$(eval $(call GENTARGETS,package,cmake,host))
\ No newline at end of file
-- 
1.6.3.3
