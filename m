From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Apr 2011 17:18:59 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/more-qt-fixes
Message-ID: <cover.1301843856.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Changes since the previous version:

 * Pass MAKEFLAGS down to Qt ./configure script, in addition to the
   -j$(BR2_JLEVEL) flag.

 * Test if the usr/lib/qt/plugins exists in STAGING_DIR before copying
   its contents to the TARGET_DIR. It is a bit pedantic as the current
   version of Qt, with just QtCore and no other libraries or plugins
   installs one plugin, but it may not be the case in future versions
   of Qt.

The following changes since commit 4bc1041db6ce805a8d96f653e50ce06eb6849d4b:

  lighttpd: fix build without webdav support (2011-04-02 10:24:59 +0200)

are available in the git repository at:
  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/more-qt-fixes

Thomas Petazzoni (2):
      qt: fix plugin installation and change plugin path
      qt: speed up qmake build

 package/qt/qt-4.7.2-configure.patch |   48 +++++++++++++++++++++++++++++++++++
 package/qt/qt.mk                    |   17 +++++-------
 2 files changed, 55 insertions(+), 10 deletions(-)
 create mode 100644 package/qt/qt-4.7.2-configure.patch

Thanks,
-- 
Thomas Petazzoni
