From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  4 Jul 2021 18:45:13 +0300
Subject: [Buildroot] [PATCH v2 0/2] stm32mp157c-dk2: bsp updates and fixes
Message-ID: <20210704154515.431798-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the second revision of the patch series that introduces several
updates and fixes for stm32mp157c-dk2:

- update BSP: bump Linux, U-Boot, TF-A versions (applied from v1)
- remove u-boot config fragment that disables watchdog
- fix U-Boot corruption

BSP update part of the series has been already applied. Besides, Thomas
noted that non-trusted configuration is no longer supported by vendor,
so this part has been dropped completely. Finally, a more simple and
straightforward approach has been implemented to fix U-Boot corruption.

Regards,
Sergey


v2:
- drop non-trusted configuration
- simplify U-Boot corruption fix: specify larger ssbl size


Sergey Matyukevich (2):
  board/stm32mp157c-dk2: fix U-Boot corruption on the first boot
  stm32mp157c_dk2: remove uboot config fragment

 board/stmicroelectronics/common/stm32mp157/genimage.cfg.template | 1 +
 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config   | 1 -
 configs/stm32mp157c_dk2_defconfig                                | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config

-- 
2.32.0
