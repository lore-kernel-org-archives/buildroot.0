From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 15:16:09 +0100
Subject: [Buildroot] [PATCH 0/4] arch/arm: add more cores (branch
 yem/aarch64-new-cores)
Message-ID: <cover.1546179362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series:
  - fixes the conditions under which some of the existing cores may
    be selected,
  - extends our choice of ARM cores, that were added with gcc-8.

Those four new cores have been verified to at least alow building the
toolchain, with uClibc-ng, glibc, and musl:
    https://gitlab.com/ymorin/buildroot/pipelines/41680241


Regards,
Yann E. MORIN.


The following changes since commit cd6c2f41ef0e58d0b797039512d5c0f07c7239ab

  package/php: bump version to 7.3.0 (2018-12-28 14:04:00 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c6db960a999901cb0beaac68b264e7c9b82e8891

  arch/arm: add an armv8.3a core (2018-12-30 15:15:44 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      arch/arm: drop useless conditional dependencies for 64-bit-only cores
      arch/arm: restrict more armv8a cores to aarch64
      arch/arm: add armv8.2a cortex-based cores
      arch/arm: add an armv8.3a core

 arch/Config.in.arm | 55 ++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 16 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
