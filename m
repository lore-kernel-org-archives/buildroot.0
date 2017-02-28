From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Feb 2017 19:07:23 +0100
Subject: [Buildroot] [PATCH 0/5] package/cmake: re-introduce cmake-3.7
Message-ID: <cover.1488305206.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series re-introduces cmake-3.7, along with a way to fix the RPATH
issue in this release, and slated to stay upstream as-is.

We define a new platform that gets rid of the offending settings. See
the first commit log for the nitty-gritty details. This works for all
versions of cmake, so is safe to do before re-introducing cmake-3.7.

Once we have this support, we can bump cmake again. We reuse the four
original patches, to keep authoorship (although they could well all be
squashed into one).


Regards,
Yann E. MORIN.


The following changes since commit 1c186c6ca1689111fb2a4a164f57b3b96ebd21c8

  qt5quickcontrols: fix installation of PrivateWidgets (2017-02-28 15:55:29 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to a97614e367871d75a4e109b7d45a6dd48fb9fe19

  cmake: bump version to 3.7.2 (2017-02-28 19:00:20 +0100)


----------------------------------------------------------------
Thomas Petazzoni (1):
      cmake: adjust dependencies added for libuv

Vicente Olivert Riera (3):
      cmake: bump version to 3.7.0
      cmake: bump version to 3.7.1
      cmake: bump version to 3.7.2

Yann E. MORIN (1):
      core/pkg-cmake: provide our own platform description

 package/cmake/Config.in             | 9 +++++++--
 package/cmake/cmake.hash            | 4 ++--
 package/cmake/cmake.mk              | 6 +++---
 package/pkg-cmake.mk                | 4 ++++
 support/misc/Buildroot.cmake        | 3 +++
 support/misc/toolchainfile.cmake.in | 2 +-
 toolchain/toolchain/toolchain.mk    | 1 +
 7 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 support/misc/Buildroot.cmake

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
