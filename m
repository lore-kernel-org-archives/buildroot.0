From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 00:57:12 +0200
Subject: [Buildroot] [PATCH 0/2 v2] Workaround for bug #7172: patchelf
	(branch yem/patchelf)
Message-ID: <cover.1406760999.git.yann.morin.1998@free.fr>
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

Changes v1 -> v2:
  - fix typoes  (Thomas DS)


Regards,
Yann E. MORIN.


The following changes since commit 26aefa672c96caefc17adf59a9ab3d327114ad36:

  bind: fix static openssl linking (2014-07-30 23:51:51 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/patchelf

for you to fetch changes up to fc8f5090621f94da255a6191eec78125047eb318:

  package/patchelf: new host package (2014-07-31 00:44:25 +0200)

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
