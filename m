From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:34 +0200
Subject: [Buildroot] [PATCH 0/30] QEMU on the target (branch yem/target-qemu)
Message-ID: <cover.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

After too long a time in limbo, here is a respin of my series about
running QEMU on the target.

Having QEMU on the target can be usefull in more cases than one might
expect Buildroot to catter for:

  - deploy a brand new system on a new board, but with a legacy
    application that only runs on DOS, Windows. After some feedback,
    this happens more often than we would think; legacy DOS applications
    are legions, and as is often the case for those antiquated type of
    software, source code and specifications are long lost, so it is not
    possible to re-build the application.

  - for the same reason, a new design that uses a different architecture,
    but still requries such a legacy (obviously Linux) application to
    still run. qemu-user can come handy in those cases.

  - in some systems, it is better to completely isolate untrusted parts
    of an application in a VM, even at the cost of performance, as a VM
    provides almost-complete isolation.

  - coupled with libvirt (to come in a future patchset), we can build a
    very lightweight system to host VMs.

Currently, we make QEMU only available on x86 (32-bit or 64-bit), as
that's what it was tested with. QEMU is also supposed to run on a PPC,
that can be added later on by an interested party.

Regards,
Yann E. MORIN.


The following changes since commit e17afee1b9d6e6503aa68211341efad437ef181d:

  slang: disable termcap (2014-10-07 22:36:02 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/target-qemu

for you to fetch changes up to ae4e379071183585d080fdedcf006e19b7e58a43:

  package/qemu: add support for FDT (2014-10-07 22:53:52 +0200)

----------------------------------------------------------------
Yann E. MORIN (30):
      package/qemu: do not use autotools for qemu
      package/qemu: bump version
      package/qemu: build for the target (i386 or x86_64 only)
      package/qemu: add basic target selection
      package/qemu: add fine-grained target selection
      package/qemu: add SDL frontends
      package/qemu: add option to enable/disable the VNC frontend
      package/qemu: add VNC jpeg and png compression
      package/qemu: add VNC TLS-encryption
      package/qemu: add option to not install blobs
      package/qemu: add option to remove unwanted keymaps
      package/qemu: add uuid support
      package/qemu: add support for capabilities
      package/qemu: add attr/xattr option
      package/qemu: add support for virtfs
      package/qemu: add support for cURL
      package/qemu: enable use of the curses frontend
      package/qemu: add BlueZ connectivity
      package/qemu: add AIO support
      package/qemu: add support for VDE switches
      package/qemu: add iSCSI support
      package/qemu: add support for USB redirection
      package/qemu: add support for Spice
      package/qemu: enable sound
      package/qemu: add support for libseccomp
      package/qemu: option to build the docs
      package/qemu: add option to install tools on the target
      package/qemu: move sub-options into a sub-menu
      package/qemu: enable a static build
      package/qemu: add support for FDT

 package/Config.in                        |   1 +
 package/qemu/Config.in                   | 316 +++++++++++++++++++++++++++++++
 package/qemu/qemu-0000-static-curl.patch |  69 +++++++
 package/qemu/qemu-0001-static-sdl.patch  |  53 ++++++
 package/qemu/qemu.mk                     | 311 +++++++++++++++++++++++++++++-
 5 files changed, 742 insertions(+), 8 deletions(-)
 create mode 100644 package/qemu/Config.in
 create mode 100644 package/qemu/qemu-0000-static-curl.patch
 create mode 100644 package/qemu/qemu-0001-static-sdl.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
