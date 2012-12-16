From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 18:01:29 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-target-qemu
Message-ID: <cover.1355677144.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is the last part required to build QEMU for the target.
It depends on the previous two series:
  - git://gitorious.org/buildroot/buildroot.git yem-host-qemu-fixes
  - git://gitorious.org/buildroot/buildroot.git yem-new-packages

The following changes since commit c89762fc711fda1836af3b7895a8760ffda66aa6:

  Merge branches 'yem-new-packages' and 'yem-host-qemu-fixes' into yem-merge-for-target-qemu (2012-12-16 17:28:45 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-target-qemu

Yann E. MORIN (27):
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
      package/qemu: move sub-options into a sub-menu
      package/qemu: enable a static build
      package/qemu: add support for FDT

 package/Config.in                   |    1 +
 package/qemu/Config.in              |  338 +++++++++++++++++++++++++++++++++++
 package/qemu/qemu-static-curl.patch |   72 ++++++++
 package/qemu/qemu-static-sdl.patch  |   54 ++++++
 package/qemu/qemu.mk                |  290 ++++++++++++++++++++++++++++++
 5 files changed, 755 insertions(+), 0 deletions(-)
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
