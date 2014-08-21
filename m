From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:45:16 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/pkg-cmake.mk: remove the
	USE_CCACHE CMake flag for host-package
In-Reply-To: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408653920-18954-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The USE_CCACHE CMake flag is only useful when building target package
(only the toolchainfile.cmake uses it).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- no change
---
 package/pkg-cmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 30198a9..f5aefae 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,7 +86,6 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
-		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
-- 
2.1.0
