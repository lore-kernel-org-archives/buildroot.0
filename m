From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 18:34:08 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.11/rpc-support
Message-ID: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yet another version of the RPC set of patches. Changes since the last
posting:

 * The kernel headers version chunk has been properly moved to the SH
   2012.03 toolchain patch. Noticed by Baruch.

 * Assume that by default, custom external glibc toolchains have RPC
   support, so that autobuilders configuration continue to work nicely
   (and also because it is most likely the case for most
   toolchains). Suggested by Peter.

Thomas

The following changes since commit 9fbdf062b93c6c2ed7e35897bcb0ad4c60f29d41:

  toolchain-external: improve glibc support to test availability of RPC (2012-11-04 01:22:43 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.11/rpc-support

for you to fetch changes up to 8c77c933bce9ac229c015bb8bb489c3a41458ea3:

  toolchain-external: assume that by default, glibc toolchains have RPC support (2012-11-04 18:26:06 +0100)

----------------------------------------------------------------
Thomas Petazzoni (21):
      toolchain-external: ARM 2012.03 has RPC support
      libtirpc: new package
      busybox: add support to link against libtirpc when available
      lmbench: add support to use libtirpc when available
      nfs-utils: add support to use RPC support from libtirpc
      rpcbind: new package
      portmap: mention that rpcbind is the project that superseds portmap
      quota: add support to use RPC support from libtirpc
      samba: unconditionally enable --with-sys-quotas
      xinetd: add support to use RPC support from libtirpc
      toolchain-external: add Sourcery CodeBench SuperH 2012.03
      toolchain-external: add Sourcery CodeBench x86 2012.03
      toolchain-external: add support for Sourcery CodeBench SH 2012.09
      toolchain-external: add Sourcery CodeBench x86/x86_64 2012.09
      toolchain-external: remove Sourcery CodeBench ARM 2010q1
      toolchain-external: remove Sourcery CodeBench ARM 2010.09
      toolchain-external: remove Sourcery CodeBench SH 2010.09
      toolchain-external: remove Sourcery CodeBench x86/x86_64 2010.09
      toolchain-external: remove Linaro 2012.06
      toolchain-external: remove Linaro 2012.07
      toolchain-external: assume that by default, glibc toolchains have RPC support

 package/Config.in                                  |    2 +
 package/busybox/busybox.mk                         |   19 +-
 package/libtirpc/Config.in                         |    7 +
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |   70 ++++++++
 ...out-RPC-support-does-not-install-rpcent.h.patch |   26 +++
 ...btirpc-0003-Add-missing-INET6-conditional.patch |   60 +++++++
 .../libtirpc-0004-Make-IPv6-support-optional.patch |   43 +++++
 package/libtirpc/libtirpc.mk                       |   24 +++
 package/lmbench/Config.in                          |    6 +-
 package/lmbench/lmbench.mk                         |   11 +-
 package/nfs-utils/Config.in                        |    7 +-
 package/nfs-utils/nfs-utils.mk                     |    8 +-
 package/portmap/Config.in                          |    2 +
 package/quota/Config.in                            |    6 +-
 package/quota/quota.mk                             |   13 +-
 package/rpcbind/Config.in                          |    8 +
 package/rpcbind/rpcbind-01-no-yp-support.patch     |   46 +++++
 package/rpcbind/rpcbind.mk                         |   17 ++
 package/samba/samba.mk                             |    2 +-
 package/xinetd/xinetd.mk                           |   19 +-
 toolchain/toolchain-external/Config.in             |  186 ++++++++------------
 toolchain/toolchain-external/ext-tool.mk           |   32 ++--
 22 files changed, 462 insertions(+), 152 deletions(-)
 create mode 100644 package/libtirpc/Config.in
 create mode 100644 package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
 create mode 100644 package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
 create mode 100644 package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
 create mode 100644 package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
 create mode 100644 package/libtirpc/libtirpc.mk
 create mode 100644 package/rpcbind/Config.in
 create mode 100644 package/rpcbind/rpcbind-01-no-yp-support.patch
 create mode 100644 package/rpcbind/rpcbind.mk

Thanks,
-- 
Thomas Petazzoni
