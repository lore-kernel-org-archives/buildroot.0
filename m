From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 May 2017 23:15:23 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/qt5base: fix sparc compilation
Message-ID: <cover.1495055675.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series aims at fixing the build of qt-5.8 on sparc.

Qt 5.8 needs atomic operations, which on some architectures are compiler
builtins, while on other archs they are provided by a helper library,
libatomic. For sparc, atomics are in libatomic.

First, we introduce a new qmake config snippet, arch.conf, which is
included from our qmake.conf.

By default, that file is empty, except when libatomic is present in the
toolchain, in which case it add -latomic to the list of libraries to
link with.


Regards,
Yann E. MORIN.


The following changes since commit 19e78e509e5e729437d2188b28aee7655340c67d

  oracle-mysql: add patch to fix gcc 6.x build issue (2017-05-17 22:24:14 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6bdfcdff79478a9835c4c5d0296f8f62d5b64d66

  package/qt5base: link with -latomic for sparc (2017-05-17 23:08:55 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/qt5base: install arch-specific configuration
      package/qt5base: link with -latomic for sparc

 package/qt5/qt5base/qmake.conf |  3 +++
 package/qt5/qt5base/qt5base.mk | 10 ++++++++++
 2 files changed, 13 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
