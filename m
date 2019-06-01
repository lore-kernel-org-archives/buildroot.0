From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jun 2019 22:33:48 +0200
Subject: [Buildroot] [PATCH 0/2] arch: allow passing compile flags (branch
 yem/arc-atomic)
Message-ID: <cover.1559421222.git.yann.morin.1998@free.fr>
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


Regards,
Yann E. MORIN.


The following changes since commit a28c727bb77ce83a0c5c6b0d87d4e46374200371

  package/network-manager: drop unrecognized --without-docs (2019-06-01 15:10:30 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 16241cb355b045ba585ba806f0f4c829f5aea9f8

  arch/arc: arc7x0 always needs -matomic (2019-06-01 22:28:19 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain: allow architectures to enforce compilation flags
      arch/arc: arc7x0 always needs -matomic

 arch/arch.mk.arc               | 4 ++++
 toolchain/toolchain-wrapper.mk | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arch.mk.arc

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
