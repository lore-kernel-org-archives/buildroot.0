From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:48:09 +0100
Subject: [Buildroot] [PATCH 1/9] package/uvw: drop cmake workaround
Message-ID: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uvw/uvw.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 39952caa11..f152d9f1cf 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -13,8 +13,4 @@ UVW_DEPENDENCIES = libuv
 UVW_LICENSE = MIT
 UVW_LICENSE_FILES = LICENSE
 
-# The following CMake variable disables a TRY_RUN call in the -pthread
-# test which is not allowed when cross-compiling (for cmake < 3.10)
-UVW_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
-
 $(eval $(cmake-package))
-- 
2.29.2
