From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 22 Mar 2012 10:27:15 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.05/systemd
Message-ID: <cover.1332408273.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

This is the updated version of the previous patchset concerning systemd to take
into account the comments made mostly by Arnout.

The following changes since commit 5b84ec26c8981c6ab0e119b455e807152ded449a:

  libconfig: bump to 1.4.8 and cleanup (2012-03-21 23:08:25 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.05/systemd

Maxime Ripard (5):
      Add the systemd package
      Enable cgroups in Linux if we use systemd
      Rework of the init system
      Fix installation for the lighttpd package
      Add systemd unit for lighttpd

 linux/linux.mk                                     |    2 +
 package/Config.in                                  |    1 +
 package/Makefile.package.in                        |    8 +++
 package/dbus/dbus.mk                               |    4 +
 .../lighttpd-1.4.30-Fix-default-config-file.patch  |   64 ++++++++++++++++++++
 package/lighttpd/lighttpd.mk                       |   43 +++++++++++++
 package/lighttpd/lighttpd.service                  |   10 +++
 package/systemd/Config.in                          |   19 ++++++
 package/systemd/systemd-37-fix-getty-unit.patch    |   26 ++++++++
 package/systemd/systemd.mk                         |   62 +++++++++++++++++++
 package/sysvinit/Config.in                         |    1 +
 package/udev/udev.mk                               |    4 +
 target/generic/Config.in                           |   28 +++++++++
 13 files changed, 272 insertions(+), 0 deletions(-)
 create mode 100644 package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
 create mode 100644 package/lighttpd/lighttpd.service
 create mode 100644 package/systemd/Config.in
 create mode 100644 package/systemd/systemd-37-fix-getty-unit.patch
 create mode 100644 package/systemd/systemd.mk

Thanks,
-- 
Maxime Ripard
