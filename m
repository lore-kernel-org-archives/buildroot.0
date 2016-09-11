From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 17:58:23 +0200
Subject: [Buildroot] [PATCH 0/2 v7] core/pkg-cmake: do not build host-cmake
	if not needed (branch yem/host-cmake)
Message-ID: <cover.1473609425.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series attempts at using the cmake already present on the build
machine, if any, to avoid building our own version if the existing cmake
is suitable.

Changes v6 -> v7:
  - split out in two patches  (Arnout)


Regards,
Yann E. MORIN.


The following changes since commit 0c6635e9d6a9b0f1d361f1363c4b647adcae6da2

  package/libva-intel-driver: bump version to 1.7.2 (2016-09-05 22:17:54 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 48c654db68d1067703a4d46b7ba838e898539263

  core/pkg-cmake: ensure no package needs a cmake newer than we do (2016-09-11 17:53:30 +0200)


----------------------------------------------------------------
Luca Ceresoli (1):
      core: don't build host-cmake if it is available on the build host

Yann E. MORIN (1):
      core/pkg-cmake: ensure no package needs a cmake newer than we do

 package/pkg-cmake.mk                     | 46 +++++++++++++++++++++++++++++---
 support/dependencies/check-host-cmake.mk | 18 +++++++++++++
 support/dependencies/check-host-cmake.sh | 28 +++++++++++++++++++
 3 files changed, 89 insertions(+), 3 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
