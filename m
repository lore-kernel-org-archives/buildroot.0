From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:09 +0000
Subject: [Buildroot] [PATCH 00/32] systemd feature selection
Message-ID: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've made improvements to the systemd package to allow more fine-grained
selection of tools and services. With these additions, it's possible to reduce
the install footprint by about 60% (~12 MB).

Thanks,
Gabe

Gabe Evans (32):
  package/lz4: bump version to r131
  package/systemd: remove BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
  package/systemd: add --enable/disable-bzip2
  package/systemd: add --enable/disable-lz4
  package/systemd: add --enable/disable-zlib
  package/systemd: add --enable/disable-libcurl
  package/systemd: explicitly --enable/disable-microhttpd
  package/systemd: remove networkd depends from timesyncd
  package/systemd: add support for specifying NTP servers
  package/systemd: add optional support for binfmt
  package/systemd: add optional support for vconsole
  package/systemd: add optional support for bootchart
  package/systemd: add optional support for quotacheck
  package/systemd: add optional support for tmpfiles
  package/systemd: add optional support for sysusers
  package/systemd: add optional support for firstboot
  package/systemd: add optional support for random-seed
  package/systemd: add optional support for backlight
  package/systemd: add optional support for rfkill
  package/systemd: add optional support for logind
  package/systemd: add optional support for machined
  package/systemd: add optional support for importd
  package/systemd: add optional support for hostnamed
  package/systemd: add optional support for timedated
  package/systemd: add optional support for localed
  package/systemd: add optional support for coredump
  package/systemd: add optional support for polkit
  package/systemd: add optional support for hwdb
  package/systemd: add optional support for hibernation
  package/systemd: use 'menuconfig'
  package/systemd: only create 'systemd-journal' group
  package/systemd: remove unnecessary make opts

 package/lz4/lz4.hash       |   2 +
 package/lz4/lz4.mk         |  19 ++--
 package/systemd/Config.in  | 210 ++++++++++++++++++++++++++++++++++++++++++---
 package/systemd/systemd.mk | 180 +++++++++++++++++++++++++++++++++++---
 4 files changed, 379 insertions(+), 32 deletions(-)
 create mode 100644 package/lz4/lz4.hash

-- 
1.9.1
