From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 21 Dec 2012 22:44:58 +0100
Subject: [Buildroot] [PATCH 0/6] Add support for udisks package.
Message-ID: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches add support for udisks and dependencies + fixes.

Patches for sg3_utils, polkit and udisks was done by
Thomas Petazzoni and overtaken from
http://free-electrons.com/~thomas/pub/udisks-buildroot/.
They were fixed to work with latest buildroot.

udisks with lvm2 support (default n) have dependency on devmapper
and lvm2 application library. There are two fixes:

- correctly install devmapper.pc to staging/target
- add support for application library

Marek Belisko (6):
  sg3_utils: new package
  polkit: new package
  libatasmart: new package.
  lvm2: Install devmapper.pc to staging/target pkgconfig directory.
  lvm2: Compile and install application library.
  udisks: new package

 package/Config.in                  |    4 ++++
 package/libatasmart/Config.in      |   11 +++++++++++
 package/libatasmart/libatasmart.mk |   14 ++++++++++++++
 package/lvm2/Config.in             |    6 ++++++
 package/lvm2/lvm2.mk               |    8 +++++++-
 package/polkit/Config.in           |    8 ++++++++
 package/polkit/polkit.mk           |   18 ++++++++++++++++++
 package/sg3_utils/Config.in        |   15 +++++++++++++++
 package/sg3_utils/sg3_utils.mk     |   33 +++++++++++++++++++++++++++++++++
 package/udisks/Config.in           |   32 ++++++++++++++++++++++++++++++++
 package/udisks/udisks.mk           |   26 ++++++++++++++++++++++++++
 11 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 package/libatasmart/Config.in
 create mode 100644 package/libatasmart/libatasmart.mk
 create mode 100644 package/polkit/Config.in
 create mode 100644 package/polkit/polkit.mk
 create mode 100644 package/sg3_utils/Config.in
 create mode 100644 package/sg3_utils/sg3_utils.mk
 create mode 100644 package/udisks/Config.in
 create mode 100644 package/udisks/udisks.mk

-- 
1.7.10.4
