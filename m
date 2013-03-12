From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:58:38 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-master/armadeus/new-pkgs
Message-ID: <cover.1363063832.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!


Here is the 2nd round of package integration from Armadeus [1,2].

This series does not include any new packages compared to the 1st post.

So, there still some other packages to come later [3]...

Note that:
* openobex: still use the 1.5 release to not break ussp-push.
  openobex can be updated to version 1.6 once integrated in BR, then
  ussp-push fixed to linked against it.
* urg: bump to version 0.8.18 from the original patch (which integrate
  the 0.8.11 release).


[1] www.armadeus.org
[2] git://armadeus.git.sourceforge.net/gitroot/armadeus/armadeus
[3] http://www.armadeus.com/wiki/index.php?title=Buildroot_Mainline_integration


Changes v1 -> v2:
  - Mostly dependency and license fixes
  - Remove qwt patch (which is already integrated)


The following changes since commit 1ca9e06f1c9a5ef12feb63711a48379c0eae7e42:

  package/tzdata: new package (2013-03-10 23:37:04 +0100)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-master/armadeus/new-pkgs

for you to fetch changes up to 2e13931db1a39313732a16c48f923eb4445dc3d3:

  libcanfestival: new package (2013-03-12 05:30:02 +0100)

----------------------------------------------------------------
Samuel Martin (5):
      openobex: new package
      ussp-push: new package
      urg: new package
      flite: new package
      libcanfestival: new package

 package/Config.in                                  |   4 +
 package/libcanfestival/Config.in                   |  90 +++
 .../libcanfestival-allow-to-set-DESTDIR.patch      | 717 +++++++++++++++++++++
 package/libcanfestival/libcanfestival.mk           |  43 ++
 package/multimedia/Config.in                       |   1 +
 package/multimedia/flite/Config.in                 |  15 +
 package/multimedia/flite/flite.mk                  |  58 ++
 package/openobex/Config.in                         |  45 ++
 ...penobex-libusb_check_when_cross-compiling.patch |  18 +
 .../openobex-replace_deprecated_functions.patch    |  30 +
 package/openobex/openobex.mk                       |  38 ++
 package/urg/Config.in                              |  13 +
 package/urg/urg.mk                                 |  27 +
 package/ussp-push/Config.in                        |  18 +
 .../ussp-push-fix-build-against-bluez-4.patch      |  15 +
 package/ussp-push/ussp-push.mk                     |  14 +
 16 files changed, 1146 insertions(+)
 create mode 100644 package/libcanfestival/Config.in
 create mode 100644 package/libcanfestival/libcanfestival-allow-to-set-DESTDIR.patch
 create mode 100644 package/libcanfestival/libcanfestival.mk
 create mode 100644 package/multimedia/flite/Config.in
 create mode 100644 package/multimedia/flite/flite.mk
 create mode 100644 package/openobex/Config.in
 create mode 100644 package/openobex/openobex-libusb_check_when_cross-compiling.patch
 create mode 100644 package/openobex/openobex-replace_deprecated_functions.patch
 create mode 100644 package/openobex/openobex.mk
 create mode 100644 package/urg/Config.in
 create mode 100644 package/urg/urg.mk
 create mode 100644 package/ussp-push/Config.in
 create mode 100644 package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
 create mode 100644 package/ussp-push/ussp-push.mk

Yours,
Samuel

--
