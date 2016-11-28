From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 28 Nov 2016 18:35:50 +0200
Subject: [Buildroot] [PATCH v1 0/3] efibootmgr: build with uClibc
Message-ID: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches make possible to use efibootmgr with uClibc. All patches had been
sent to upstream.

I have tested in my environment that doesn't use unicode characters. So, any
additional tests are appreciated.

Andy Shevchenko (3):
  efivar: bump to version 30
  efivar: allow build with uClibc
  efibootmrg: Allow build with uClibc

 .../efibootmgr/0001-Allow-build-with-uClibc.patch  | 38 ++++++++++++++++++++++
 package/efibootmgr/Config.in                       |  3 +-
 package/efibootmgr/efibootmgr.mk                   |  8 +++--
 ...fs-to-avoid-the-multiple-definitions-bug-.patch | 28 ++++++++++++++++
 package/efivar/0002-Allow-build-with-uClibc.patch  | 38 ++++++++++++++++++++++
 package/efivar/Config.in                           |  2 --
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  2 +-
 8 files changed, 112 insertions(+), 9 deletions(-)
 create mode 100644 package/efibootmgr/0001-Allow-build-with-uClibc.patch
 create mode 100644 package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
 create mode 100644 package/efivar/0002-Allow-build-with-uClibc.patch

-- 
2.10.2
