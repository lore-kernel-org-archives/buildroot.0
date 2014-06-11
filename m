From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 19:41:45 +0200
Subject: [Buildroot] [PATCH v2 0/3] WIP: package/eudev: Split libudev and
	daemon
Message-ID: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

in order to support a growing number of packages[1] depending on libudev,
even when /dev is not managed by systemd/eudev, it is necessary to
provide libudev as a stand-alone solution for systems which have
BR2_ROOTFS_DEVICE_CREATION_STATIC=y.

This patch series
- bumps eudev to 1.7
- integrates my older libudev package into eudev
- fixes mesa3d build error

Still to be discussed:
- should we keep BR2_PACKAGE_HAS_UDEV which now means libudev, and
- introduce BR2_PACKAGE_HAS_UDEV_DAEMON for packages needing the daemon, or

- introduce BR2_PACKAGE_HAS_LIBUDEV and switch many packages over to this option

Regards, Bernd

[1] Inspired by mesa3d: https://bugs.freedesktop.org/show_bug.cgi?id=75212#c6

Bernd Kuhls (3):
  package/eudev: Bump version to 1.7
  package/eudev: Split libudev and daemon
  package/mesa3d: depend on udev

-- 
1.7.10.4
