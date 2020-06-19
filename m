From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:12 +0200
Subject: [Buildroot] [PATCH v2 0/7] Cups revamp
Message-ID: <20200619145719.2352019-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes various nitpicks we found using cups and do some
bumps.

Changelog:
v1->v2:
* Adding missing patch "Add lp user as default cups user" 

Angelo Compagnucci (5):
  package/cups-filters: bump to version 1.27.5
  package/cups: bump to version 2.3.3
  package/cups: Add lp user as default cups user
  package/cups: Add udev rules to assign usb printers group to lp
  package/cups: adding python support

Michael Trimarchi (2):
  package/dejavu: Install dejavu fonts in staging dir
  package/qt5: Enable cups support when BR2_PACKAGE_CUPS

 package/cups-filters/Config.in                |  3 ++
 package/cups-filters/S82cups-browsed          | 23 ++++++++++++
 package/cups-filters/cups-filters.hash        |  2 +-
 package/cups-filters/cups-filters.mk          | 20 +++++++++--
 ...move-man-from-BUILDDIRS-in-configure.patch |  8 +++--
 package/cups/0002-Do-not-use-genstrings.patch | 14 ++++----
 ...0004-Remove-PIE-flags-from-the-build.patch |  8 +++--
 package/cups/70-usb-printers.rules            |  4 +++
 package/cups/S81cupsd                         | 23 ++++++++++++
 package/cups/cups.hash                        |  2 +-
 package/cups/cups.mk                          | 35 +++++++++++++++++--
 package/dejavu/dejavu.mk                      |  9 +++++
 package/qt5/qt5base/qt5base.mk                |  8 ++++-
 13 files changed, 139 insertions(+), 20 deletions(-)
 create mode 100644 package/cups-filters/S82cups-browsed
 create mode 100644 package/cups/70-usb-printers.rules
 create mode 100644 package/cups/S81cupsd

-- 
2.25.1
