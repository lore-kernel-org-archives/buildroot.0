From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:47 -0300
Subject: [Buildroot] [PATCH 00/13] Misc version bumps
Message-ID: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many version bumps.
Of notable importance is musepack which contains a security fix.

Gustavo Zacarias (13):
  netsnmp: bump to version 5.6.1.1
  libreplaygain: bump to r475
  libcuefile: bump to r475
  libsndfile: bump to version 1.0.25
  libcurl: bump to version 7.21.7
  libsamplerate: bump to version 0.1.8
  libao: bump to version 1.1.0
  sqlite: bump to version 3.7.7.1
  musepack: bump to r475
  mpd: bump to version 0.16.3
  squid: bump to version 3.1.15
  busybox: add 1.19.x branch and remove deprecated
  dnsmasq: bump to version 2.58

 package/busybox/Config.in                          |   13 +-
 .../busybox-1.19.0/busybox-1.19.0-cttyhack.patch   |   18 +
 .../busybox-1.19.0/busybox-1.19.0-find.patch       |   14 +
 .../busybox-1.19.0/busybox-1.19.0-less.patch       |   12 +
 .../busybox-1.19.0/busybox-1.19.0-sed.patch        |  237 +++++
 .../busybox-1.19.0/busybox-1.19.0-swap.patch       |   12 +
 .../busybox-1.19.0/busybox-1.19.0-top.patch        |   69 ++
 .../busybox-1.19.0/busybox-1.19.0-uncompress.patch |   50 +
 package/busybox/busybox-1.19.x.config              | 1013 ++++++++++++++++++++
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 package/libcurl/libcurl.mk                         |    3 +-
 package/multimedia/libao/libao.mk                  |    2 +-
 package/multimedia/libcuefile/libcuefile.mk        |    2 +-
 package/multimedia/libreplaygain/libreplaygain.mk  |    2 +-
 package/multimedia/libsamplerate/libsamplerate.mk  |    2 +-
 package/multimedia/libsndfile/libsndfile.mk        |    2 +-
 .../mpd/mpd-0.16.2-tremor-needs-ogg_common.patch   |   20 -
 package/multimedia/mpd/mpd.mk                      |    2 +-
 package/multimedia/musepack/musepack-shared.patch  |   24 +
 package/multimedia/musepack/musepack.mk            |    5 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/squid/squid-cross-compile.patch            |   65 --
 package/squid/squid.mk                             |    5 +-
 24 files changed, 1470 insertions(+), 108 deletions(-)
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-cttyhack.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-find.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-less.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-sed.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-swap.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-top.patch
 create mode 100644 package/busybox/busybox-1.19.0/busybox-1.19.0-uncompress.patch
 create mode 100644 package/busybox/busybox-1.19.x.config
 delete mode 100644 package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch
 create mode 100644 package/multimedia/musepack/musepack-shared.patch
 delete mode 100644 package/squid/squid-cross-compile.patch

-- 
1.7.3.4
