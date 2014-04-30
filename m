From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 30 Apr 2014 17:58:07 +0200 (CEST)
Subject: [Buildroot] [PATCH 0/9 v2] Bump and improve syslinux
	(branch	yem/syslinux)
In-Reply-To: <cover.1398789775.git.yann.morin.1998@free.fr>
Message-ID: <116346836.14216421.1398873487894.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

----- Mail original -----
| De: "Yann E. MORIN" <yann.morin.1998@free.fr>
| ?: buildroot at buildroot.org
| Cc: "Thomas Lundquist" <thomasez@redpill-linpro.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
| Envoy?: Mardi 29 Avril 2014 18:49:12
| Objet: [Buildroot] [PATCH 0/9 v2] Bump and improve syslinux (branch	yem/syslinux)
| 
| From: "Yann E. MORIN" <yann.morin.1998@free.fr>
| 
| Hello All!
| 
| Here are a few patches to bump and enhance syslinux:
|   - patches 1..4: preparatory fixing and cleanup patches
|   - patches 5..6: new pacakges, dependency of the new syslinux
|   - patch   7   : actual syslinux bump
|   - patches 8..9: new options to install new types of blobs
| 
| To be noted, the syslinx build system is, well, a bit weird, to say
| the least. There is I hope extensive-enough information about this
| in the bump-patch. Please pay it a bit of attention, it is really
| convoluted, and would benefit from some in-depth review.
| 
| Thanks to Frank for his preliminary work on ucl and upx, and to
| Thomas L. whose extlinux patch prompted me to look at syslinux. ;-)
| 
| Changes v1 -> v2:
|   - explain the need for an ia32 compiler  (Arnout)
|   - make the image selection a choice  (Arnout)
|   - improve upx commit log  (Arnout)
|   - typoes  (Arnout)
|   - improve help entry for the mbr option
| 

I did a quick test on real hardware with extlinux 6.02 and BIOS-legacy configuration.
I reused the same config as for 5.10-pre4, so it's ok for me :)

Tested using serial port and menu.c32 module.

Tested-by Romain Naour <romain.naour@openwide.fr>

Note: all *.c32 modules for the target are installed in $(HOST_DIR)/usr/share/syslinux/
They can be installed in $(STAGING_DIR) instead ?

Thanks,
Romain Naour

| Regards,
| Yann E. MORIN.
| 
| 
| The following changes since commit
| a72b73852568227ee948a380c720756fbbdbec46:
| 
|   upstream glibc 2.18/2.19 works fine with microblaze (2014-04-28
|   22:16:37 +0200)
| 
| are available in the git repository at:
| 
|   git://gitorious.org/buildroot/buildroot.git
| 
| for you to fetch changes up to
| 8643aef1dfbf257e6cd7a0721d4cfd9f9e3a6dea:
| 
|   boot/syslinux: add an option to install an MBR blob (2014-04-29
|   18:41:59 +0200)
| 
| ----------------------------------------------------------------
| Frank Hunleth (2):
|       package/ucl: new package
|       package/upx: new package
| 
| Yann E. MORIN (7):
|       boot/syslinux: needs an ia32-capable compiler
|       boot/syslinux: prepare to install non-core images
|       boot/syslinux: make the sub-options a choice
|       boot/syslinux: rewrite options prompts
|       boot/syslinux: bump version
|       boot/syslinux: add option to install the EFI image
|       boot/syslinux: add an option to install an MBR blob
| 
|  boot/syslinux/Config.in                            | 39
|  ++++++++++++++---
|  .../syslinux-000-user-headers-from-sysroot.patch   | 37
|  ++++++++++++++++
|  boot/syslinux/syslinux.mk                          | 50
|  ++++++++++++++++++----
|  package/ucl/ucl.mk                                 | 12 ++++++
|  package/upx/upx.mk                                 | 28 ++++++++++++
|  5 files changed, 152 insertions(+), 14 deletions(-)
|  create mode 100644
|  boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
|  create mode 100644 package/ucl/ucl.mk
|  create mode 100644 package/upx/upx.mk
| 
| --
| .-----------------.--------------------.------------------.--------------------.
| |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
| |  conspiracy: |
| | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
| |               |
| | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
| |  There is no  |
| | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
| |   conspiracy.  |
| '------------------------------^-------^------------------^--------------------'
| _______________________________________________
| buildroot mailing list
| buildroot at busybox.net
| http://lists.busybox.net/mailman/listinfo/buildroot
| 
