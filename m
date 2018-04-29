From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Apr 2018 14:15:19 +0200
Subject: [Buildroot] [PATCH 0/3] core/pkg-infra: declare target variant
 before host variant
Message-ID: <cover.1525004110.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As Thomas puts it in his original commit logs:

    Our package infrastructure uses inheritance of a number of values
    from the target package to the host package, which assumes the
    target package is defined before the host package.

This series fixes the 6 affected packages, with a first patch inverting
the calls to the package macros, and a secon patch just for qemu to move
around all the code.

Finally, it adds a check in the package ifnrastructure to check this
condition.


Regards,
Yann E. MORIN.


The following changes since commit 16edaece366b052fe696982d816e8b042b217ad5

  speex: remove useless BUILD_CMDS (2018-04-29 13:46:16 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f3fbc309610c9ff7df8d06ba1aad1f9369e5cdac

  package/pkg-generic: add check that target variant is defined before host variant (2018-04-29 14:07:08 +0200)


----------------------------------------------------------------
Thomas Petazzoni (3):
      package: declare target variant before host variant
      package/qemu: declare target variant before host variant
      package/pkg-generic: add check that target variant is defined before host variant

 docs/manual/adding-packages-generic.txt            |   6 +-
 package/android-tools/android-tools.mk             |   2 +-
 package/gauche/gauche.mk                           |   2 +-
 package/lcms2/lcms2.mk                             |   2 +-
 .../linux-syscall-support/linux-syscall-support.mk |   2 +-
 package/pkg-generic.mk                             |   6 +
 package/pngquant/pngquant.mk                       |   2 +-
 package/qemu/qemu.mk                               | 242 ++++++++++-----------
 8 files changed, 136 insertions(+), 128 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
