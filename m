From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 16:29:02 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/libtirpc: bump and add new
	dependencies (branch yem/libtirpc)
Message-ID: <cover.1434292018.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This sseries bumps libtirpc to the latest release.

Besides, libtirpc does not build on musl, because musl is lacking two
headers:
  - sys/cdefs.h on ARM,
  - sys/queue.h on all architectures.

So, libtirpc is disabled on musl. That dependency is propagated to all
packages that depend on libtirpc.


Changes v1 -> v2:
  - add dependency patch


Regards,
Yann E. MORIN.


The following changes since commit d6d237c8c2313829b6f7b4f06d55a5a4c89a870b:

  uclibc: remove Xtensa specific version (2015-06-14 14:51:06 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/libtirpc

for you to fetch changes up to a13a154a08aa3fd09400a2b1ae3571544a86f3db:

  package/libtirpc: does not build with musl libc (2015-06-14 16:21:57 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/libtirpc: bump version
      package/libtirpc: does not build with musl libc

 package/argus/Config.in                            |  5 +-
 package/conntrack-tools/Config.in                  |  5 +-
 ...able-parts-of-TIRPC-requiring-NIS-support.patch | 66 ++++------------------
 ...out-RPC-support-does-not-install-rpcent.h.patch | 18 +++---
 ...dd-rpcgen-program-from-nfs-utils-sources.patch} | 19 ++++---
 ...y-generate-XDR-header-files-from-.x-sour.patch} | 53 ++++++++---------
 ...-files-needed-to-build-rpcbind-on-top-of.patch} | 27 +++++----
 ...g-config-needs-pthread-as-private-library.patch | 36 ------------
 package/libtirpc/Config.in                         |  5 +-
 package/libtirpc/libtirpc.hash                     |  4 +-
 package/libtirpc/libtirpc.mk                       |  2 +-
 package/lmbench/Config.in                          |  6 +-
 package/nfs-utils/Config.in                        |  6 +-
 package/quota/Config.in                            |  6 +-
 package/rpcbind/Config.in                          |  5 +-
 15 files changed, 101 insertions(+), 162 deletions(-)
 rename package/libtirpc/{0004-Add-rpcgen-program-from-nfs-utils-sources.patch => 0003-Add-rpcgen-program-from-nfs-utils-sources.patch} (99%)
 rename package/libtirpc/{0005-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0004-Automatically-generate-XDR-header-files-from-.x-sour.patch} (97%)
 rename package/libtirpc/{0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (98%)
 delete mode 100644 package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
