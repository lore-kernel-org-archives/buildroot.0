From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu,  3 Jul 2014 18:57:33 +0200
Subject: [Buildroot] [PATCH 0/6] systemd improvements
Message-ID: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This series contains the following improvements for systemd:

 - fix systemd support in dbus.
 - fix kmod path in service files.
 - bump version to 214.
 - new hook to fix /var, /run.
 - enable network time synchronization if selected.

It takes into account the various suggestions from ThomasP and Arnout and
supersedes the previous bump patch.

Best regards,
ELB

Eric Le Bihan (6):
  dbus: enable systemd support
  systemd: revert getty service installation
  systemd: fix path for kmod in service files
  systemd: bump to version 214
  systemd: add hook to fix /run, /var
  systemd: install timesync service if selected

 package/dbus/Config.in                             |    1 +
 package/dbus/dbus.mk                               |    9 +++-
 ...ystemd-03-fix-am-path-libgcrypt-no-found.patch} |    0
 package/systemd/systemd-03-fix-no-gtk-doc.patch    |   23 --------
 package/systemd/systemd.mk                         |   56 +++++++++++++-------
 5 files changed, 46 insertions(+), 43 deletions(-)
 rename package/systemd/{systemd-04-fix-am-path-libgcrypt-no-found.patch => systemd-03-fix-am-path-libgcrypt-no-found.patch} (100%)
 delete mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

--
1.7.10.4
