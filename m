From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 16:03:51 +0200
Subject: [Buildroot] [git commit] pkg-cmake: enable toolchain install
 staging phase
Message-ID: <20180326140406.81A2083C1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e807ddec287a1cc2855de53e88a17f404e0a0a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Really fix commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad

That commit added a script to "toolchain" post install staging hooks.
This will only be executed if TOOLCHAIN_INSTALL_STAGING is set to YES.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
