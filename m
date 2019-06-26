From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 14:58:53 +0200
Subject: [Buildroot] [PATCH v2 0/7] Microblaze clean up
Message-ID: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series works around various Gcc bugs and re-enables Microblaze
packages depending on these work-arounds. It also fixes some little build
bugs considered as Gcc bugs and some package has been re-enabled because
its build failure was due to very very old toolchains.

Note that this patchset is not splitted into smaller patchset because of
packages dependencies and it would have been more difficult to understand
the sequence of all the patches.

Giulio Benetti (7):
  package/libnss: use correct CFLAGS and LDFLAGS
  package/libnss: re-enable package on microblaze
  package/ecryptfs-utils: remove libnss gcc bug dependency
  package/boost: remove gcc bug 85180 dependency for boost-fiber option
  package/prboom: avoid using hardcoded optimization flags
  package/prboom: work around gcc bug 85180
  package/qt5/qt5webengine: re-enable building if BUG_85682=y on Qt5
    Latest

 package/boost/Config.in                       |  5 +--
 package/ecryptfs-utils/Config.in              |  4 --
 ...move-Wmaybe-uninitialized-warning-in.patch | 42 +++++++++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-h.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-l.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-p.patch | 26 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-p.patch | 28 +++++++++++++
 package/libnss/Config.in                      |  4 --
 package/libnss/libnss.mk                      | 16 ++++++-
 ...move-predefined-O2-optimization-flag.patch | 21 ++++++++++
 package/prboom/prboom.mk                      |  9 ++++
 package/qt5/qt5webengine/Config.in            |  6 ---
 14 files changed, 250 insertions(+), 19 deletions(-)
 create mode 100644 package/libnss/0003-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in.patch
 create mode 100644 package/libnss/0004-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
 create mode 100644 package/libnss/0005-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
 create mode 100644 package/libnss/0006-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
 create mode 100644 package/libnss/0007-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
 create mode 100644 package/libnss/0008-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
 create mode 100644 package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
 create mode 100644 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch

-- 
2.17.1
