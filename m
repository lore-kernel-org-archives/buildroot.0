From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 19:51:29 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
Message-ID: <cover.1488048682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

See for example:

  - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
  - freerdp  : http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
  - libcec   : http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/

(and many others)

All causes the link to be attemped against host libraries, which is
definitely not appropriate...

Properly fixing this so close to the release is problematic; we'd risk
having to hunt down packages one by one.


Regards,
Yann E. MORIN.


The following changes since commit a3c07d08eae55deeb1b1731174309750bb0ea628

  util-linux: re-add <pkg>_AUTORECONF = YES (2017-02-24 12:00:02 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to df3990e80996775534d5d823ea9bb772836b945d

  Revert "cmake: bump version to 3.7.0" (2017-02-25 19:40:13 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      Revert "cmake: bump version to 3.7.2"
      Revert "cmake: adjust dependencies added for libuv"
      Revert "cmake: bump version to 3.7.1"
      Revert "cmake: bump version to 3.7.0"

 package/cmake/Config.in  | 9 ++-------
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 6 +++---
 3 files changed, 7 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
