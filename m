From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 15:30:26 +0100
Subject: [Buildroot] [PATCH 0/4] udisks bump to version 2.8.4
Message-ID: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

this patchset bumps udisks version to 2.8.4 while adding new packages
required as dependencies:
- libbytesize
- volume_key
- libblockdev

Libblockdev requires gobject-introspection so I've taken pending Adam
Duskett's patchset[1] to make it work. Also it needs Arnout Vandecappelle's
"Introduce cross-bin directory" patchset[2].

[1]: https://patchwork.ozlabs.org/project/buildroot/list/?series=157909
[2]: https://patchwork.ozlabs.org/project/buildroot/list/?series=156716

All packages have been tested succesfully with ./utils/test-pkg -a

Giulio Benetti (4):
  package/libbytesize: add new package
  package/volume_key: add new package
  package/libblockdev: add new package
  package/udisks: bump version to 2.8.4

 DEVELOPERS                                    |  4 +
 package/Config.in                             |  3 +
 package/libblockdev/Config.in                 | 22 +++++
 package/libblockdev/libblockdev.hash          |  3 +
 package/libblockdev/libblockdev.mk            | 40 +++++++++
 package/libbytesize/Config.in                 | 10 +++
 package/libbytesize/libbytesize.hash          |  3 +
 package/libbytesize/libbytesize.mk            | 15 ++++
 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 31 ++++---
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 23 ++++--
 ...ove-po-Makefile.in-entry-from-AC_CON.patch | 28 +++++++
 package/volume_key/Config.in                  | 19 +++++
 package/volume_key/volume_key.hash            |  3 +
 package/volume_key/volume_key.mk              | 22 +++++
 18 files changed, 209 insertions(+), 164 deletions(-)
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
 create mode 100644 package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
 create mode 100644 package/volume_key/Config.in
 create mode 100644 package/volume_key/volume_key.hash
 create mode 100644 package/volume_key/volume_key.mk

-- 
2.20.1
