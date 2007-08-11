From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 14:00:42 +0300
Subject: [Buildroot] svn commit: trunk/buildroot: package package/cairo
 package/dillo pac etc...
In-Reply-To: <20070810190804.39EE4A65AA@busybox.net>
References: <20070810190804.39EE4A65AA@busybox.net>
Message-ID: <46BD96DA.1000004@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

andersen at uclibc.org ?????:
> Author: andersen
> Date: 2007-08-10 12:07:51 -0700 (Fri, 10 Aug 2007)
> New Revision: 19424
> 
> Log:
> Merge in X11R7 patches from Julien Letessier, posted 04 Jul 2007.  Doesn't
> quite work yet for me, but this clearly is a huge project and not having it
> quite work on the first pass is hardly unexpected.  We definately want this
> stuff in buildroot.
> 
> 
> Added:
>    trunk/buildroot/package/cairo/Config.in
>    trunk/buildroot/package/dillo/Config.in
>    trunk/buildroot/package/gettext/gettext.mk
>    trunk/buildroot/package/libgtk12/Config.in
>    trunk/buildroot/package/libgtk2/Config.in
>    trunk/buildroot/package/metacity/Config.in
>    trunk/buildroot/package/rdesktop/Config.in
>    trunk/buildroot/package/tinyx/Config.in
>    trunk/buildroot/package/xorg/Config.in
>    trunk/buildroot/package/xorg/xorg.mk
> 

Hello, in X11R7 merge you have dropped tinyx dependency for gtk12,gtk2,cairo.
The patch below allows gtk to be build against tinyx:

------

Index: package/libgtk12/Config.in
===================================================================
--- package/libgtk12/Config.in  (revision 19425)
+++ package/libgtk12/Config.in  (working copy)
@@ -2,7 +2,7 @@
         bool "libgtk12"
         default n
         select BR2_PACKAGE_LIBGLIB12
-       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
         help
           The GTK+ graphical user interface library

Index: package/libgtk2/Config.in
===================================================================
--- package/libgtk2/Config.in   (revision 19425)
+++ package/libgtk2/Config.in   (working copy)
@@ -7,7 +7,7 @@
         select BR2_PACKAGE_JPEG
         select BR2_PACKAGE_TIFF
         select BR2_PACKAGE_LIBPNG
-       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
         help
           The GTK+ version 2 graphical user interface library

Index: package/cairo/Config.in
===================================================================
--- package/cairo/Config.in     (revision 19425)
+++ package/cairo/Config.in     (working copy)
@@ -3,7 +3,7 @@
         default n
         select BR2_PACKAGE_PKGCONFIG
         select BR2_PACKAGE_LIBPNG
-       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+       depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
         help
           Cairo is a 2D graphics library with support for multiple
           output devices. Currently supported output targets include
