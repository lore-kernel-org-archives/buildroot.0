From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Aug 2016 22:44:33 +0200
Subject: [Buildroot] [PATCH 0/3] Fix our defconfigs (branch
	yem/fix-defconfigs)
Message-ID: <cover.1470602446.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes most build failures for our defconfigs:

  - patch 1 fixes kb9202 after we changed the way we handled the kernel
    headers selection to default to the built kernel;

  - patch 2 fixes the build of uboot for the snps defconfigs, as it
    needs dtc;

  - patch 3 fixes all our thumb2-only altera and atmel defconfigs, by
    reverting an upstream commit that broke the build.

There are a two other build failures for demo-like defconfigs. Those are
not yet fixed.

Series meant to fix failures seen with Travis:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/builds/150333638

Regards,
Yann E. MORIN.


The following changes since commit 023bba7797132713c9e656cd45846596a2b16bf5

  package/hidapi: depends on NPTL threads (2016-08-06 23:59:38 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to f410a42ac202f8266ff8f4ace32f97e5c68ac0fe

  pcakage/uclibc: fix build on thumb2-only arm cpus (2016-08-07 22:39:30 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      defconfigs/kb9202: fix headers version
      defconfigs/snps_axs_10*: uboot needs dtc
      pcakage/uclibc: fix build on thumb2-only arm cpus

 configs/kb9202_defconfig                           |   3 +-
 configs/snps_axs101_defconfig                      |   1 +
 configs/snps_axs103_defconfig                      |   1 +
 ...arm-cleanup-redundant-macros-for-syscalls.patch | 150 +++++++++++++++++++++
 4 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
