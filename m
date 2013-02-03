From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:37 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem-target-qemu
Message-ID: <cover.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is the last part required to build QEMU for the target.

It depends on the previous series that was just sent:
  - http://lists.busybox.net/pipermail/buildroot/2013-February/066541.html

The philosophy behind this long series is to add a basic, non-configurable
QEMU build (which is already complex as it is), then add features one by
one to ease review.

The latest patch, adding DTC, has been a bit controversial, but no final
solution has been identified (as far as I remember), so I've kept it as-is.

Hopefully, we'll have time to review and definitely ack/nack this series
during the DevDay in Brussels. ;-)


Changes v2 -> v3:
  - changed to using generic-package (Thomas)
  - fixed comments about QEMU-1.2, we're using 1.3.1 now (Thomas)
  - added ability to install tools on target
  - added ability to install no emulator on target

Changes v1 -> v2:
  - rebased ontop latest tree
  - fixed wreckage due to bump from QEMU 1.2.2 -> 1.3.0
  - updated to QEMU 1.3.1
  - added option to install QEMU tools on the target


The following changes since commit e38f62bfa419db595ba5ad335b5a5bf7f8e87e91:

  package/dtc: add option to install programs (2013-02-03 14:15:14 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-target-qemu

Yann E. MORIN (29):
      package/qemu: bump version to 1.3.1
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

 package/Config.in                   |    1 +
 package/qemu/Config.in              |  320 +++++++++++++++++++++++++++++++++++
 package/qemu/qemu-static-curl.patch |   72 ++++++++
 package/qemu/qemu-static-sdl.patch  |   54 ++++++
 package/qemu/qemu.mk                |  297 ++++++++++++++++++++++++++++++++-
 5 files changed, 743 insertions(+), 1 deletions(-)
 create mode 100644 package/qemu/Config.in
 create mode 100644 package/qemu/qemu-static-curl.patch
 create mode 100644 package/qemu/qemu-static-sdl.patch

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
