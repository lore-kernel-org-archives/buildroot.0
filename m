From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:53:59 +0100
Subject: [Buildroot] [PATCH for-next 0/51 v3] Add QEMU for runing on the
	target
Message-ID: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch series adds qemu as a package to run on the target.

Although this may sound weird in a first place, I use it to build a
simple VM server.

I also use it to build statically-linked user-emulation to run foreign
chroots on my PC (eg. running an ARM chroot on my x86_64), because
using glibc for static-linking is not possible (it still requires some
shared libs that it dlopens at runtime).

In the future, I plan on adding libvirt to remotely manage the VM server.

Changes since v2:
  - act on Arnout's comments on v2:
    - cURL fix as a post-patch hook rather than post-install hook
    - dtc package name, install tools
    - usbredir cleanups
    - cegui06 package name
  - update to qemu 1.2.1

   [PATCH 01/51] package/cURL: fix static link whith openSSL
   [PATCH 02/51] package/dtc: new package
   [PATCH 03/51] package/dtc: add option to install programs
   [PATCH 04/51] package/vde2: new package
   [PATCH 05/51] package/libiscsi: new package
   [PATCH 06/51] package/usbredir: new package
   [PATCH 07/51] package/celt051: new package
   [PATCH 08/51] package/python-pyparsing: new package
   [PATCH 09/51] package/spice-protocol: new package
   [PATCH 10/51] package/cegui06: new package
   [PATCH 11/51] package/slirp: new package
   [PATCH 12/51] package/spice: new package
   [PATCH 13/51] package/spice: enable client
   [PATCH 14/51] package/spice: enable GUI
   [PATCH 15/51] package/spice: enable slirp support
   [PATCH 16/51] package/libseccomp: new package
   [PATCH 17/51] package/keyutils: new package
   [PATCH 18/51] package/pmake: add host pmake
   [PATCH 19/51] package/libbsd: new package
   [PATCH 20/51] package/libedit2: new package
   [PATCH 21/51] package/ceph: new package
   [PATCH 22/51] package/qemu: add license information
   [PATCH 23/51] package/qemu: bump version
   [PATCH 24/51] package/qemu: fix host-qemu variable names
   [PATCH 25/51] package/qemu: build for the target (i386 or x86_64 only)
   [PATCH 26/51] package/qemu: add basic target selection
   [PATCH 27/51] package/qemu: add fine-grained target selection
   [PATCH 28/51] package/qemu: add SDL frontends
   [PATCH 29/51] package/qemu: add option to enable/disable the VNC frontend
   [PATCH 30/51] package/qemu: add VNC jpeg and png compression
   [PATCH 31/51] package/qemu: add VNC TLS-encryption
   [PATCH 32/51] package/qemu: add option to not install blobs
   [PATCH 33/51] package/qemu: add option to remove unwanted keymaps
   [PATCH 34/51] package/qemu: add uuid support
   [PATCH 35/51] package/qemu: add support for capabilities
   [PATCH 36/51] package/qemu: add attr/xattr option
   [PATCH 37/51] package/qemu: add support for virtfs
   [PATCH 38/51] package/qemu: add support for cURL
   [PATCH 39/51] package/qemu: enable use of the curses frontend
   [PATCH 40/51] package/qemu: add BlueZ connectivity
   [PATCH 41/51] package/qemu: add AIO support
   [PATCH 42/51] package/qemu: add support for FDT
   [PATCH 43/51] package/qemu: add support for VDE switches
   [PATCH 44/51] package/qemu: add iSCSI support
   [PATCH 45/51] package/qemu: add support for USB redirection
   [PATCH 46/51] package/qemu: add support for Spice
   [PATCH 47/51] package/qemu: enable sound
   [PATCH 48/51] package/qemu: add support for libseccomp
   [PATCH 49/51] package/qemu: option to build the docs
   [PATCH 50/51] package/qemu: move sub-options into a sub-menu
   [PATCH 51/51] package/qemu: enable a static build

Regards,
Yann E. MORIN.
