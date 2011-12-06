From: Daniel Mack <zonque@gmail.com>
Date: Tue,  6 Dec 2011 12:45:56 +0100
Subject: [Buildroot] [PATCH 0/3] libglib bump + host-ffi dependency resolved
Message-ID: <1323171959-24873-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to build libglib2 in version 2.30.2, libffi is required to
provide host builds.

Daniel Mack (3):
  libffi: remove invalid variable 'includedir' in .pc file
  libffi: enable host target
  libglib2: bump to version 2.30.2

 package/libffi/libffi.mk                           |    7 +++-
 package/libglib2/Config.in                         |    1 +
 ...ib2-configure.ac-fix-cross-compile-builds.patch |   39 ++++++++++++++++++++
 ...b2-fix-compilation-with-no-builtin-atomic.patch |   25 -------------
 package/libglib2/libglib2.mk                       |   11 ++++--
 5 files changed, 52 insertions(+), 31 deletions(-)
 create mode 100644 package/libglib2/libglib2-configure.ac-fix-cross-compile-builds.patch
 delete mode 100644 package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch

-- 
1.7.7.3
