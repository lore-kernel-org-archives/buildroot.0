From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:46 +0100
Subject: [Buildroot] [PATCH 0/10] kconfig infra: enhancements,
	and more packages migrated (branch yem/pdp/kconfig)
Message-ID: <cover.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a collaborative work of Thomas DS and I to improve the
kconfig package infrastructure, so that it is able to handle both the
Linux kernel and the Barebox bootloader.

The first part of the series prepares the kconfig package infrastructure:
  - support config files bundled in the package
  - support defconfig files
  - hide kconfig-related targets when the package is disabled

Then it prepares the Linux package for being migrated to use the kconfig
package infrastructure, plus a little extra to ease collaborative work:
  - qstrip the path to the custom (def)config file
  - do the actual migration
  - do not store absolute path for the initramfs source tree

Eventually, it switches Barebox to using the package infrastructure as
well:
  - qstrip the path to the custom (def)config file
  - do the actual migration


Regards,
Yann E. MORIN.


The following changes since commit 088ca7f95988bc846f224e43b2a5e11fa6113334:

  mjpegtools: add optional support for png/sdl/sdl_gfx/X11/gtk2 (2015-02-03 14:23:09 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pdp/kconfig

for you to fetch changes up to ea421877479d951601ffcf49fd5bce2d9d4f96b5:

  barebox: migrate to the kconfig infrastructure (2015-02-03 15:05:05 +0100)

----------------------------------------------------------------
Thomas De Schampheleire (9):
      kconfig infra: support built-in config files
      kconfig infra: add support for defconfig files
      kconfig infra: make update-config/defconfig handling symmetrical
      kconfig infra: remove all install stamp files
      linux: qstrip the path to the custom configuration file
      linux: migrate to the kconfig infrastructure
      linux: avoid unnecessary changes in defconfig for INITRAMFS_SOURCE
      barebox: qstrip the path to the custom configuration file
      barebox: migrate to the kconfig infrastructure

Yann E. Morin (1):
      kconfig infra: only provide foo-*config targets when the package is enabled

 boot/barebox/barebox.mk | 35 ++++++-----------------------------
 linux/linux.mk          | 42 ++++++++++++------------------------------
 package/pkg-kconfig.mk  | 38 +++++++++++++++++++++++++++++++++++---
 3 files changed, 53 insertions(+), 62 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
