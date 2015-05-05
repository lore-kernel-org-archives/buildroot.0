From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 May 2015 17:12:15 +0200
Subject: [Buildroot] [git commit] package/neard: needs shared libs
Message-ID: <20150505152638.77CDA81DCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c61c3d3d4b9e1b97418c2c3699ec2943d76ef295
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

neard uses dlopen(), so needs shared libs.

Fixes:
    http://autobuild.buildroot.org/results/0a4/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neard/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index ed20e06..353d1af 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NEARD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNL
@@ -23,6 +24,6 @@ config BR2_PACKAGE_NEARD_TOOLS
 
 endif
 
-comment "neard needs a toolchain w/ wchar, threads"
+comment "neard needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
