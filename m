From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 16:29:40 +0200
Subject: [Buildroot] [PATCH 0/2 v2] arch: allow passing compile flags
 (branch yem/arc-atomic)
Message-ID: <cover.1563114574.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series makes it so that architectures can set compilation flags,
passed down via the wrapper.

This is then used by arc to enforce -matomic for those cores that need
it, namely arc7x0, as reported by Alexey:

    https://patchwork.ozlabs.org/patch/1087480/
    https://patchwork.ozlabs.org/patch/1087471/

Changes v1 -> v2;
  - move condition that was previously in package/Makefile.in  (Alexey)


Regards,
Yann E. MORIN.


The following changes since commit fb9c86a31c7933d2a320644be9cfff4be71a3206

  package/imx-uuc: bump to version fc48b497fe961d601b4bcced807f562090854ec9 (2019-07-14 15:59:56 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8d0887d8b7c56dd2b92314886f35bdaa7d57894d

  arch/arc: always needs -matomic with atomix extensions (2019-07-14 16:28:43 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain: allow architectures to enforce compilation flags
      arch/arc: always needs -matomic with atomix extensions

 arch/arch.mk.arc               | 4 ++++
 package/Makefile.in            | 4 ----
 toolchain/toolchain-wrapper.mk | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)
 create mode 100644 arch/arch.mk.arc

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
