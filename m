From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Nov 2018 22:31:35 +0100
Subject: [Buildroot] [git commit] CHANGES: add recent changes
Message-ID: <20181109212926.82C97821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ffcc4ffbd69e9314c4432c7a0c1c81504daf483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/CHANGES b/CHANGES
index 752d99adf9..053519856a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,89 @@
+2018.11-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Architecture: RISC-V support (64bit) added.
+
+	Toolchain: Glibc bumped to 2.28. Fortran support for external
+	toolchains. ARM (Linaro) toolchains updated to 8.2-2018.08.
+
+	Hardening flags (RELRO) are now handled by the toolchain
+	wrapper instead of explicitly through CFLAGS/LDFLAGS, fixing a
+	number of issues.
+
+	Filesystems: Support for creating btrfs and f2fs filesystems
+	added.
+
+	Add a number of patches to fix build errors for host utilities
+	on modern distributions using glibc-2.28.
+
+	mkusers: Ensure existing group members are preserved when a
+	group is reprocessed.
+
+	printvars: Fix issue with exceeding shell command line length
+	limits for certain setups.
+
+	Workaround added for incompatibility issues between host-dtc
+	and older U-Boot and Linux kernel versions.
+
+	Detect and reject build paths containing '@', as this confuses
+	a number of packages, including GCC.
+
+	utils/diffconfig: Make it work for (non-Buildroot) config
+	files not using the BR2_ prefix.
+
+	New defconfigs: Amarula a64-relic, Bananapi m2 ultra, Embest
+	riotboard, Hardkernel Odroid XU-4, QEMU riscv64-virt.
+	olimex_a20_olinuxion_lime_mali is renamed to _legacy.
+
+	OpenCL infrastructure support added, similar to how OpenGL is
+	handled.
+
+	Linux-headers: Support for kernel headers from a custom
+	tarball / git repo added.
+
+	New packages: bird, bluez5_utils-headers, btrfs-progs,
+	checksec, davici, duktape, ell, haproxy, libclc, libcorrect,
+	libopencl, libopenresolv, nss-myhostname,
+	perl-apache-logformat-compiler, perl-appconfig,
+	perl-astro-suntime, perl-class-inspector, perl-class-load,
+	perl-class-method-modifiers, perl-class-std,
+	perl-class-std-fast, perl-cookie-baker, perl-data-dump,
+	perl-data-optlist, perl-data-uuid, perl-data-manip,
+	perl-dbd-mysql, perl-dbi, perl-devel-globaldestruction,
+	perl-devel-stacktrace, perl-devel-stacktrace-ashtml,
+	perl-device-serialport, perl-dist-checkconflicts,
+	perl-exporter-tiny, perl-file-sharedir, perl-file-slurp,
+	perl-filesys-notify-simple, perl-hash-multivalue,
+	perl-http-entity-parser, perl-http-headers-fast,
+	perl-http-multipartparser, perl-io-interface,
+	perl-io-socket-multicast, perl-json-maybexs, perl-mime-tools,
+	perl-module-implementation, perl-module-runtime, perl-moo,
+	perl-number-bytes-human, perl-package-stash, perl-params-util,
+	perl-plack, perl-posix-strftime-compiler, perl-role-tiny,
+	perl-streams-buffered, perl-sub-exporter-progressive,
+	perl-sub-install, perl-sub-quote, perl-sys-cpu,
+	perl-sys-meminfo, perl-sys-mmap, perl-time-parsedate,
+	perl-type-tiny, perl-www-form-urlencoded, perl-x10, pigpio,
+	python-async-timeout, python-falcon, python-fire,
+	python-mimeparse, python-multidict, python-passlib,
+	python-pigpio, python-pip, python-ply, python-py,
+	python-pyasn1, python-pyasn1-modules, python-pycryptodomex,
+	python-pyhamcrest, python-pysmi, python-scapy, python-semver,
+	python-serial-asyncio, python-typing, python-uvloop,
+	pythonwrapt, python-yarl, python-zeroconf, riscv-pk, sedutil,
+	spandsp, tini, waffle, xapian
+
+	Removed packages: bootutils, dsp-tools, expedite, gst-dsp,
+	xloader
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11241: ACPID shouldn't depend on BR2_x86_64 || BR2_i386
+	#11376: mdmon binary missing
+	#11396: uboot environment image checksum invalid if target is big endian
+	#11481: Docs: Is external.desc required?
+
 2018.08.2, Released October 25th, 2018
 
 	Important / security related fixes.
