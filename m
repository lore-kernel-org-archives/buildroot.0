From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:49 +0200
Subject: [Buildroot] [PATCH 00/49 v2] package/asterisk: add a complete
	asterisk stack
Message-ID: <cover.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds a complete asterisk stack. Not much to state, except
for two special outliers.

First, asterisk is not trivial to package; a lot of details are
explained in the commit log of the first patch, that adds asterisk.
Updating asterisk takes a bit of time, and as soon as I got the
packaging sorted out, a new version was available... So I stuck with
the current version and will update once this has been applied upstream.

The second outlier are the dahdi-linux kernel modules. Again, the
commit log has all the nitty-gritty details.

The rest is just a bunch of new packages without much of an issue, or a
few new options to existing packages. Boring...

The whole series has been tested with test-pkg and this config fragment
(while yielded a few SKIPPED but no FAILED).
    BR2_PACKAGE_ALSA_UTILS=y
    BR2_PACKAGE_JACK2=y
    BR2_PACKAGE_LIBILBC=y
    BR2_PACKAGE_LIBVORBIS=y
    BR2_PACKAGE_OPUS=y
    BR2_PACKAGE_PORTAUDIO=y
    BR2_PACKAGE_SPANDSP=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_UNIXODBC=y
    BR2_PACKAGE_FREERADIUS_CLIENT=y
    BR2_PACKAGE_LIBPJSIP=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G711=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G722=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G7221=y
    BR2_PACKAGE_LIBPJSIP_CODEC_GSM=y
    BR2_PACKAGE_LIBPJSIP_CODEC_ILBC=y
    BR2_PACKAGE_LIBPJSIP_L16_CODEC=y
    BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX=y
    BR2_PACKAGE_NEON=y
    BR2_PACKAGE_OPENLDAP=y
    BR2_PACKAGE_COROSYNC=y
    BR2_PACKAGE_LIBCAP=y
    BR2_PACKAGE_LIBICAL=y
    BR2_PACKAGE_ASTERISK=y
    BR2_PACKAGE_BLUEZ_UTILS=y
    BR2_PACKAGE_NETSNMP=y

Additionally, this defconfig was built, to test the dahdi-linux build:
    BR2_arm=y
    BR2_arm1176jzf_s=y
    BR2_ARM_EABI=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.8"
    BR2_LINUX_KERNEL_DEFCONFIG="bcm2835"
    BR2_PACKAGE_ALSA_UTILS=y
    BR2_PACKAGE_JACK2=y
    BR2_PACKAGE_LIBILBC=y
    BR2_PACKAGE_LIBVORBIS=y
    BR2_PACKAGE_OPUS=y
    BR2_PACKAGE_PORTAUDIO=y
    BR2_PACKAGE_SPANDSP=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_UNIXODBC=y
    BR2_PACKAGE_LIBPRI=y
    BR2_PACKAGE_LIBSS7=y
    BR2_PACKAGE_FREERADIUS_CLIENT=y
    BR2_PACKAGE_LIBCURL=y
    BR2_PACKAGE_LIBPJSIP=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G711=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G722=y
    BR2_PACKAGE_LIBPJSIP_CODEC_G7221=y
    BR2_PACKAGE_LIBPJSIP_CODEC_GSM=y
    BR2_PACKAGE_LIBPJSIP_CODEC_ILBC=y
    BR2_PACKAGE_LIBPJSIP_L16_CODEC=y
    BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX=y
    BR2_PACKAGE_NEON=y
    BR2_PACKAGE_OPENLDAP=y
    BR2_PACKAGE_COROSYNC=y
    BR2_PACKAGE_LIBCAP=y
    BR2_PACKAGE_LIBICAL=y
    BR2_PACKAGE_BLUEZ_UTILS=y
    BR2_PACKAGE_NETSNMP=y
    # BR2_TARGET_ROOTFS_TAR is not set

---
Chamnges v1 -> v2:
  - too much changed, too long ago...


Regards,
Yann E. MORIN.


