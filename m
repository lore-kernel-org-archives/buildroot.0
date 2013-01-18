From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 18 Jan 2013 23:08:42 +0100
Subject: [Buildroot] [PATCH v3 0/5] Add support for udisks package.
Message-ID: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes from v2 (thanks Thomas Petazzoni for comments):
- sg3utils: fix license information
- polkit: fix license info + add wchar dependency
- libatasmart: fix description + license + comment on udev dependency
- drop patch which add installation of lvm2 app library. When choose
build only lvm2 (no dev mapper) then everything is build (lvm utils + dev mapper + app lib)
- udisks: fixe license + add lvm2 dependency

Changes from v1:
- fix various problems in sg3_utils and polkit packages (Thomas Petazzoni)

This patches add support for udisks and dependencies + fixes.

Patches for sg3_utils, polkit and udisks was done by
Thomas Petazzoni and overtaken from
http://free-electrons.com/~thomas/pub/udisks-buildroot/.
They were fixed to work with latest buildroot.

lvm2 fix:
- correctly install devmapper.pc to staging/target

Marek Belisko (5):
  sg3_utils: new package
  polkit: new package
  libatasmart: new package.
  lvm2: Install devmapper.pc to staging/target pkgconfig directory.
  udisks: new package

 package/Config.in                  |    4 ++++
 package/libatasmart/Config.in      |   11 ++++++++++
 package/libatasmart/libatasmart.mk |   18 +++++++++++++++++
 package/lvm2/lvm2.mk               |    2 +-
 package/polkit/Config.in           |   11 ++++++++++
 package/polkit/polkit.mk           |   20 ++++++++++++++++++
 package/sg3_utils/Config.in        |   16 +++++++++++++++
 package/sg3_utils/sg3_utils.mk     |   39 ++++++++++++++++++++++++++++++++++++
 package/udisks/Config.in           |   32 +++++++++++++++++++++++++++++
 package/udisks/udisks.mk           |   28 ++++++++++++++++++++++++++
 10 files changed, 180 insertions(+), 1 deletion(-)
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
