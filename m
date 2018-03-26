From: Stefan Becker <chemobejk@gmail.com>
Date: Mon, 26 Mar 2018 15:00:43 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: enable toolchain install staging
 phase
Message-ID: <20180326120043.25160-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Really fix commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad

That commit added a script to "toolchain" post install staging hooks.
This will only be executed if TOOLCHAIN_INSTALL_STAGING is set to YES.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 34b49bdbe5..51a1929ebb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -274,3 +274,4 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
+TOOLCHAIN_INSTALL_STAGING = YES
-- 
2.14.3