The following changes since commit 670a5ebe4698f99534bbcf209431f62af0ef3d51

  DEVELOPERS: add myself for modem-manager related packages (2017-09-09 23:10:07 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 52f266829b294499545ad7b38d32e884fa20d86d

  package/asterisk: add optional jack2 dependency (2017-09-09 23:37:58 +0200)


----------------------------------------------------------------
Yann E. MORIN (49):
      package/asterisk: new package
      package/asterisk: enable backtrace when available
      package/asterisk: add optional libgsm dependency
      package/asterisk: add optional zlib dependency
      package/asterisk: add optional support for SSL
      package/asterisk: add optional alsa-lib dependency
      package/asterisk: add optional curl dependency
      package/asterisk: add optional neon dependency
      package/asterisk: add optional libogg dependency
      package/asterisk: add optional bluez_utils dependency
      package/asterisk: add optional opus dependency
      package/asterisk: add optional speex dependency
      package/asterisk: add optional libvorbis dependency
      package/asterisk: add optional libilbc dependency
      package/asterisk: add optional portaudio dependency
      package/asterisk: add optional libical dependency
      package/asterisk: add optional openldap dependency
      package/asterisk: add optional freeradius-client dependency
      package/asterisk: add optional libsrtp dependency
      package/dahdi-linux: new package
      package/dahdi-tools: new package
      package/dahdi-tools: add USB support
      package/asterisk: add support for dahdi
      package/libss7: new package
      package/asterisk: add support for SS7
      package/libpri: new package
      package/asterisk: add support for PRI signalling
      package/spandsp: new package
      package/asterisk: add optional spandsp support
      package/libqb: new package
      package/corosync: new package
      package/corosync: add optional dbus support
      package/corosync: add optional snmp support
      package/asterisk: add optional corosync dependency
      package/libpjsip: add option to enable GSM codec
      package/asterisk: add optional netsnmp dependency
      package/libpjsip: add option to enable SPEEX codec
      package/libpjsip: add option to enable G.711 codec
      package/libpjsip: add option to enable G.722 codec
      package/libpjsip: add option to enable G.7221 codec
      package/libpjsip: add option to enable iLBC codec
      package/libpjsip: add option to enable L16 codec
      package/libpjsip: add optional portaudio support
      package/asterisk: add optional pjsip support
      package/asterisk: add optional libcap dependency
      package/asterisk: add optional iconv support
      package/asterisk: enable inotify when possible
      package/asterisk: add optional unixodbc dependency
      package/asterisk: add optional jack2 dependency

 package/Config.in                                  |   8 +
 ...-configure-do-not-configure-in-menuselect.patch |  58 ++++
 ...02-sounds-do-not-download-and-check-sha1s.patch |  52 +++
 .../0003-configure-fix-detection-of-libcrypt.patch |  43 +++
 ...n-cross-complation-assimne-eventfd-are-av.patch |  37 +++
 package/asterisk/Config.in                         |  25 ++
 package/asterisk/asterisk.hash                     |   9 +
 package/asterisk/asterisk.mk                       | 356 +++++++++++++++++++++
 package/corosync/Config.in                         |  20 ++
 package/corosync/corosync.hash                     |   2 +
 package/corosync/corosync.mk                       |  60 ++++
 package/dahdi-linux/Config.in                      |  19 ++
 package/dahdi-linux/dahdi-linux.hash               |  23 ++
 package/dahdi-linux/dahdi-linux.mk                 |  88 +++++
 package/dahdi-tools/0001-no-build-docs.patch       |  16 +
 package/dahdi-tools/0002-no-perl-manpages.patch    |  37 +++
 package/dahdi-tools/Config.in                      |  23 ++
 package/dahdi-tools/dahdi-tools.hash               |   4 +
 package/dahdi-tools/dahdi-tools.mk                 |  57 ++++
 package/libpjsip/Config.in                         |  31 ++
 package/libpjsip/libpjsip.mk                       |  55 +++-
 package/libpri/Config.in                           |  21 ++
 package/libpri/libpri.hash                         |   3 +
 package/libpri/libpri.mk                           |  52 +++
 ...fix-CLOCK_MONOTONIC-check-for-cross-compi.patch |  33 ++
 package/libqb/Config.in                            |  12 +
 package/libqb/libqb.hash                           |   2 +
 package/libqb/libqb.mk                             |  32 ++
 package/libss7/Config.in                           |  18 ++
 package/libss7/libss7.hash                         |   3 +
 package/libss7/libss7.mk                           |  55 ++++
 package/spandsp/0001-fix-msse4.x.patch             |  29 ++
 package/spandsp/Config.in                          |   9 +
 package/spandsp/spandsp.hash                       |   2 +
 package/spandsp/spandsp.mk                         |  28 ++
 35 files changed, 1314 insertions(+), 8 deletions(-)
 create mode 100644 package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
 create mode 100644 package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
 create mode 100644 package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
 create mode 100644 package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
 create mode 100644 package/asterisk/Config.in
 create mode 100644 package/asterisk/asterisk.hash
 create mode 100644 package/asterisk/asterisk.mk
 create mode 100644 package/corosync/Config.in
 create mode 100644 package/corosync/corosync.hash
 create mode 100644 package/corosync/corosync.mk
 create mode 100644 package/dahdi-linux/Config.in
 create mode 100644 package/dahdi-linux/dahdi-linux.hash
 create mode 100644 package/dahdi-linux/dahdi-linux.mk
 create mode 100644 package/dahdi-tools/0001-no-build-docs.patch
 create mode 100644 package/dahdi-tools/0002-no-perl-manpages.patch
 create mode 100644 package/dahdi-tools/Config.in
 create mode 100644 package/dahdi-tools/dahdi-tools.hash
 create mode 100644 package/dahdi-tools/dahdi-tools.mk
 create mode 100644 package/libpri/Config.in
 create mode 100644 package/libpri/libpri.hash
 create mode 100644 package/libpri/libpri.mk
 create mode 100644 package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk
 create mode 100644 package/libss7/Config.in
 create mode 100644 package/libss7/libss7.hash
 create mode 100644 package/libss7/libss7.mk
 create mode 100644 package/spandsp/0001-fix-msse4.x.patch
 create mode 100644 package/spandsp/Config.in
 create mode 100644 package/spandsp/spandsp.hash
 create mode 100644 package/spandsp/spandsp.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
