From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 12:02:11 +0200
Subject: [Buildroot] [PATCH 3/3] package/pkg-cmake.mk: build host with
 shared libs
In-Reply-To: <20200916100212.2903033-1-buildroot@heine.tech>
References: <20200916100212.2903033-1-buildroot@heine.tech>
Message-ID: <20200916100212.2903033-4-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake offers the BUILD_SHARED_LIBS flag as a default parameter
and most packages honor them.
Similar to pkg-autotools.mk build host packages always with
BUILD_SHARED_LIBS=ON.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
