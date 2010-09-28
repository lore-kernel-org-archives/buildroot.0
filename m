From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 00:12:51 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/gtk-bump
Message-ID: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that bump components of the Gtk stack. The
most important bump is Gtk itself, bumped from the old 2.12 to
2.20. The result is that Gtk can no longer be built with DirectFB as
the backend, as announced during the 2010.08 cycle.

I've tested these changes by running the gtkperf application on top of
the Xfbdev server in a Qemu ARM system.

Thanks,

Thomas

The following changes since commit 3e5e39a8a25a4a085afe08bdcf46933c8d569ed7:
  Peter Korsgaard (1):
        barebox/u-boot/linux: don't error out on missing config when make source

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/gtk-bump

Thomas Petazzoni (3):
      libgtk2: bump to version 2.20.1 and mark Gtk/DirectFB as broken
      libglib2: bump version to 2.24.2
      pango: bump version to 1.28.2

 package/libglib2/libglib2.mk                       |    2 +-
 package/libgtk2/Config.in                          |   12 +-
 ... host-libgtk2-2.20.1-reduce-dependencies.patch} |  123 ++++------
 package/libgtk2/libgtk2-2.12.6-configure.patch     |  256 --------------------
 package/libgtk2/libgtk2-2.12.6-no-tests.patch      |   11 -
 package/libgtk2/libgtk2-2.20.1-libtool.patch       |   60 +++++
 package/libgtk2/libgtk2.mk                         |   14 +-
 package/pango/pango.mk                             |    2 +-
 8 files changed, 120 insertions(+), 360 deletions(-)
 rename package/libgtk2/{host-libgtk2-2.12.12-reduce-dependencies.patch => host-libgtk2-2.20.1-reduce-dependencies.patch} (58%)
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-configure.patch
 delete mode 100644 package/libgtk2/libgtk2-2.12.6-no-tests.patch
 create mode 100644 package/libgtk2/libgtk2-2.20.1-libtool.patch

Thanks,
-- 
Thomas Petazzoni
