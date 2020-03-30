From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 30 Mar 2020 19:22:57 +0200
Subject: [Buildroot] [PATCH v2 0/4] Add nanopi_neo4 board support
Message-ID: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As nanopi_neo4 was dropped due to the fact that AFT 32 bit oolchain was not 
implemented. Recently such package was added so revert neo4 config drop +
add AFT toolchain option. Also bump kernel to 5.4.

Marek Belisko (4):
  Revert "configs/nanopi_neo4: remove defconfig"
  nanpi_neo4_config: Enable
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN option
  nanopi_neo4_defconfig: Bump kernel to 5.4
  nanopi_neo4_defconfig: Bump rootfs size to 70M

 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ++++++++++++
 board/friendlyarm/nanopi-neo4/post-build.sh |  9 +++++
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 +++++++++++++++++++++++++++
 configs/nanopi_neo4_defconfig               | 56 +++++++++++++++++++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo4/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo4/readme.txt
 create mode 100644 configs/nanopi_neo4_defconfig

-- 
2.7.4
