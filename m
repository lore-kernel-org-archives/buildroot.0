From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Jun 2020 22:43:40 +0200
Subject: [Buildroot] [PATCH v3 0/7] Cups revamp
Message-ID: <20200624204347.797088-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s series fixes various nitpicks we found using cups and do some
bumps.

Changelog:
v1->v2:
* Adding missing patch "Add lp user as default cups user" 
v1->v2:
* Fixes to Signed-of
* Decoupling service file fixing from bumps
* Better explaining backported patches

Angelo Compagnucci (7):
  package/cups-filters: fix cups-browsed service
  package/cups-filters: bump to version 1.27.5
  package/cups: fix cups service
  package/cups: bump to version 2.3.3
  package/cups: Add lp user as default cups user
  package/cups: Add udev rules to assign usb printers group to lp
  package/cups: adding python support

 package/cups-filters/S82cups-browsed          | 48 +++++++++++++++++++
 package/cups-filters/cups-filters.hash        |  2 +-
 package/cups-filters/cups-filters.mk          | 15 +++++-
 ...move-man-from-BUILDDIRS-in-configure.patch |  8 ++--
 package/cups/0002-Do-not-use-genstrings.patch | 14 +++---
 ...0004-Remove-PIE-flags-from-the-build.patch |  8 ++--
 package/cups/70-usb-printers.rules            |  3 ++
 package/cups/S81cupsd                         | 48 +++++++++++++++++++
 package/cups/cups.hash                        |  2 +-
 package/cups/cups.mk                          | 37 +++++++++++++-
 10 files changed, 167 insertions(+), 18 deletions(-)
 create mode 100644 package/cups-filters/S82cups-browsed
 create mode 100644 package/cups/70-usb-printers.rules
 create mode 100644 package/cups/S81cupsd

-- 
2.25.1
