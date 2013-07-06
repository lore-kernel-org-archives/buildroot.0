From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:39 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-no-arm-oabi
Message-ID: <cover.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series finally gets rid of the legacy ARM OABI support.
The series is split in four steps:

  - Patch 2 makes OABI un-selectable by entirely removing the
    symbol from the Kconfig options
  - Patches 3-5 remove all code called when OABI is set
  - Patches 6-11 remove all code conditional on EABI, and make
    it unconditional, since EABI is all we support now
  - Patch 11 finally gets rid of the EABI symbol altogether.

As a bonus, patch 1 is a trivial indentation fix (use tabs, not spaces).

As discussed with Thomas on IRC, this will most probably come
clashing with his own hard-float related series.

Regards,
Yann E. MORIN.


The following changes since commit 7cbebbc48c26ddfb18da23ffba356744a5592ea6:

  Add 'bc' in the mandatory dependencies (2013-07-05 15:30:43 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-no-arm-oabi

for you to fetch changes up to 95403113defe7a6c8f713a3e2ba0c85ca1e6df3b:

  arch/arm: remove ARM_EABI symbol since there's no users left (2013-07-06 22:40:11 +0200)

----------------------------------------------------------------
Yann E. MORIN (12):
      package/uclibc: fix indentation (use tabs, not spaces)
      arch/arm: remove OABI option
      arch/arm: remove setting gcc's apcs-gnu ABI (aka OABI)
      package/uclibc: ARM OABI is no longer supported
      toolchain/helpers: ARM OABI is no longer supported
      arch/arm: drop 'if EABI' since it's always true now
      linux: remove EABI conditional
      pkg-infra: dump all ARM OABI references when setting ABI
      toolchain/helpers: only check for an EABI toolchain
      package/owl-linux: drop check for EABI
      package/uClibc: drop ARM EABI conditions
      arch/arm: remove ARM_EABI symbol since there's no users left

 arch/Config.in.arm          | 25 +------------------------
 linux/linux.mk              |  5 ++---
 package/Makefile.in         |  9 ++++-----
 package/owl-linux/Config.in |  5 ++---
 package/uclibc/Config.in    | 11 ++---------
 package/uclibc/uclibc.mk    |  4 +---
 toolchain/helpers.mk        | 13 ++-----------
 7 files changed, 14 insertions(+), 58 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
