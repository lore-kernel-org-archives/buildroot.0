From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 22:28:49 +0200
Subject: [Buildroot] [git commit] CHANGES: update in preparation for
 2018.05-rc1
Message-ID: <20180509202910.C3B228C5F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54e3bcb8934004f417d79e1a6a8b4bbc64f954cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/CHANGES b/CHANGES
index 29a4937a9d..1ca80c244e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,100 @@
+2018.05-rc1, Released May 9th, 2018
+
+	Toolchain: glibc bumped to 2.27, musl bumped to 1.1.19,
+	uClibc-ng 1.0.30, Linux kernel headers bumped to 4.16.x.
+
+	Architecture: support for the Blackfin architecture has been
+	removed.
+
+	Numerous packages updated to have hashes for their license
+	files.
+
+	Systemd can now be built with uClibc toolchains.
+
+	Linux: addition of BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF and
+	BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to support building Linux
+	kernel configurations that need libelf on the host or openssl
+	on the host.
+
+	Coding style:
+	- all Python scripts are now verified with flake8
+	- check-package extended to check all Config.in and .mk files
+	  in tree, not only the ones in package/
+
+	Infrastructure:
+
+	- The download infrastructure has seen a major overhaul, with
+	  the main visible new feature being Git caching: a package
+	  fetched from Git no longer needs to be re-cloned entirely
+	  everytime its version is changed. Anoter visible change is
+	  that the download folder now has subfolders per package. See
+	  http://lists.busybox.net/pipermail/buildroot/2018-April/217923.html
+	  for more details about those changes.
+
+	- The logic that generates the root filesystem images has been
+	  reworked, with the main goal of allowing several filesystem
+	  images to be produced in parallel, also a requirement for
+	  top-level parallel build. Now, a .tar filesystem image is
+	  always created, and re-extracted in a private directory to
+	  create each format-specific filesystem image.
+
+	- A new package infrastructure was introduced for Go-based
+	  packages: golang-package.
+
+	- Dependencies on extraction tools are now handled as proper
+	  per-package dependencies, using
+	  <pkg>_EXTRACT_DEPENDENCIES. Beyond a cleanup, this is also a
+	  preparation step for top-level parallel build support.
+
+	- When a file being downloaded is part of a package with a
+	  .hash file, but there is no hash listed for this file, the
+	  file is now preserved in the download directory rather than
+	  removed. This helps when updating a package, as it gives the
+	  ability to easily calculate the hash of the file.
+
+	- Addition of '<pkg>-show-recursive-depends' and
+	  '<pkg>-show-recursive-rdepends' make targets, to
+	  respectively display the recursive list of dependencies and
+	  the recursive list of reverse dependencies of a given
+	  package.
+
+	- The /etc/shells file is now automatically generated with the
+	  list of shell programs installed on the system.
+
+	- Addition of -Ofast optimization level as an available
+	  option.
+
+	Major updates: Go updated to 1.10, Erlang bumped to 20.3, Qt5
+	bumped to 5.10.1.
+
+	New packages: 18xx-ti-utils, abootimg, bluez-alsa, brotli,
+	chipmunk, clang, docker-compose, docker-proxy, flare-engine,
+	flare-game, gst1-interpipe, gstreamer1-editing-services,
+	hackrf, i2pd, imx-alsa-plugins, imx-mkimage, libcdio-paranoia,
+	libkrb5, llvm, pixiewps, python-backports-ssl-match-hostname,
+	python-cached-property, python-cython, python-docker,
+	python-dockerpty, python-docker-pycreds,
+	python-flask-sqlalchemy, python-functools32, python-influxdb,
+	python-json-models, python-libusb1, python-networkx,
+	python-psycopg2, python-pymodbus, python-sqlalchemy,
+	python-subprocess32, python-texttable,
+	python-websocket-client, python-yieldfrom, quotatool, reaver,
+	snort, sunxi-mali-mainline, sunxi-mali-mainline-driver, tk,
+	tpm2-abrmd, tpm2-tools, tpm2-tss, udftools, vte, woff2.
+
+	New defconfigs: ARC HS Development Kit, Arcturus ucls1012a,
+	Freescale i.MX6UL EVK (with vendor kernel), Freescale i.MX6
+	SoloLite EVK (with vendor kernel), Freescale i.MX31 3Stack,
+	Freescale i.MX8Q EVK Freescale p1025twr, Freescale t1040d4rdb,
+	Qemu PPC64 E5500, SolidRun ClearFog Base, Tinker RK3288, Vyasa
+	RK3288,
+
+	Removed packages: iqvlinux, kodi-adsp-*, mplayer
+
+	Removed defconfigs: ci40, firefly_rk3288,
+	freescale_p1010rdb_pa, freescale_mpc8315erdb, riotboard,
+	teliv_evk_pro3
+
 2018.02.1, Released April 9th, 2018
 
 	Important / security related fixes.
