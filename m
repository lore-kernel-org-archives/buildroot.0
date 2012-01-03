From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Tue,  3 Jan 2012 19:49:26 +0100
Subject: [Buildroot] [PATCH 0/2] V2: Add defconfigs for LPC3250 boards
Message-ID: <1325616568-17471-1-git-send-email-abelloni@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patches will add defconfigs for the three LPC3250
development boards supported by the LPClinux.com community. They also add
support for their bootloaders, kickstart and s1l.

I have successfully used buildroot to build my u-boot, kernel, rootfs and
bootloaders images for a custom board based on the ea3250 design.

I chose to use the 2.6.34 repository as the 2.6.39.2 doesn't seem to be
fully functionnal (see
http://lpclinux.com/Forums/LPC32xxLinuxPatch0046).

I also fixed the gcc version to 4.3.x as using a later version seems to
break the network drivers.

Quite a lot of changes were needed to be able to build kickstart and s1l with a
uclibc toolchain but I'm trying to push those patches upstream.

Alexandre Belloni (2):
  lpc32xx: Add CDL to the available bootloaders
  Add defconfigs for LPC3250 boards

 boot/Config.in                                     |    1 +
 boot/lpc32xxcdl/Config.in                          |   10 +
 .../lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch |   52 ++
 .../lpc32xxcdl-2.11-delete_redundant_files.patch   |  964 ++++++++++++++++++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch |  183 ++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch      |  521 +++++++++++
 boot/lpc32xxcdl/lpc32xxcdl.mk                      |   54 ++
 configs/ea3250_defconfig                           |   39 +
 configs/fdi3250_defconfig                          |   39 +
 configs/phy3250_defconfig                          |   39 +
 10 files changed, 1902 insertions(+), 0 deletions(-)
 create mode 100644 boot/lpc32xxcdl/Config.in
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl.mk
 create mode 100644 configs/ea3250_defconfig
 create mode 100644 configs/fdi3250_defconfig
 create mode 100644 configs/phy3250_defconfig

-- 
1.7.7.3
