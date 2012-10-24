From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:26 +0200
Subject: [Buildroot] [PATCH 0/47] Add QEMU for runing on the target
Message-ID: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch series adds qemu as a package to run on the target.

Although this may sound weird in a first place, I use it to build a simple
VM server.

I also use it to build statically-linked user-emulation to run foreign
chroots on my PC (eg. running an ARM chroot on my x86_64), because using
glibc for static-linking is not possible (it still requires some shared
libs that it dlopens at runtime).

For now, I've only build-tested it for an x86_64 uClibc-based target.
It's not complete, but there have been requests (on IRC) by a few users
that are trrying to achieve a similar setup (looks like it). So, to
avoid duplication, here's the full patchset I have here.

In the future, I plan on adding libvirt to remotely manage the VM server.

    [PATCH 01/47] package/cURL: fix static link whith openSSL
    [PATCH 02/47] package/libfdt: new package
    [PATCH 03/47] package/vde2: new package
    [PATCH 04/47] package/libiscsi: new package
    [PATCH 05/47] package/usbredir: new package
    [PATCH 06/47] package/celt051: new package
    [PATCH 07/47] package/python-pyparsing: new package
    [PATCH 08/47] package/spice-protocol: new package
    [PATCH 09/47] package/libcegui: new package
    [PATCH 10/47] package/slirp: new package
    [PATCH 11/47] package/spice-server: new package
    [PATCH 12/47] package/spice: enable client
    [PATCH 13/47] package/spice: enable GUI
    [PATCH 14/47] package/spice: enable slirp support
    [PATCH 15/47] package/libseccomp: new package
    [PATCH 16/47] package/keyutils: new package
    [PATCH 17/47] package/pmake: add host pmake
    [PATCH 18/47] package/libbsd: new package
    [PATCH 19/47] package/libedit2: new package
    [PATCH 20/47] package/ceph: new package
    [PATCH 21/47] package/qemu: new package
    [PATCH 22/47] package/qemu: add basic target selection
    [PATCH 23/47] package/qemu: add fine-grained target selection
    [PATCH 24/47] package/qemu: add SDL frontends
    [PATCH 25/47] package/qemu: add option to enable/disable the VNC frontend
    [PATCH 26/47] package/qemu: add VNC jpeg and png compression
    [PATCH 27/47] package/qemu: add VNC TLS-encryption
    [PATCH 28/47] package/qemu: add option to not install blobs
    [PATCH 29/47] package/qemu: add option to remove unwanted keymaps
    [PATCH 30/47] package/qemu: add uuid support
    [PATCH 31/47] package/qemu: add support for capabilities
    [PATCH 32/47] package/qemu: add attr/xattr option
    [PATCH 33/47] package/qemu: add support for virtfs
    [PATCH 34/47] package/qemu: add support for cURL
    [PATCH 35/47] package/qemu: enable use of the curses frontend
    [PATCH 36/47] package/qemu: add BlueZ connectivity
    [PATCH 37/47] package/qemu: add AIO support
    [PATCH 38/47] package/qemu: add support for FDT
    [PATCH 39/47] package/qemu: add support for VDE switches
    [PATCH 40/47] package/qemu: add iSCSI support
    [PATCH 41/47] package/qemu: add support for USB redirection
    [PATCH 42/47] package/qemu: add support for Spice
    [PATCH 43/47] package/qemu: enable sound
    [PATCH 44/47] package/qemu: add support for libseccomp
    [PATCH 45/47] package/qemu: option to build the docs
    [PATCH 46/47] package/qemu: move sub-options into a sub-menu
    [PATCH 47/47] package/qemu: enable a static build

Regards,
Yann E. MORIN.
