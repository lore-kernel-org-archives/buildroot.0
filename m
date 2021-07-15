From: Joachim Wiberg <troglobit@gmail.com>
Date: Thu, 15 Jul 2021 10:34:32 +0200
Subject: [Buildroot] [PATCH v2 0/1] Add support for teamd/libteam
Message-ID: <20210715083433.865943-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

This patch adds support for teamd/libteam to Buildroot.  A few musl libc
related patches have been backported from project's master branch at

    https://github.com/jpirko/libteam/

Basic tests pass:

    $ ./utils/check-package package/libteam/*
    187 lines processed
    0 warnings generated

    $ ./utils/test-pkg -c libteam.config -p libteam
                        bootlin-armv5-uclibc [1/6]: OK
                         bootlin-armv7-glibc [2/6]: OK
                       bootlin-armv7m-uclibc [3/6]: SKIPPED
                         bootlin-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: OK
                                sourcery-arm [6/6]: OK
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed


Best regards
 /Joachim

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

---
v2: added missing libnl deps in libteam/Config.in (Yegor)

Joachim Wiberg (1):
  package/libteam: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-revert-disregard-current-state.patch | 51 +++++++++++++++++++
 .../0002-fix-build-on-openwrt-musl-libc.patch | 41 +++++++++++++++
 ...3-increase-wait-time-for-daemon-kill.patch | 37 ++++++++++++++
 package/libteam/Config.in                     | 26 ++++++++++
 package/libteam/libteam.hash                  |  3 ++
 package/libteam/libteam.mk                    | 22 ++++++++
 8 files changed, 182 insertions(+)
 create mode 100644 package/libteam/0001-revert-disregard-current-state.patch
 create mode 100644 package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
 create mode 100644 package/libteam/0003-increase-wait-time-for-daemon-kill.patch
 create mode 100644 package/libteam/Config.in
 create mode 100644 package/libteam/libteam.hash
 create mode 100644 package/libteam/libteam.mk

-- 
2.25.1
