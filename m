From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:22:15 +0200
Subject: [Buildroot] [PATCH 0/5 v2] arch: not all have support in the
	internal backend
Message-ID: <cover.1504430497.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Not all architectures we support have support in upstream gcc, glibc,
binutils, and/or linux. In some cases, only a few specific cores do not
have that support.

Furthermore, some architecture, specific cores, or core behaviour/setup
(like the MIPS NaN support) got support in a specific gcc version.

Currently, we have to account for this in at least three locations:
  - the toolchain backend choice (internal or externsal)
  - the gcc version choice
  - each external toolchain

This series is a first step, to introduce the possibility for each
architecture, or specific core thereof, to specify that it lacks support
in our internal backend.

The case for the gcc version will be handled in a follow-up series,
while the MIPS NaN fixes will ber in their own further follow-up. They
can be seen there:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/arch-min-gcc-version
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/arch-mips-cleanups

Changes v1 -> v2:
  - fix improper variable due to incorrect rebase  (Thomas)
  - use better variable name  (Thomas)
  - introduce an intermediate kconfig symbol for positive logic  (Thomas)
  - eventually drop the unsuported bfin cores  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit f1212fd9cc627851d3679a83cee88cd9f3e58f8c

  libcgi: add patch to not require C++ support (2017-09-02 23:54:54 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0335a8a1164bfeb7c006c7d248d8f1923069c98f

  arc/bfin: remove 60x cores (2017-09-03 11:09:53 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      arch: add option to disable internal toolchain backend
      arch/csky: internal backend not suitable
      arch/mips: internal backend not suitable for some cores
      arch/bfin: internal backend not suitable for some cores
      arc/bfin: remove 60x cores

 arch/Config.in      | 11 +++++++++++
 arch/Config.in.bfin |  8 --------
 arch/Config.in.mips |  2 ++
 toolchain/Config.in |  8 +-------
 4 files changed, 14 insertions(+), 15 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
