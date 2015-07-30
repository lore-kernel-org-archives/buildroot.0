From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:19:25 +0200
Subject: [Buildroot] [git commit] libgail: mark as deprecated
Message-ID: <20150730211931.82DC07FA17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45f79c711ce80951c0e511cb87a4efc761ab332e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mark libgail as deprecated now that midori has been updated to use
webkitgtk24 and the only package that uses it (webkit) has been
deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgail/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 3967083..5e4f03b 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBGAIL
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	select BR2_PACKAGE_PANGO
 	help
 	  GAIL provides accessibility support for gtk+ and
@@ -27,3 +28,4 @@ comment "libgail needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_DEPRECATED_SINCE_2015_08
