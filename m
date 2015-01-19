From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:00 +0200
Subject: [Buildroot] [PATCH 00/16] Different enhancements,
	primarily for systemd
Message-ID: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There are some enhancements, primarily targeted on better systemd
support, adding some little features to buildroot, and of course some
small fixes.

Please review these patches; if things will go fine, I have plans on
sending a little more enhancements here :)

Maxim Mikityanskiy (16):
  package/busybox: optional udhcpc script
  package: install bash-completion files only with bash
  package/dbus: fix machine-id when using systemd
  package/systemd: add missing dependencies
  package/systemd: apply locale settings in user shells
  package/dosfstools: add missing symlinks
  package/dropbear: install dropbear.service to correct dir
  package/e2fsprogs: make /sbin/fsck available
  package/minidlna: improve systemd support
  package/transmission: improve systemd support
  package/samba: use FHS dirs
  package/samba: add systemd support
  package/tar: add support for acl and xattr
  package/util-linux: add more tool select options
  package/vim: add default vimrc
  package/rng-tools: add systemd support for rngd

 package/busybox/Config.in                        |  5 ++
 package/busybox/busybox.mk                       | 15 +++--
 package/dbus/dbus.mk                             | 13 +++--
 package/dosfstools/dosfstools.mk                 | 13 +++++
 package/dropbear/dropbear.mk                     |  4 +-
 package/e2fsprogs/e2fsprogs.mk                   |  8 +++
 package/kmod/kmod.mk                             |  4 ++
 package/minidlna/minidlna.conf                   | 74 ++++++++++++++++++++++++
 package/minidlna/minidlna.mk                     | 37 ++++++++++++
 package/minidlna/minidlna.service                | 12 ++++
 package/minidlna/minidlna_sysctl.conf            |  1 +
 package/minidlna/minidlna_sysusers.conf          |  1 +
 package/minidlna/minidlna_tmpfiles.conf          |  3 +
 package/rng-tools/rng-tools.mk                   |  8 +++
 package/rng-tools/rngd-exit-code.patch           | 11 ++++
 package/rng-tools/rngd.service                   |  9 +++
 package/samba/S91smb                             |  5 +-
 package/samba/nmbd.service                       | 12 ++++
 package/samba/samba.mk                           | 33 +++++++++--
 package/samba/samba_tmpfiles.conf                |  4 ++
 package/samba/smbd.service                       | 12 ++++
 package/samba/winbindd.service                   | 12 ++++
 package/systemd/Config.in                        |  3 +
 package/systemd/locale.sh                        | 26 +++++++++
 package/systemd/systemd.mk                       | 15 +++++
 package/tar/tar.mk                               | 10 ++++
 package/transmission/transmission-daemon.service | 12 ++++
 package/transmission/transmission.mk             | 45 ++++++++++++++
 package/transmission/transmission_sysctl.conf    |  2 +
 package/transmission/transmission_sysusers.conf  |  1 +
 package/transmission/transmission_tmpfiles.conf  |  1 +
 package/util-linux/Config.in                     | 64 +++++++++++++++++++-
 package/util-linux/util-linux.mk                 | 24 +++++++-
 package/vim/vim.mk                               | 11 ++++
 package/vim/vimrc                                | 14 +++++
 35 files changed, 501 insertions(+), 23 deletions(-)
 create mode 100644 package/minidlna/minidlna.conf
 create mode 100644 package/minidlna/minidlna.service
 create mode 100644 package/minidlna/minidlna_sysctl.conf
 create mode 100644 package/minidlna/minidlna_sysusers.conf
 create mode 100644 package/minidlna/minidlna_tmpfiles.conf
 create mode 100644 package/rng-tools/rngd-exit-code.patch
 create mode 100644 package/rng-tools/rngd.service
 create mode 100644 package/samba/nmbd.service
 create mode 100644 package/samba/samba_tmpfiles.conf
 create mode 100644 package/samba/smbd.service
 create mode 100644 package/samba/winbindd.service
 create mode 100644 package/systemd/locale.sh
 create mode 100644 package/transmission/transmission-daemon.service
 create mode 100644 package/transmission/transmission_sysctl.conf
 create mode 100644 package/transmission/transmission_sysusers.conf
 create mode 100644 package/transmission/transmission_tmpfiles.conf
 create mode 100644 package/vim/vimrc

-- 
2.2.1
