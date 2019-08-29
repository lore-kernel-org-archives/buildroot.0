From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 14:00:44 +0200
Subject: [Buildroot] [PATCH 0/7] Remove broken defconfigs
Message-ID: <20190829120051.22415-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series removes a number of defconfigs which currently fail
to build and have not been fixed. Since we're about to release
2019.08, we need to get rid of them.

 - ts4800 doesn't build because the kernel is too old to build with
   gcc 8.x. The original submitter has not replied to the several
   pings, including to the patch proposing to add him as a contact for
   this defconfig in our DEVELOPERS file.

 - all the other defconfigs do not build because ATF needs to build a
   piece of ARM32 bare-metal code, but since the system is ARM64,
   Buildroot only provides an ARM64 toolchain. The solution is to
   create a separate Buildroot package for an ARM32 bare-metal
   toolchain. This has been discussed on the list, but need some
   effort that does not fit before 2019.08 is released.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (7):
  configs/ts4800: remove defconfig
  boot/ts4800-mrboot: remove package
  configs/nanopc_t4: remove defconfig
  configs/nanopi_neo4: remove defconfig
  configs/nanopi_m4: remove defconfig
  configs/pine64_rockpro64: remove defconfig
  configs/radxa_rock_pi4: remove defconfig

 .gitlab-ci.yml                              |  6 ---
 Config.in.legacy                            |  8 +++
 DEVELOPERS                                  | 10 ----
 board/friendlyarm/nanopc-t4/extlinux.conf   |  4 --
 board/friendlyarm/nanopc-t4/genimage.cfg    | 22 ---------
 board/friendlyarm/nanopc-t4/post-build.sh   |  8 ---
 board/friendlyarm/nanopc-t4/readme.txt      | 49 -------------------
 board/friendlyarm/nanopi-m4/extlinux.conf   |  4 --
 board/friendlyarm/nanopi-m4/genimage.cfg    | 22 ---------
 board/friendlyarm/nanopi-m4/post-build.sh   |  8 ---
 board/friendlyarm/nanopi-m4/readme.txt      | 45 -----------------
 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 --
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ---------
 board/friendlyarm/nanopi-neo4/post-build.sh |  9 ----
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 --------------------
 board/pine64/rockpro64/extlinux.conf        |  4 --
 board/pine64/rockpro64/genimage.cfg         | 22 ---------
 board/pine64/rockpro64/post-build.sh        |  9 ----
 board/pine64/rockpro64/readme.txt           | 51 -------------------
 board/radxa/rock-pi4/extlinux.conf          |  4 --
 board/radxa/rock-pi4/genimage.cfg           | 22 ---------
 board/radxa/rock-pi4/post-build.sh          |  9 ----
 board/radxa/rock-pi4/readme.txt             | 51 -------------------
 board/technologic/ts4800/genimage.cfg       | 37 --------------
 board/technologic/ts4800/linux.fragment     |  3 --
 board/technologic/ts4800/post-image.sh      | 19 --------
 board/technologic/ts4800/readme.txt         | 50 -------------------
 boot/Config.in                              |  1 -
 boot/ts4800-mbrboot/Config.in               |  7 ---
 boot/ts4800-mbrboot/ts4800-mbrboot.hash     |  2 -
 boot/ts4800-mbrboot/ts4800-mbrboot.mk       | 21 --------
 configs/nanopc_t4_defconfig                 | 54 ---------------------
 configs/nanopi_m4_defconfig                 | 54 ---------------------
 configs/nanopi_neo4_defconfig               | 54 ---------------------
 configs/pine64_rockpro64_defconfig          | 54 ---------------------
 configs/radxa_rock_pi4_defconfig            | 54 ---------------------
 configs/ts4800_defconfig                    | 22 ---------
 37 files changed, 8 insertions(+), 870 deletions(-)
 delete mode 100644 board/friendlyarm/nanopc-t4/extlinux.conf
 delete mode 100644 board/friendlyarm/nanopc-t4/genimage.cfg
 delete mode 100755 board/friendlyarm/nanopc-t4/post-build.sh
 delete mode 100644 board/friendlyarm/nanopc-t4/readme.txt
 delete mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
 delete mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
 delete mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
 delete mode 100644 board/friendlyarm/nanopi-m4/readme.txt
 delete mode 100644 board/friendlyarm/nanopi-neo4/extlinux.conf
 delete mode 100644 board/friendlyarm/nanopi-neo4/genimage.cfg
 delete mode 100755 board/friendlyarm/nanopi-neo4/post-build.sh
 delete mode 100644 board/friendlyarm/nanopi-neo4/readme.txt
 delete mode 100644 board/pine64/rockpro64/extlinux.conf
 delete mode 100644 board/pine64/rockpro64/genimage.cfg
 delete mode 100755 board/pine64/rockpro64/post-build.sh
 delete mode 100644 board/pine64/rockpro64/readme.txt
 delete mode 100644 board/radxa/rock-pi4/extlinux.conf
 delete mode 100644 board/radxa/rock-pi4/genimage.cfg
 delete mode 100755 board/radxa/rock-pi4/post-build.sh
 delete mode 100644 board/radxa/rock-pi4/readme.txt
 delete mode 100644 board/technologic/ts4800/genimage.cfg
 delete mode 100644 board/technologic/ts4800/linux.fragment
 delete mode 100755 board/technologic/ts4800/post-image.sh
 delete mode 100644 board/technologic/ts4800/readme.txt
 delete mode 100644 boot/ts4800-mbrboot/Config.in
 delete mode 100644 boot/ts4800-mbrboot/ts4800-mbrboot.hash
 delete mode 100644 boot/ts4800-mbrboot/ts4800-mbrboot.mk
 delete mode 100644 configs/nanopc_t4_defconfig
 delete mode 100644 configs/nanopi_m4_defconfig
 delete mode 100644 configs/nanopi_neo4_defconfig
 delete mode 100644 configs/pine64_rockpro64_defconfig
 delete mode 100644 configs/radxa_rock_pi4_defconfig
 delete mode 100644 configs/ts4800_defconfig

-- 
2.21.0
