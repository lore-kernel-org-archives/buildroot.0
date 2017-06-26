From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Jun 2017 15:21:41 +0200
Subject: [Buildroot] [PATCH 0/4] sigrok: version bumps
Message-ID: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series contains version bumps for the sigrok suite. The API of
libsigrok has been changed in this release and all frontends must be
upgraded too.

Bartosz Golaszewski (4):
  libsigrok: bump version to 0.5.0
  libsigrokdecode: bump version to 0.5.0
  sigrok-cli: bump version to 0.7.0
  pulseview: bump version to 0.4.0

 ...01-beaglelogic.h-fix-build-with-musl-libc.patch |  36 -------
 package/libsigrok/libsigrok.hash                   |   2 +-
 package/libsigrok/libsigrok.mk                     |   2 +-
 package/libsigrokdecode/libsigrokdecode.hash       |   2 +-
 package/libsigrokdecode/libsigrokdecode.mk         |   2 +-
 package/pulseview/0001-musl.patch                  |  54 ----------
 ...heck-for-explicit-linking-against-libatom.patch | 117 ---------------------
 ...txt-Avoid-fext-numeric-literals-not-suppo.patch |  28 -----
 package/pulseview/Config.in                        |   1 +
 package/pulseview/pulseview.hash                   |   3 +-
 package/pulseview/pulseview.mk                     |   4 +-
 package/sigrok-cli/sigrok-cli.hash                 |   2 +-
 package/sigrok-cli/sigrok-cli.mk                   |   2 +-
 13 files changed, 9 insertions(+), 246 deletions(-)
 delete mode 100644 package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
 delete mode 100644 package/pulseview/0001-musl.patch
 delete mode 100644 package/pulseview/0002-cmake-add-check-for-explicit-linking-against-libatom.patch
 delete mode 100644 package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch

-- 
2.9.3
