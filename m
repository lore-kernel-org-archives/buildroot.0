From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 25 Oct 2015 20:33:52 +0100
Subject: [Buildroot] [PATCH 0/4] Supporting a second Barebox build to build
	the MLO/SPL
Message-ID: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-set in 4 parts adds support for building a second barebox build (the
x-loader). This implements the design proposed in
http://elinux.org/Buildroot#Todo_list:
1. Have boot/barebox/ containing the common stuff.
2. Add two separate packages boot/barebox-boot/ and boot/barebox-xload/.
3. There is only one version selection, but each package allows to
   define the configuration to be used.
4. Design is a little bit like package/gcc, where we have multiple gcc builds,
   but share a lot of common definitions between the packages.

To demonstrate that it works as advertized, the last patch adds a defconfig for
the beaglebone black that makes use of the added functionality.

Pieter Smith (4):
  barebox: prepare for x-loader build
  barebox: adds option to build x-loader
  barebox: user selection of build output images
  beaglebone: adds barebox bootloader defconfig

 boot/barebox/Config.in                        | 92 +++++++++++++++++++++++++++
 boot/barebox/barebox-boot/barebox-boot.hash   |  1 +
 boot/barebox/barebox-boot/barebox-boot.mk     | 89 ++++++++++++++++++++++++++
 boot/barebox/barebox-xload/barebox-xload.hash |  1 +
 boot/barebox/barebox-xload/barebox-xload.mk   | 51 +++++++++++++++
 boot/barebox/barebox.mk                       | 60 +----------------
 configs/beaglebone_barebox_defconfig          | 38 +++++++++++
 7 files changed, 273 insertions(+), 59 deletions(-)
 create mode 120000 boot/barebox/barebox-boot/barebox-boot.hash
 create mode 100644 boot/barebox/barebox-boot/barebox-boot.mk
 create mode 120000 boot/barebox/barebox-xload/barebox-xload.hash
 create mode 100644 boot/barebox/barebox-xload/barebox-xload.mk
 create mode 100644 configs/beaglebone_barebox_defconfig

-- 
2.1.4
