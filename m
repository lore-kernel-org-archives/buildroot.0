From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 Mar 2012 16:59:34 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/systemd
Message-ID: <cover.1332172636.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is an update of my previous RFC for integrating systemd into buildroot
I guess we have now reached a pretty good shape and we can begin to think
about merging these.

As always, any comments are welcome :)

Maxime

The following changes since commit 03ceab6d1611cf378ac9bec92134354bcdd963d1:

  Update for 2012.02 (2012-02-29 23:19:47 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.05/systemd

Maxime Ripard (6):
      Change the /etc/mtab symlink to use an absolute path
      Add the systemd package
      Enable cgroups in Linux if we use systemd
      Rework of the init system
      Fix installation for the lighttpd package
      Add systemd unit for lighttpd

 fs/skeleton/etc/mtab                  |    2 +-
 linux/linux.mk                        |    2 +
 package/Config.in                     |    1 +
 package/Makefile.package.in           |    8 +
 package/dbus/dbus.mk                  |    4 +
 package/lighttpd/lighttpd.conf        |  445 +++++++++++++++++++++++++++++++++
 package/lighttpd/lighttpd.mk          |   44 ++++
 package/lighttpd/lighttpd.service     |   10 +
 package/systemd/Config.in             |   20 ++
 package/systemd/getty at .service        |   39 +++
 package/systemd/serial-getty at .service |   31 +++
 package/systemd/systemd.mk            |   69 +++++
 package/sysvinit/Config.in            |    1 +
 package/udev/udev.mk                  |    4 +
 target/generic/Config.in              |   22 ++
 15 files changed, 701 insertions(+), 1 deletions(-)
 create mode 100644 package/lighttpd/lighttpd.conf
 create mode 100644 package/lighttpd/lighttpd.service
 create mode 100644 package/systemd/Config.in
 create mode 100644 package/systemd/getty at .service
 create mode 100644 package/systemd/serial-getty at .service
 create mode 100644 package/systemd/systemd.mk

Thanks,
-- 
Maxime Ripard
