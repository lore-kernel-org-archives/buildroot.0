From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:40:47 +0200
Subject: [Buildroot] [git commit] package/wpebackend-fdo: switch over to
 Meson
Message-ID: <20200922193137.AC6858B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f39a8ede286eb09f1abf2730d9811be9e29605e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CMake based build system will be eventually removed by upstream
so it seems like a good idea to switch over to Meson already before
that happens.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpebackend-fdo/wpebackend-fdo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index e0331e7bd3..dc0c9b6740 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -12,4 +12,4 @@ WPEBACKEND_FDO_LICENSE = BSD-2-Clause
 WPEBACKEND_FDO_LICENSE_FILES = COPYING
 WPEBACKEND_FDO_DEPENDENCIES = libepoxy libglib2 libwpe wayland
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
