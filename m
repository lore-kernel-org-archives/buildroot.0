From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:37 +0100
Subject: [Buildroot] [PATCH 00/10] Misc fixes
Message-ID: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is a series of random packages fixes.

Yours,
Samuel


Samuel Martin (10):
  eigen: add C++ toolchain dependency
  transmission: add url in Config.in
  transmission: use <PKG>_INSTALL_INIT_SYSV infra instead of custom hook
  pkg-cmake.mk: build shared library when !BR2_PREFER_STATIC_LIB
  qt: add an option to install the test module
  opencv: fix qt selection when highgui is enable
  connman: add systemd unit file
  support: mkusers: add warning when using mkpasswd from the host system
  urg: make sdl support optional
  hostapd: fix static build failure

 package/connman/connman.mk           | 10 ++++++++--
 package/connman/connman.service      | 12 ++++++++++++
 package/eigen/Config.in              |  4 ++++
 package/hostapd/hostapd.mk           |  1 +
 package/opencv/Config.in             |  4 +++-
 package/pkg-cmake.mk                 |  1 +
 package/qt/Config.in                 |  7 +++++++
 package/qt/qt.mk                     |  3 +++
 package/transmission/Config.in       |  2 ++
 package/transmission/transmission.mk |  3 +--
 package/urg/Config.in                |  5 ++---
 package/urg/urg.mk                   | 10 +++++++---
 support/scripts/mkusers              | 17 +++++++++++++++++
 13 files changed, 68 insertions(+), 11 deletions(-)
 create mode 100644 package/connman/connman.service

--
1.8.5.3
