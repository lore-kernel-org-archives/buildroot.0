From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:08:33 +0200
Subject: [Buildroot] [git commit] package/restorecond: now available on
 !glibc configs
Message-ID: <20191009221024.11FCC7FB52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=853565a058070fd77b73da925f2d3a3874019976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux can now be built on !glibc configurations, so we can
re-enable restorecond on !glibc configurations as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/restorecond/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 54a5545a12..10ca74e351 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RESTORECOND
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -21,4 +20,4 @@ comment "restorecond needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
+		BR2_STATIC_LIBS
