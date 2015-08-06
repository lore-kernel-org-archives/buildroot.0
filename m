From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  6 Aug 2015 22:51:28 +0200
Subject: [Buildroot] [PATCH 0/2] [autobuild] filemq: fix build issues
	(branch yem/fixes)
Message-ID: <cover.1438894103.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at fixing the numerous build failures of
filemq.

The currently-packaged version of filemq uses AC_CHECK_LIB to find
-lzmq, but fails to account for the fact that this is a C++ library,
tries to use gcc to link it, and miserably fails to buidl the test
program.

However, upstream has switched to using pkg-config (yeah!) but it now
requires a more recent version of czmq.

So, this series bumps the two packages, czmq and filemq.

Regards,
Yann E. MORIN.


The following changes since commit e7f616617846fd43a44c2543e03dc5fe4aeded75:

  c-icap: fix incorrect dependency on BR2_PREFER_STATIC_LIB (2015-08-06 20:51:07 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 84efc4acace2de810ed91d04e236b77afaa71fa4:

  [autobuild] package/filemq: bump version (2015-08-06 22:47:51 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      [autobuild] package/czmq: bump version
      [autobuild] package/filemq: bump version

 ...igure.ac-to-prevent-contradictory-discove.patch | 206 ---------------------
 package/czmq/czmq.mk                               |   2 +-
 package/filemq/filemq.mk                           |   2 +-
 3 files changed, 2 insertions(+), 208 deletions(-)
 delete mode 100644 package/czmq/0001-Simply-configure.ac-to-prevent-contradictory-discove.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
