From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:32:46 +0200
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: build host with
 shared libs
Message-ID: <20200917202409.B9C8883DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0be62bf9f0e988d2dedc8bebffcdfba239cf4d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMake offers the BUILD_SHARED_LIBS flag as a default parameter
and most packages honor them.
Similar to pkg-autotools.mk build host packages always with
BUILD_SHARED_LIBS=ON.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 57bfea9be5..dc545caed9 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -146,6 +146,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TEST=OFF \
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
+		-DBUILD_SHARED_LIBS=ON \
 		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
