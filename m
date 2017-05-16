From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 May 2017 23:13:08 +0200
Subject: [Buildroot] [PATCH 0/2] package/qt5base: fix sparc compilation
Message-ID: <cover.1494969180.git.yann.morin.1998@free.fr>
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

By default, that file is empty, except on sparc, where it add -latomic
to the list of libraries to link with.


Regards,
Yann E. MORIN.


The following changes since commit 4e00f9daa04e9a84f5191f479d7236dea72fbf35

  gcc: drop unused legacy arc-2016.09 patch (2017-05-16 21:24:02 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 628b089124e34bcc2f6cd9be57c65d567872ef1f

  package/qt5base: link with -latomic for sparc (2017-05-16 23:11:23 +0200)


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
