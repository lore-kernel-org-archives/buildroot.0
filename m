From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 23:12:44 +0200
Subject: [Buildroot] [PATCH v2 0/8] Update Cups and printing related packages
Message-ID: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is version 2 of the patchset to update Cups and printing related packages.
Reworked the locally generated hashes to sha256.
Rework some of the Licensing details for the packages.
Remove empty or unnecessary config options.
Gave attention to Arnouts comments.  Kept the patch for removing mantohtml. 
Config and Makefiles of Cups does not make it easy/elegant to remove manpage generation.

Olivier Schonken (8):
  package/cups: Un-deprecate, and update CUPS to 2.0.2
  package/hplip: Un-deprecate and bump version to 3.15.2
  package/gutenprint: Un-deprecate and bump version to 5.2.10
  package/poppler: bump version to 0.32.0
  package/openjpeg: New package openjpeg 1.5.2
  package/qpdf: New package qpdf 5.1.2
  package/ijs: New package ijs 0.35
  package/cups-filters: Add new package cups-filters 1.0.67

 package/Config.in                                  |  4 ++
 package/cups-filters/Config.in                     | 45 +++++++++++++++
 package/cups-filters/cups-filters.hash             |  2 +
 package/cups-filters/cups-filters.mk               | 65 ++++++++++++++++++++++
 ...01-Remove-building-html-from-man-makefile.patch | 28 ++++++++++
 package/cups/0001-fix-static.patch                 | 28 ----------
 package/cups/0002-Do-not-use-genstrings.patch      | 27 +++++++++
 package/cups/0002-fix-stack-protector-check.patch  | 25 ---------
 package/cups/0003-mantohtml.patch                  | 11 ----
 package/cups/Config.in                             | 18 +++---
 package/cups/cups.hash                             |  2 +
 package/cups/cups.mk                               | 52 +++++++++++------
 package/gutenprint/Config.in                       |  1 -
 package/gutenprint/gutenprint.hash                 |  2 +-
 package/gutenprint/gutenprint.mk                   |  2 +-
 package/hplip/Config.in                            |  1 -
 package/hplip/hplip.hash                           |  2 +-
 package/hplip/hplip.mk                             |  4 +-
 package/ijs/Config.in                              |  7 +++
 package/ijs/ijs.hash                               |  2 +
 package/ijs/ijs.mk                                 | 15 +++++
 package/openjpeg/Config.in                         |  6 ++
 package/openjpeg/openjpeg.hash                     |  2 +
 package/openjpeg/openjpeg.mk                       | 15 +++++
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         |  7 ++-
 package/qpdf/Config.in                             | 17 ++++++
 package/qpdf/qpdf.hash                             |  2 +
 package/qpdf/qpdf.mk                               | 16 ++++++
 29 files changed, 310 insertions(+), 100 deletions(-)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk
 create mode 100644 package/cups/0001-Remove-building-html-from-man-makefile.patch
 delete mode 100644 package/cups/0001-fix-static.patch
 create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
 delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
 delete mode 100644 package/cups/0003-mantohtml.patch
 create mode 100644 package/cups/cups.hash
 create mode 100644 package/ijs/Config.in
 create mode 100644 package/ijs/ijs.hash
 create mode 100644 package/ijs/ijs.mk
 create mode 100644 package/openjpeg/Config.in
 create mode 100644 package/openjpeg/openjpeg.hash
 create mode 100644 package/openjpeg/openjpeg.mk
 create mode 100644 package/qpdf/Config.in
 create mode 100644 package/qpdf/qpdf.hash
 create mode 100644 package/qpdf/qpdf.mk

-- 
1.9.1
