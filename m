From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2019 22:52:46 +0200
Subject: [Buildroot] [PATCH 0/2 v3] arch: allow passing compile flags
 (branch yem/arc-atomic)
Message-ID: <cover.1563483157.git.yann.morin.1998@free.fr>
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

Changes v2 -> v3:
  - fix 'y' -> 'yy' in condition

Changes v1 -> v2:
  - move condition that was previously in package/Makefile.in  (Alexey)


Regards,
Yann E. MORIN.


The following changes since commit ed3eef6bb49270de619e5a86a249fdd8724c40cd

  package/glib-networking: bump to version 2.61.1 (2019-07-14 16:11:45 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7fe54408b9c04d8d5799a167aded7c0b0157c572

  arch/arc: always needs -matomic with atomix extensions (2019-07-18 22:51:24 +0200)


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
