From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 18 Jul 2014 15:01:59 +0200
Subject: [Buildroot] [Patch v2 0/2] systemd improvements
Message-ID: <1405688521-13818-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This series contains the following improvements for systemd:

 - bump version to 214.
 - enable network time synchronization if selected.

Changes v1 -> v2:

 - drop already applied patches ("fix systemd support in dbus",
   "fix kmod path in service files").
 - drop "revert getty service installation", as a more generic fix has been
   provided.
 - drop "add hook to fix /run, /var", as it would be better to rework the
   skeleton strategy instead.
 - update commit log for "bump version to 214".

Best regards,
ELB

Eric Le Bihan (2):
  systemd: bump to version 214
  systemd: install timesync service if selected

 ...ystemd-03-fix-am-path-libgcrypt-no-found.patch} |    0
 package/systemd/systemd-03-fix-no-gtk-doc.patch    |   23 -----------------
 package/systemd/systemd.mk                         |   27 +++++++++++---------
 3 files changed, 15 insertions(+), 35 deletions(-)
 rename package/systemd/{systemd-04-fix-am-path-libgcrypt-no-found.patch => systemd-03-fix-am-path-libgcrypt-no-found.patch} (100%)
 delete mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

-- 
1.7.10.4
