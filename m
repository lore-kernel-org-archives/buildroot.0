From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:34 +0200
Subject: [Buildroot] [PATCH 0/12 v3] Bump and improve syslinux (branch
	yem/syslinux)
Message-ID: <cover.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few patches to bump and enhance syslinux:
  - patches 1..4: preparatory fixing and cleanup patches
  - patches 5..6: new pacakges, dependency of the new syslinux
  - patch   7   : actual syslinux bump
  - patches 8..9: new options to install new types of blobs

To be noted, the syslinx build system is, well, a bit weird, to say
the least. There is I hope extensive-enough information about this
in the bump-patch. Please pay it a bit of attention, it is really
convoluted, and would benefit from some in-depth review.

Thanks to Frank for his preliminary work on ucl and upx, and to
Thomas L. whose extlinux patch prompted me to look at syslinux. ;-)


Changes v2 -> v3:
  - install syslinux files in sub-dir of images/  (Romain)
  - install syslinux .c32 modules  (Romain)
  - typoes

Changes v1 -> v2:
  - explain the need for an ia32 compiler  (Arnout)
  - make the image selection a choice  (Arnout)
  - improve upx commit log  (Arnout)
  - typoes  (Arnout)
  - improve help entry for the mbr option


Regards,
Yann E. MORIN.


The following changes since commit 26132bac8dc4c2d3130c0d239ab4e174dd8b221c:

  libwebsockets: disable checks for C++ compiler (2014-05-02 15:07:43 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/syslinux

for you to fetch changes up to fd8cb5b156e73680f07c222dca6a812e47ec8e3c:

  boot/syslinux: install in a sub-dir of $(BINARIES_DIR) (2014-05-02 18:33:53 +0200)

----------------------------------------------------------------
Frank Hunleth (2):
      package/ucl: new package
      package/upx: new package

Yann E. MORIN (10):
      boot/syslinux: needs an ia32-capable compiler
      boot/syslinux: prepare to install non-core images
      boot/syslinux: make the sub-options a choice
      boot/syslinux: rewrite options prompts
      boot/syslinux: move comments out of define-block
      boot/syslinux: bump version
      boot/syslinux: add option to install the EFI image
      boot/syslinux: add an option to install an MBR blob
      boot/syslinux: add option to install c32 modules
      boot/syslinux: install in a sub-dir of $(BINARIES_DIR)

 boot/syslinux/Config.in                            | 49 +++++++++++++++--
 .../syslinux-000-user-headers-from-sysroot.patch   | 37 +++++++++++++
 boot/syslinux/syslinux.mk                          | 63 ++++++++++++++++++----
 package/ucl/ucl.mk                                 | 12 +++++
 package/upx/upx.mk                                 | 28 ++++++++++
 5 files changed, 173 insertions(+), 16 deletions(-)
 create mode 100644 boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
 create mode 100644 package/ucl/ucl.mk
 create mode 100644 package/upx/upx.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
