From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Aug 2016 11:24:52 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20160806092514.B579F80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=960cc977006ba84442c9fa447e1fbf1c4512a743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/CHANGES b/CHANGES
index 193b4df..4d85f0e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,94 @@
+2016.08, Not yet released:
+
+	Fixes all over the tree and new features.
+
+	Toolchain: Fortran support added. eglibc support removed, musl
+	support no longer experimental. Blackfin and Microblaze
+	support for internal uClibc-ng toolchain, m68k/coldfire
+	improvements. The check for unsafe (build host) directories
+	access (/usr/include and /usr/lib) is now enabled by default.
+	Unused locales are now purged by default to save space (and
+	the default list of locales shrunk). The option to control
+	this has now moved from the toolchain menu to system
+	configuration.
+
+	Legal info improvements: sources are now hardlinked instead of
+	copied if possible to save space. Patches and extra downloads
+	are also saved.
+
+	An experimental configuration knob (BR2_REPRODUCIBLE) has been
+	added to make the builds more reproducible (E.G. less
+	differences in the binary output between builds of the same
+	configuration). This is still work in progress.
+
+	An option to execute a custom script inside the fakeroot
+	environment used to the generate the filesystem (E.G. to tweak
+	permissions or similar) has been added.
+
+	Git support now supports git submodules if
+	<pkg>_GIT_SUBMODULES is enabled.
+
+	Hash files for integritry validation have been added for all
+	packages.
+
+	Scanpypi utility to help creating packages from the Python
+	package index (pypi) has been added.
+
+	The makedevs utility now has support for adding file
+	capabilities using extended attributes.
+
+	New defconfigs: Arcturus uCP1020, Atmel sama5d{2,3,4} xplained
+	development configs, Blackfin GDB simulator, Linksprite
+	pcDuino, Minnow Board Max graphical demo, NXP i.MX25 PDK,
+	i.MX51 EVK, i.MX6UL Pico, i.MX7 sabresd, QEMU MIPS32r6{,el} and
+	MIPS64r6{,el} malta, Roseapple Pi, Samsung Snow chromebook,
+	Toradex Apalis i.MX6 COM, TS-4800, x86-64 PC BIOS and EFI
+	demos. A number of defconfigs have been updated and extended
+	to generate SD card images. Synopsys HS38 VDK defconfig removed.
+
+	New packages: 4th, acpica, acpitool, alljoyn, alljoyn-base,
+	alljoyn-tcl, alljoyn-tcl-base, argparse, babeld, batman-adv,
+	circus, dante, docker-containerd, docker-engine, domoticz,
+	efibootmgr, efivar, ficl, fwup, gsettings-desktop-schemas,
+	gtksourceview, gupnp-dlna, gupnp-tools, igd2-for-linux,
+	jemalloc, kmsxx, lapack, lft, libaacs, libamcodec, libbdplus,
+	libcoap, libdvdcss, libebur128, libfastjson, libminiupnpc,
+	libnatpmp, libpqxx, libuio, libvdpau, log4cpp, minissdpd,
+	mxsldr, nginx-nasxi, nginx-upload, ninja, nodm, odroid-mali,
+	odroid-scripts, omxplayer, openblas, openmpi, openzwave,
+	p7zip, pdbg, python-argh, python-dataproperty,
+	python-dateutil, python-dialog3, python-dicttoxml,
+	python-dominate, python-engineio, python-flask-jsonrpc,
+	python-flask-login, python-humanize, python-pathtools,
+	python-pathvalidate, python-pillow, python-prompt-toolkit,
+	python-pytablewriter, python-pytz, python-scapy3k,
+	python-sdnotify, python-socketio, python-tomako,
+	python-ubjson, python-u-msgpack, python-watchdog,
+	python-wcwidth, python-xlrd, python-xlsxwriter,
+	python-xlutils, python-xlwt, rs485conf, runc, sdl2_gfx,
+	sdl2_image, sdl2_ttf, shellinabox, sphinxbase, stella,
+	supertuxkart, systemd-bootchart, tekui, terminology, tinycbor,
+	tinydtls, ti-sgx-demos, ti-sgx-km, ti-sgx-um, tunctl, wavemon,
+	wiringpi, xen
+
+	Deprecated packages: ipkg, sstrip
+
+	Removed packages: sunxi-mali-prop
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#8931: segment fault when compile argp-help.c using aarch64-bu...
+	#8966: eglfs error. buildroot don't compile the library libeglfs.so
+	#8971: build for beaglebone fails
+	#8986: qt5imageformats fails to build on AArch64
+	#8991: grub2 fails to compile
+	#9001: Nodejs option not available
+	#9006: gcc with c++ support v4 and v5 fail to compile on fedora 24
+	#9016: arceb-buildroot-linux-uclibc ld uses incorrect default format
+	#9066: 8139TOO - faulty behaviour
+	#9086: Syntax Error (missing ")" in boot/uboot/uboot.mk on line 203)
+	#9091: U-Boot fails to boot with large ramdisk
+
 2016.05, Released May 31st, 2016
 
 	Minor fixes.
