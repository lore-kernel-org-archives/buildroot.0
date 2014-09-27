From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Sep 2014 19:18:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland: requires shared library
Message-ID: <1411838282-17247-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
  CC       src/libwayland_server_la-wayland-server.lo
src/wayland-server.c:36:19: error: dlfcn.h: No such file or directory

using this defconfig
http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wayland/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index c92f9ea..0f78f15 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WAYLAND
 	bool "wayland"
 	depends on !BR2_avr32 # no epoll_create1, timerfd_create or timerfd_settime
+	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
@@ -14,3 +15,4 @@ config BR2_PACKAGE_WAYLAND
 comment "wayland needs a toolchain w/ threads"
 	depends on !BR2_avr32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
-- 
1.7.10.4
