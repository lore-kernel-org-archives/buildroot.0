From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 21:43:45 +0200
Subject: [Buildroot] [git commit master 1/1] package: mark
	libglib12/libgtk12/dillo as deprecated
Message-ID: <20100722204537.D65F982DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4800b4654ae529d23b3c9697123c94ffce313d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gtk2 was released back in 2002, and gtk3 is almost ready - So deprecate
the old gtk12 stack. Unless someone complains, expect it to be removed
during the 2010.11 development cycle.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    2 ++
 package/dillo/Config.in     |    1 +
 package/libglib12/Config.in |    1 +
 package/libgtk12/Config.in  |    1 +
 4 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index f031cb5..6fa9b7b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,6 +29,8 @@
 
 	Removed packages: modutils, portage, rxvt
 
+	Deprecated packages: dillo, libglib12, libgtk12
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#321:  alsa-lib uses host include files for python which breaks ...
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 87418d2..63a4f7d 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DILLO
 	bool "dillo"
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB12
 	select BR2_PACKAGE_LIBGTK12
diff --git a/package/libglib12/Config.in b/package/libglib12/Config.in
index 17e2db5..f6b7d24 100644
--- a/package/libglib12/Config.in
+++ b/package/libglib12/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGLIB12
 	bool "libglib12"
+	depends on BR2_DEPRECATED
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
diff --git a/package/libgtk12/Config.in b/package/libgtk12/Config.in
index 01393f9..7845f20 100644
--- a/package/libgtk12/Config.in
+++ b/package/libgtk12/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGTK12
 	bool "libgtk12"
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB12
 	depends on BR2_PACKAGE_XORG7
 	help
-- 
1.7.1
