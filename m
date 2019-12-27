From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 15:43:21 +0100
Subject: [Buildroot] [PATCH 0/3] NSPR cleanup
Message-ID: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset makes libnspr available for every architecture, before
Xtensa and Arc architectures were not supported. By doing this we can then
remove additional check in Config.in files with
'depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT' that becomes useless.

Giulio Benetti (3):
  package/libnspr: allow building for Arc Architecture
  package/libnspr: enable building with xtensa
  package/libnspr: remove BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT

 package/ecryptfs-utils/Config.in              |  2 --
 ...6092_Add_support_for_building_xtensa.patch | 33 +++++++++++++++++++
 package/libnspr/Config.in                     |  8 -----
 package/libnss/Config.in                      |  2 --
 package/spidermonkey/Config.in                |  1 -
 5 files changed, 33 insertions(+), 13 deletions(-)
 create mode 100644 package/libnspr/0001-Bug_1606092_Add_support_for_building_xtensa.patch

-- 
2.20.1
