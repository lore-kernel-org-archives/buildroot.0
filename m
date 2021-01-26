From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 17:35:00 +0100
Subject: [Buildroot] [git commit] package/uvw: drop cmake workaround
Message-ID: <20210126164409.850F883809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c13de92460704351a484cf1d9845b1eacb69355a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
