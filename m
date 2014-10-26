From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:04:52 +0100
Subject: [Buildroot] [git commit] package/libubox: cleanup dependencies
Message-ID: <20141026160700.2473AB0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ff0ef4500c1fadc6520c05b1c2b1393ad38027b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is already a (runtime) dependency for host-cmake.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/libubox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 7ff3c16..e6d95b7 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -8,7 +8,7 @@ LIBUBOX_VERSION = 5a0bbefc8fa440446253b171d0ac038d839360e3
 LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
-LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
+LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
