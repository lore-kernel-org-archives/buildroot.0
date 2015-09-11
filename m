From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri, 11 Sep 2015 12:05:07 +0200
Subject: [Buildroot] [PATCH 0/5] Buildroot printing with Cups
Message-ID: <1441965911-22138-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm resubbmitting this patch series.  It seems that the previous sub-
mission got lost due to a mail server or other issue.  The versions
has been updated to the latest available.  
CUPS 2.1.0 adds support for 3D printing. Lots of possibilities...

CUPS-filters provides backends, filters, and other software that was once 
part of the core CUPS distribution but is no longer maintained by Apple Inc.
From CUPS 1.6.0 forward, cups-filters is required for using printer drivers
with CUPS under linux.  It is maintained by the openprinting group of the
linux foundation.

Olivier Schonken (5):
  package/poppler: bump version to 0.35.0
  package/cups: Un-deprecate, and update CUPS to 2.1.0
  package/hplip: Un-deprecate and bump version to 3.15.7
  package/gutenprint: Un-deprecate and bump version to 5.2.10
  package/cups-filters: Add new package cups-filters 1.0.74

 package/Config.in                                  |  1 +
 package/cups-filters/Config.in                     | 47 ++++++++++++++++
 package/cups-filters/cups-filters.hash             |  2 +
 package/cups-filters/cups-filters.mk               | 65 ++++++++++++++++++++++
 ...01-Remove-building-html-from-man-makefile.patch | 27 +++++++++
 package/cups/0001-fix-static.patch                 | 28 ----------
 package/cups/0002-Do-not-use-genstrings.patch      | 27 +++++++++
 package/cups/0002-fix-stack-protector-check.patch  | 25 ---------
 package/cups/0003-mantohtml.patch                  | 11 ----
 package/cups/Config.in                             | 19 ++++---
 package/cups/cups.hash                             |  2 +
 package/cups/cups.mk                               | 44 +++++++++------
 package/gutenprint/Config.in                       |  1 -
 package/gutenprint/gutenprint.hash                 |  2 +-
 package/gutenprint/gutenprint.mk                   |  2 +-
 package/hplip/Config.in                            |  1 -
 package/hplip/hplip.hash                           |  2 +-
 package/hplip/hplip.mk                             |  4 +-
 ...invalid-shell-comparaison-in-libtiff-test.patch | 23 --------
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         | 13 ++++-
 21 files changed, 227 insertions(+), 121 deletions(-)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk
 create mode 100644 package/cups/0001-Remove-building-html-from-man-makefile.patch
 delete mode 100644 package/cups/0001-fix-static.patch
 create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
 delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
 delete mode 100644 package/cups/0003-mantohtml.patch
 create mode 100644 package/cups/cups.hash
 delete mode 100644 package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch

-- 
1.9.1
