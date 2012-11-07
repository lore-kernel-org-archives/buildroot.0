From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed,  7 Nov 2012 16:01:19 +0100
Subject: [Buildroot] [PATCH 0/2] Add python3 support
Message-ID: <1352300481-825-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

After some hard work during the Buildroot dev days, here is the first attempt
at adding the python3 package to buildroot.

The patchset is actually smaller than for python2.7, even though we still carry
most of the patches, for several reasons:
  - you can now pass a path to an external python interpreter directly using
    the PYTHON_FOR_BUILD variable
  - The building of the modules will detect if the headers and libs for a given
    library are present so that it will build even if the libraries are missing

Maxime

Maxime Ripard (2):
  Give the path to the realdelf binary the the packages
  Add python3 package

 package/Config.in                                  |    1 +
 package/Makefile.in                                |    2 +
 package/python3/Config.in                          |   81 ++++++++++
 ...n3-3.3-000-generate-sysconfigdata-buildir.patch |  158 ++++++++++++++++++++
 .../python3-3.3-001-support-for-build.patch        |   68 +++++++++
 .../python3-3.3-002-no-host-headers-libs.patch     |   72 +++++++++
 .../python3-3.3-003-staging-header-libs.patch      |   41 +++++
 ...n3-3.3-004-no-import-when-cross-compiling.patch |   27 ++++
 ...python3-3.3-005-do-not-generate-pyo-files.patch |   40 +++++
 .../python3-3.3-006-reread-environment.patch       |   63 ++++++++
 ...ython3-3.3-007-change-pyconfig-h-location.patch |   76 ++++++++++
 package/python3/python3-3.3-008-no-rpath.patch     |   51 +++++++
 .../python3-3.3-009-verbose-module-build.patch     |   26 ++++
 ...3-010-distutils-cross-compilation-support.patch |   71 +++++++++
 ...python3-3.3-011-cross-compile-getaddrinfo.patch |   21 +++
 package/python3/python3.mk                         |  152 +++++++++++++++++++
 16 files changed, 950 insertions(+)
 create mode 100644 package/python3/Config.in
 create mode 100644 package/python3/python3-3.3-000-generate-sysconfigdata-buildir.patch
 create mode 100644 package/python3/python3-3.3-001-support-for-build.patch
 create mode 100644 package/python3/python3-3.3-002-no-host-headers-libs.patch
 create mode 100644 package/python3/python3-3.3-003-staging-header-libs.patch
 create mode 100644 package/python3/python3-3.3-004-no-import-when-cross-compiling.patch
 create mode 100644 package/python3/python3-3.3-005-do-not-generate-pyo-files.patch
 create mode 100644 package/python3/python3-3.3-006-reread-environment.patch
 create mode 100644 package/python3/python3-3.3-007-change-pyconfig-h-location.patch
 create mode 100644 package/python3/python3-3.3-008-no-rpath.patch
 create mode 100644 package/python3/python3-3.3-009-verbose-module-build.patch
 create mode 100644 package/python3/python3-3.3-010-distutils-cross-compilation-support.patch
 create mode 100644 package/python3/python3-3.3-011-cross-compile-getaddrinfo.patch
 create mode 100644 package/python3/python3.mk

-- 
1.7.9.5
