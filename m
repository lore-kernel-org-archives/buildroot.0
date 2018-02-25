From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:14 +0100
Subject: [Buildroot] [PATCH 0/6] arch/ar: add cortex-m7, and cortex-M FPUs
Message-ID: <cover.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series adds support for cortex-m7, and support for using the
FPUs present in some cortex-M cpu, like the FPv4 on cortex-m4, or the
FPv5 on cortex-m7.

It has not been runtime-tested by lack of hardware, but it can at least
build a toolchain and busybox [0], which is basically all that we can
expect to run on such CPUs anyway.

[0] https://gitlab.com/ymorin/buildroot-ci/pipelines/17864347/builds

Regards,
Yann E. MORIN.


The following changes since commit 382fe9f9261812682eab2d35e47aa94dc554380e

  linux: allow both in-tree and custom dts files (2018-02-25 17:19:11 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to e3cc02b38674ecfdb83d9adc32cf504c3b85cd1f

  arch/arm: cortex-m7 may have a FPv5 FPU (2018-02-25 19:04:09 +0100)


----------------------------------------------------------------
Yann E. MORIN (6):
      arch/arm: add cortex-m7 core
      arch/arm: introduce generic FPU internal option
      arch/arm: add option for FPv4 FPU
      arch/arm: add options for FPv5 FPU
      arch/arm: cortex-m4 may have an FPv4 FPU
      arch/arm: cortex-m7 may have a FPv5 FPU

 arch/Config.in.arm | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
