From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  4 Jun 2014 23:40:48 +0200
Subject: [Buildroot] [Patch v2 0/1] systemd: bump to v213
Message-ID: <1401918049-10503-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to v213.

This version features systemd-timesyncd, a SNTP daemon, which is useful on
machines without a RTC, like Raspberry Pi.

Note that in order to have systemd and this daemon to run properly, some
changes to /var, /run and /etc/resolv.conf in the target skeleton should be
made. This can be done in a post-build script (see
https://github.com/elebihan/buildroot-ext-elb/commit/557d5df324db4ec12d1b98bed7c1a899eb24bdb6
for an example).

Changes v1 -> v2:
 - patch configure.ac instead of configure.
 - use autoreconf (reported by ThomasP).
 - add new patch to fix gtk-doc deactivation.
 - add menu option to enable systemd-timesyncd if systemd-networkd is selected

Eric Le Bihan (1):
  systemd: bump to v213

 package/systemd/Config.in                          | 12 ++++
 ...uild-sys-revert-use-of-ln-relative-option.patch | 73 +++++++++++++---------
 package/systemd/systemd-03-fix-no-gtk-doc.patch    | 23 +++++++
 package/systemd/systemd.mk                         | 14 ++++-
 4 files changed, 92 insertions(+), 30 deletions(-)
 create mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

--
1.9.3
