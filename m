From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 16:42:55 +0200
Subject: [Buildroot] [PATCH 0/2] Workaround for bug #7172: patchelf (branch
	yem/patchelf)
Message-ID: <cover.1405262399.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a workaround for the limitations expressed in bug
#7172 [0], which explains that a variable containing a $ sign is incorrectly
expanded.

Since it is not trivial to actually fix #7172, this series implements a
workaround, by:
  - explaining the limitation in the menuconfig and the manual
  - adding patchelf as a host-package, so users can tweak ELF files
    after the build (e.g. in a post-build script)

[0] https://bugs.buildroot.org/show_bug.cgi?id=7172

Regards,
Yann E. MORIN.


The following changes since commit 30252ae893298bf3f190b57d33c545e0e46c40db:

  libgpgme: disable all tests (2014-07-12 20:47:38 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/patchelf

for you to fetch changes up to a8d871e1d1bf5eb507d24eac6f5dd51cda98a326:

  package/patchelf: new host package (2014-07-13 16:38:43 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain: linker options with a $ sign are not supported
      package/patchelf: new host package

 docs/manual/known-issues.txt    |  4 ++++
 package/Config.in.host          |  1 +
 package/patchelf/Config.in.host |  7 +++++++
 package/patchelf/patchelf.mk    | 12 ++++++++++++
 toolchain/toolchain-common.in   |  3 +++
 5 files changed, 27 insertions(+)
 create mode 100644 package/patchelf/Config.in.host
 create mode 100644 package/patchelf/patchelf.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
