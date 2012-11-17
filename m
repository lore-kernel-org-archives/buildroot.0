From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:23:58 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ee3a96137b6cbb8f970c540c61f75300a44ea803:

  lua-msgpack-native: fix fetch (2012-11-17 10:15:24 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git misc-fixes

for you to fetch changes up to e269850f46106974a04c05f22889e61202608453:

  dbus: uses fork(), requires MMU (2012-11-17 23:23:17 +0100)

----------------------------------------------------------------
Thomas Petazzoni (8):
      python: use default configure commands to get shared build
      libatomic_ops: bump to version 7.2
      gnutls: fix build failure due to non-existing gets in recent C libraries
      gsl: fix build on !i386 uClibc
      libffi: make thread support optional
      php: fix C++ link issue
      attr: fix static build
      dbus: uses fork(), requires MMU

Vellemans Noel (2):
      libxml2: add support for building host library with python support
      mesa3d: requires host-libxml2 and host-python to generate some files

 ...r-0001-attr-Fix-static-build-installation.patch |   30 ++++++++
 package/bluez_utils/Config.in                      |    1 +
 package/connman/Config.in                          |    1 +
 package/dbus/Config.in                             |    2 +
 package/efl/libedbus/Config.in                     |    1 +
 ...001-gets-no-longer-exists-in-e-glibc-2.16.patch |   56 +++++++++++++++
 package/gsl/gsl.mk                                 |   13 ++++
 package/gvfs/Config.in                             |    2 +
 package/libatomic_ops/libatomic_ops.mk             |    2 +-
 ...ffi-0003-Make-thread-support-conditionnal.patch |   73 ++++++++++++++++++++
 package/libxml2/Config.in                          |    3 +
 package/libxml2/libxml2.mk                         |   10 ++-
 package/network-manager/Config.in                  |    1 +
 package/ofono/Config.in                            |    1 +
 package/php/php.mk                                 |    4 ++
 package/python/python.mk                           |   14 +---
 package/qt/Config.in                               |    1 +
 package/samba/Config.in                            |    1 +
 package/systemd/Config.in                          |    1 +
 package/x11r7/mesa3d/Config.in                     |    1 +
 package/x11r7/mesa3d/mesa3d.mk                     |    4 +-
 system/Config.in                                   |    1 +
 22 files changed, 207 insertions(+), 16 deletions(-)
 create mode 100644 package/attr/attr-0001-attr-Fix-static-build-installation.patch
 create mode 100644 package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch
 create mode 100644 package/libffi/libffi-0003-Make-thread-support-conditionnal.patch

Thanks,
-- 
Thomas Petazzoni
