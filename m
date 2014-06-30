From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 13:56:07 +0200
Subject: [Buildroot] [PATCH 0/3] Bump libtirpc/rpcbind, add startup script
Message-ID: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This small series of patches update libtirpc and rpcbind to their
latest upstream versions, and adds a startup script for rpcbind, which
is needed for NFS filesystems to mount properly (this patch is
courtesy of Sagaert Johan).

The result was tested with a minimal (thread support only) uClibc ARM
toolchain, booted under Qemu. I was able to mount a remote NFS
filesystem properly.

This patch series superseds http://patchwork.ozlabs.org/patch/359802/,
http://patchwork.ozlabs.org/patch/359835/, so I will adjust their
state in patchwork.

Best regards,

Thomas

Sagaert Johan (1):
  rpcbind : add startup script

Thomas Petazzoni (2):
  libtirpc: bump to 0.2.4
  rpcbind: bump to version 0.2.1

 ...able-parts-of-TIRPC-requiring-NIS-support.patch | 34 ++++++------
 ...out-RPC-support-does-not-install-rpcent.h.patch |  8 +--
 ...btirpc-0003-Add-missing-INET6-conditional.patch | 60 ----------------------
 .../libtirpc-0004-Make-IPv6-support-optional.patch | 35 ++++---------
 ...-getrpcbyname-name-argument-as-const-char.patch | 43 ----------------
 ...t-remove-prototypes-of-reentrant-variants.patch | 33 ------------
 ...-Makefile.am-fix-out-of-tree-installation.patch | 24 ---------
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 27 +++++-----
 ...ly-generate-XDR-header-files-from-.x-sour.patch | 51 +++++++++---------
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 24 +++++----
 package/libtirpc/libtirpc.mk                       |  4 +-
 package/rpcbind/S30rpcbind                         | 38 ++++++++++++++
 .../rpcbind-0001-Remove-yellow-pages-support.patch | 10 ++--
 ...to-use-NSS-support-when-not-available-in-.patch | 60 ----------------------
 .../rpcbind-0003-Make-IPv6-configurable.patch      | 50 +++++++++---------
 package/rpcbind/rpcbind.mk                         |  9 +++-
 16 files changed, 164 insertions(+), 346 deletions(-)
 delete mode 100644 package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
 delete mode 100644 package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
 delete mode 100644 package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
 delete mode 100644 package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch
 create mode 100644 package/rpcbind/S30rpcbind
 delete mode 100644 package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch

-- 
2.0.0
