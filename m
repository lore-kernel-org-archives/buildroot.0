From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:14 -0500
Subject: [Buildroot] [PATCH 00/10] Enable SELinux Support in Existing
	Packages
Message-ID: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the second set (of three) of patches to add SELinux support in 
buildroot. This patch set adds support for SELinux to existing packages
in buildroot. This patch set is meant to be a follow-up to Clayton 
Shotwell's submission of "SELinux Buildroot Additions".

In order to be able to test build existing packages with SELinux support, 
Clayton Shotwell's SELinux Buildroot Additions must first be applied.

Ryan Barnett (10):
  sysvinit: add support for SELinux
  sysvinit: install new cmds and fix inittab
  sysvinit: add patch for libcrypt
  util-linux: add suport for SELinux
  linux-pam: add support for SELinux
  openssh: add support for SELinux
  logrotate: add support for SELinux
  coreutils: add support for SELinux
  dbus: add support for SELinux
  busybox: add support for SELinux

 .../busybox/1.21.1/busybox-1.21.1-pkg-config.patch |   13 ++++++++++++
 package/coreutils/coreutils.mk                     |    8 +++++++
 package/dbus/dbus.mk                               |   10 ++++++++-
 ...t_log_acct_message_return_value_check_fix.patch |   16 +++++++++++++++
 ...inux-pam-sepermit-install-path-correction.patch |   11 ++++++++++
 package/linux-pam/linux-pam.mk                     |   14 +++++++++++++
 package/logrotate/logrotate.mk                     |   11 +++++++++-
 package/openssh/openssh.mk                         |   12 +++++++++++
 package/sysvinit/inittab                           |    1 +
 .../sysvinit-0001-libcrypt_check_fix.patch         |   13 ++++++++++++
 .../sysvinit-0002-selinux_flag_addition_fix.patch  |   15 ++++++++++++++
 package/sysvinit/sysvinit.mk                       |   12 ++++++++++-
 ...-linux-002-program-invocation-short-name.patch} |    0
 .../util-linux-003-libmount-libselinux-fix.patch   |   21 ++++++++++++++++++++
 package/util-linux/util-linux.mk                   |   21 ++++++++++++++++++++
 15 files changed, 175 insertions(+), 3 deletions(-)
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch
 create mode 100644 package/linux-pam/linux-pam-audit_log_acct_message_return_value_check_fix.patch
 create mode 100644 package/linux-pam/linux-pam-sepermit-install-path-correction.patch
 create mode 100644 package/sysvinit/sysvinit-0001-libcrypt_check_fix.patch
 create mode 100644 package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
 rename package/util-linux/{util-linux-003-program-invocation-short-name.patch => util-linux-002-program-invocation-short-name.patch} (100%)
 create mode 100644 package/util-linux/util-linux-003-libmount-libselinux-fix.patch
