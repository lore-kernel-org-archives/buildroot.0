From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 16:06:05 -0700
Subject: [Buildroot] [PATCH v3 00/13] package/udisks: bump version to 2.9.0
Message-ID: <20200725230618.3640682-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Not many changes, just the two that Thomas mentioned. Also, because of the
addition of libabseil-cpp, V2 didn't apply cleanly anymore because of the
added entry in the DEVELOPERS file. This is fixed with this series.

Adam Duskett (13):
  package/gettext-gnu: add msgfmt wrapper
  package/libblockdev: new package
  package/libbytesize: new package
  package/libblockdev: add support for crypto plugin
  package/libblockdev: add support for fs plugin
  package/libblockdev: add support for loop plugin
  package/libblockdev: add support for lvm plugin
  package/libblockdev: add support for mdraid plugin
  package/libblockdev: add support for part plugin
  package/libblockdev: add support for swap plugin
  package/udisks/Config.in: alphabatize package selection
  package/udisks/udisks.mk: alphabatize dependencies
  package/udisks: bump version to 2.9.0

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/gettext-gnu/gettext-gnu.mk            | 13 +++
 package/gettext-gnu/msgfmt                    |  3 +
 package/libblockdev/Config.in                 | 70 ++++++++++++++++
 package/libblockdev/libblockdev.hash          |  3 +
 package/libblockdev/libblockdev.mk            | 80 ++++++++++++++++++
 .../0001-remove-msgcat-dependency.patch       | 36 +++++++++
 package/libbytesize/Config.in                 | 10 +++
 package/libbytesize/libbytesize.hash          |  3 +
 package/libbytesize/libbytesize.mk            | 27 +++++++
 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 20 ++++-
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 36 ++++++---
 17 files changed, 291 insertions(+), 160 deletions(-)
 create mode 100644 package/gettext-gnu/msgfmt
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk
 create mode 100644 package/libbytesize/0001-remove-msgcat-dependency.patch
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch

-- 
2.26.2
