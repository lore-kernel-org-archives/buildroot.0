From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 23 Dec 2018 17:04:46 +0200
Subject: [Buildroot] [PATCH 0/2] Add gettext-tiny package
Message-ID: <20181223150448.21980-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add lightweight alternative for the GNU gettext package - gettext-tiny.
The sources are used from sabotage-linux project. Some files were copied
from the original gettext like po/* and gettextize files.

The original gettext package is renamed to gettext-gnu because now gettext is
a virtual package and gettext-gnu and gettext-tiny became as gettext providers.

Vadim Kochan (2):
  package/gettext: Turn into virtual package
  package/gettext-tiny: Add new package

 DEVELOPERS                                         |    3 +
 .../0001-error_print_progname.patch                |    0
 .../0002-Update-after-gnulib-changed.patch         |    0
 .../gettext.hash => gettext-gnu/gettext-gnu.hash}  |    0
 package/gettext-gnu/gettext-gnu.mk                 |  103 ++
 ...-format-not-a-string-literal-error-for-gc.patch |   51 +
 ...l-Use-gettext-wrappers-if-NLS-is-disabled.patch |   26 +
 package/gettext-tiny/files/ABOUT-NLS               | 1379 ++++++++++++++++++++
 package/gettext-tiny/files/gettextize              | 1346 +++++++++++++++++++
 package/gettext-tiny/files/po/Makefile.in.in       |  483 +++++++
 package/gettext-tiny/files/po/Makevars.template    |   78 ++
 package/gettext-tiny/files/po/Rules-quot           |   58 +
 package/gettext-tiny/files/po/boldquot.sed         |   10 +
 package/gettext-tiny/files/po/en at boldquot.header   |   25 +
 package/gettext-tiny/files/po/en at quot.header       |   22 +
 package/gettext-tiny/files/po/insert-header.sin    |   23 +
 package/gettext-tiny/files/po/quot.sed             |    6 +
 package/gettext-tiny/files/po/remove-potcdate.sin  |   19 +
 package/gettext-tiny/gettext-tiny.hash             |    2 +
 package/gettext-tiny/gettext-tiny.mk               |   84 ++
 package/gettext/Config.in                          |   44 +-
 package/gettext/gettext.mk                         |   96 +-
 22 files changed, 3758 insertions(+), 100 deletions(-)
 rename package/{gettext => gettext-gnu}/0001-error_print_progname.patch (100%)
 rename package/{gettext => gettext-gnu}/0002-Update-after-gnulib-changed.patch (100%)
 rename package/{gettext/gettext.hash => gettext-gnu/gettext-gnu.hash} (100%)
 create mode 100644 package/gettext-gnu/gettext-gnu.mk
 create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
 create mode 100644 package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
 create mode 100644 package/gettext-tiny/files/ABOUT-NLS
 create mode 100644 package/gettext-tiny/files/gettextize
 create mode 100644 package/gettext-tiny/files/po/Makefile.in.in
 create mode 100644 package/gettext-tiny/files/po/Makevars.template
 create mode 100644 package/gettext-tiny/files/po/Rules-quot
 create mode 100644 package/gettext-tiny/files/po/boldquot.sed
 create mode 100644 package/gettext-tiny/files/po/en at boldquot.header
 create mode 100644 package/gettext-tiny/files/po/en at quot.header
 create mode 100644 package/gettext-tiny/files/po/insert-header.sin
 create mode 100644 package/gettext-tiny/files/po/quot.sed
 create mode 100644 package/gettext-tiny/files/po/remove-potcdate.sin
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk

-- 
2.14.1
