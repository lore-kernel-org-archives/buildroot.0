From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  5 Feb 2019 21:41:48 +0100
Subject: [Buildroot] [PATCH v2 0/4] WPE WebKit
Message-ID: <20190205204152.10376-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another port of WebKit (https://wpewebkit.org/), a project started in 2018.

v1 -> v2
  - wpewebkit : use WPEWEBKIT_ARCH_SUPPORTS variables (duplicated from webkitgtk)
  - cog : use release 0.2.0
  - cog : add dbus as mandatory dependency
  - cog : use the default setting of COG_DBUS_SYSTEM_BUS

rfc -> v1
  - full refactor after Adrian's review
  - libwpe : version 1.0.0 (stable) instead of 1.1.0 (instable)
  - wbebackend-fdo : version 1.0.0 (stable) instead of 1.1.0 (instable)
  - add cog, a WPE WebKit launcher

Francois Perrad (4):
  libwpe: new package
  wpebackend-fdo: new package
  wpewebkit: new package
  cog: new package

 DEVELOPERS                                 |   8 ++
 package/Config.in                          |   4 +
 package/cog/Config.in                      |  21 ++++
 package/cog/cog.hash                       |   5 +
 package/cog/cog.mk                         |  17 +++
 package/libwpe/Config.in                   |  13 +++
 package/libwpe/libwpe.hash                 |   7 ++
 package/libwpe/libwpe.mk                   |  22 ++++
 package/wpebackend-fdo/Config.in           |  19 ++++
 package/wpebackend-fdo/wpebackend-fdo.hash |   7 ++
 package/wpebackend-fdo/wpebackend-fdo.mk   |  15 +++
 package/wpewebkit/Config.in                | 114 +++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash           |   8 ++
 package/wpewebkit/wpewebkit.mk             |  61 +++++++++++
 14 files changed, 321 insertions(+)
 create mode 100644 package/cog/Config.in
 create mode 100644 package/cog/cog.hash
 create mode 100644 package/cog/cog.mk
 create mode 100644 package/libwpe/Config.in
 create mode 100644 package/libwpe/libwpe.hash
 create mode 100644 package/libwpe/libwpe.mk
 create mode 100644 package/wpebackend-fdo/Config.in
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk
 create mode 100644 package/wpewebkit/Config.in
 create mode 100644 package/wpewebkit/wpewebkit.hash
 create mode 100644 package/wpewebkit/wpewebkit.mk

-- 
2.17.1
