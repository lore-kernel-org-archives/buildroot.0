From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Dec 2012 00:06:21 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2013.02/armadeus/new-pkgs
Message-ID: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the first round of package integration from Armadeus [1,2],

This just includes half a doxzen of new packages, nothing scary...
and more to come [3]... So, stay tuned! ;-)

Note that:
* openobex: still use the 1.5 release to not break ussp-push.
  openobex can be updated to version 1.6 once integrated in BR, then
  ussp-push fixed to linked against it.
* urg: bump to version 0.8.18 from the original patch (which integrate
  the 0.8.11 release).

Yours,

Samuel

[1] www.armadeus.org
[2] git://armadeus.git.sourceforge.net/gitroot/armadeus/armadeus
[3] http://www.armadeus.com/wiki/index.php?title=Buildroot_Mainline_integration

The following changes since commit 054f97e1f2de337ea0c788d766212a36d6d4e41c:

  pkg-infra: add <pkg>-extract and <pkg>-patch targets to OVERRIDE support (2012-12-06 17:13:57 -0800)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-2013.02/armadeus/new-pkgs

for you to fetch changes up to 810b52732660dfae986eb1cdc9cb6a878fd6bd2f:

  libcanfestival: new package


Samuel Martin (6):
  openobex: new package
  ussp-push: new package
  urg: new package
  flite: new package
  qwt: new package
  libcanfestival: new package

 package/Config.in                                  |   5 +
 package/libcanfestival/Config.in                   |  90 +++
 .../libcanfestival-allow-to-set-DESTDIR.patch      | 717 +++++++++++++++++++++
 package/libcanfestival/libcanfestival.mk           |  45 ++
 package/multimedia/Config.in                       |   1 +
 package/multimedia/flite/Config.in                 |  11 +
 package/multimedia/flite/flite.mk                  |  57 ++
 package/openobex/Config.in                         |  28 +
 ...penobex-libusb_check_when_cross-compiling.patch |  18 +
 .../openobex-replace_deprecated_functions.patch    |  30 +
 package/openobex/openobex.mk                       |  35 +
 package/qwt/Config.in                              |  17 +
 .../qwt/qwt-5.2.1-change-install-directories.patch |  23 +
 package/qwt/qwt-5.2.1-disable-designer.patch       |  17 +
 package/qwt/qwt.mk                                 |  74 +++
 package/urg/Config.in                              |   9 +
 package/urg/urg.mk                                 |  26 +
 package/ussp-push/Config.in                        |   9 +
 .../ussp-push-fix-build-against-bluez-4.patch      |  15 +
 package/ussp-push/ussp-push.mk                     |  13 +
 20 files changed, 1240 insertions(+)
 create mode 100644 package/libcanfestival/Config.in
 create mode 100644 package/libcanfestival/libcanfestival-allow-to-set-DESTDIR.patch
 create mode 100644 package/libcanfestival/libcanfestival.mk
 create mode 100644 package/multimedia/flite/Config.in
 create mode 100644 package/multimedia/flite/flite.mk
 create mode 100644 package/openobex/Config.in
 create mode 100644 package/openobex/openobex-libusb_check_when_cross-compiling.patch
 create mode 100644 package/openobex/openobex-replace_deprecated_functions.patch
 create mode 100644 package/openobex/openobex.mk
 create mode 100644 package/qwt/Config.in
 create mode 100644 package/qwt/qwt-5.2.1-change-install-directories.patch
 create mode 100644 package/qwt/qwt-5.2.1-disable-designer.patch
 create mode 100644 package/qwt/qwt.mk
 create mode 100644 package/urg/Config.in
 create mode 100644 package/urg/urg.mk
 create mode 100644 package/ussp-push/Config.in
 create mode 100644 package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
 create mode 100644 package/ussp-push/ussp-push.mk

--
1.8.0.1
