From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:34:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/gtk-bump
Message-ID: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a stack of patches that gathers:

 * libtool fixes from Martin Banky
 * libtool bump from Lionel Landwerlin
 * glib/gtk bump from myself

I've successfully built and tested the gtk-demo application with both
the X.org and DirectFB backends, using a uClibc Buildroot ARM toolchain.

Regards,

Thomas

The following changes since commit 2b721e9c11fae9bd3a836da19d679949e0788283:
  Peter Korsgaard (1):
        toolchain-crosstool-ng: fix arch for powerpc

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/gtk-bump

Lionel Landwerlin (2):
      libtool: bump to 2.2.10
      libtool: avoid to patch ltmain.sh script in host-libtool package

Martin Banky (5):
      BugFix - buildroot-libtool.patch - Removed Useless Code
      Added the ability to patch ltmain.sh based on version
      Removed expat-libdir-la.patch
      Removed freetype-2.3.9-libdir-la.patch
      Removed libmpd-0.17.0-libdir-la.patch

Thomas Petazzoni (5):
      package: add gdk-pixbuf package (splitted out from GTK+)
      libgtk2: bump to version 2.22.0 and undeprecate Gtk/DirectFB
      libglib2: bump version to 2.26.0
      pango: bump version to 1.28.2
      libglib2: remove fix-clock-gettime patch

 package/Config.in                                  |    1 +
 package/Makefile.autotools.in                      |   23 ++-
 ...-libtool.patch => buildroot-libtool-v1.5.patch} |   17 --
 ...ibdir-la.patch => buildroot-libtool-v2.2.patch} |   53 +---
 package/expat/expat-libdir-la.patch                |   77 ------
 package/expat/expat.mk                             |    1 -
 package/freetype/freetype-2.3.9-libdir-la.patch    |   81 ------
 package/freetype/freetype.mk                       |    1 -
 package/gdk-pixbuf/Config.in                       |   12 +
 package/gdk-pixbuf/gdk-pixbuf.mk                   |   51 ++++
 .../libglib2-fix-clock-gettime-check.patch         |   51 ----
 package/libglib2/libglib2-mkenums-nowarn.patch     |   14 +-
 package/libglib2/libglib2-optional-ipv6.patch      |   12 +-
 package/libglib2/libglib2.mk                       |    5 +-
 package/libgtk2/Config.in                          |    9 +-
 ... host-libgtk2-2.20.1-reduce-dependencies.patch} |  140 ++++-------
 package/libgtk2/libgtk2-2.12.6-configure.patch     |  256 --------------------
 package/libgtk2/libgtk2-2.12.6-no-tests.patch      |   11 -
 package/libgtk2/libgtk2.mk                         |   15 +-
 package/libtool/libtool.mk                         |    4 +-
 package/multimedia/libmpd/libmpd.mk                |    1 -
 package/pango/pango.mk                             |    2 +-
 22 files changed, 178 insertions(+), 659 deletions(-)
 rename package/{buildroot-libtool.patch => buildroot-libtool-v1.5.patch} (81%)
 rename package/{multimedia/libmpd/libmpd-0.17.0-libdir-la.patch => buildroot-libtool-v2.2.patch} (56%)
 delete mode 100644 package/expat/expat-libdir-la.patch
 delete mode 100644 package/freetype/freetype-2.3.9-libdir-la.patch
 create mode 100644 package/gdk-pixbuf/Config.in
 create mode 100644 package/gdk-pixbuf/gdk-pixbuf.mk
 delete mode 100644 package/libglib2/libglib2-fix-clock-gettime-check.patch
 rename package/libgtk2/{host-libgtk2-2.12.12-reduce-dependencies.patch => host-libgtk2-2.20.1-reduce-dependencies.patch} (50%)
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-configure.patch
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-no-tests.patch

Thanks,
-- 
Thomas Petazzoni
