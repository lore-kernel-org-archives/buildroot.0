From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Feb 2015 13:26:52 -0300
Subject: [Buildroot] [PATCH 0/6] Build a Nios-II internal toolchain
Message-ID: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that Linux, GCC, glibc, and binutils have gained a Nios-II
port we can build an internal toolchain.

This series mostly makes sure only the right versions of the components
are chosen when building a toolchain. The last patch merely enables
the internal toolchain.

I would like to prepare a defconfig, along with support for some real life
board, but unfortunately I'm unable to do so.

First, all the publicly available design examples for the boards I have
are outdated and won't work with mainline kernel (unless we apply nasty
patches).

Second, when working on this, the board I was using died and I'm not sure
when I'll be able to replace it.

Still, before the board died, I managed to build a toolchain, and boot
U-Boot, Linux (a patched v3.19) and get to userspace. Maybe someone
can give this a shot and report how it goes.

Or maybe we can just merge it :)

Ezequiel Garcia (6):
  gcc: 4.9.2: Add patch to remove a wrong header
  binutils: nios2: Prevent selecting unsupported versions
  gcc: nios2: Prevent selecting unsupported versions
  glibc: nios2: Prevent selecting unsupported versions
  linux-headers: nios2: Prevent selecting unsupported versions
  toolchain: Enable the internal toolchain for nios2

 package/binutils/Config.in.host                         |  7 +++++--
 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch | 12 ++++++++++++
 package/gcc/Config.in.host                              |  6 +++---
 package/glibc/Config.in                                 |  1 +
 package/linux-headers/Config.in.host                    | 15 ++++++++++++---
 toolchain/Config.in                                     |  1 -
 toolchain/toolchain-buildroot/Config.in                 |  2 +-
 7 files changed, 34 insertions(+), 10 deletions(-)
 create mode 100644 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch

-- 
2.3.0
