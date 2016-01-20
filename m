From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 19:34:25 +0100
Subject: [Buildroot] [PATCH 0/3] toolchain: add possibility to use kernel
	version for linux-headers (branch yem/kenrel-headers)
Message-ID: <cover.1453314776.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series is a proposal to add the long-awaited-for possibility
to use the kernel version as the version for the linux-headers.

  - first pach does exactly that,
  - second patch changes defconfigs to use it,
  - third patch gets rid of the former opposite option.

Regards,
Yann E. MORIN.


The following changes since commit fef4fc0e0ebb5235b4aa9301ee7e34a85e8fb4a3:

  libcroco: fix typo in license file (2016-01-20 17:27:25 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kenrel-headers

for you to fetch changes up to f222817257d3ddfbedb60edb0f259ba4ec35e003:

  linux: drop the option to use the same version as that of the headers (2016-01-20 19:31:41 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/linux-headers: add option to use same sources as the kernel
      defconfigs: use the new headers-version-same-as-kernel-version option
      linux: drop the option to use the same version as that of the headers

 Config.in.legacy                         | 10 ++++++++++
 configs/freescale_imx28evk_defconfig     |  5 ++---
 configs/freescale_imx31_3stack_defconfig |  9 ++++-----
 configs/ts5x00_defconfig                 | 15 +++++++++++----
 linux/Config.in                          | 12 ------------
 linux/linux.mk                           |  3 ---
 package/linux-headers/Config.in.host     | 12 +++++++++++-
 package/linux-headers/linux-headers.mk   | 25 ++++++++++++++++++++++---
 8 files changed, 60 insertions(+), 31 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
