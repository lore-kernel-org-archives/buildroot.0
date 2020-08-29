From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 21:31:44 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.5
Message-ID: <20200829192430.1D4E786BE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ec5f4eb7121a2dd8cf08c4ea805aa3c9a586b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 32 ++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 86ecec8f74..54f8e403ed 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2020.02.5, released August 29th, 2020
+
+	Important / security related fixes.
+
+	Infrastructure: Ensure RPATH entries that may be needed for
+	dlopen() are not dropped by patchelf.
+
+	BR_VERSION_FULL/setlocalversion (used by make print-version
+	and /etc/os-release): Properly handle local git tags
+
+	Updated/fixed packages: apache, at91bootstrap3, bind, boost,
+	busybox, capnproto, chrony, collectd, cpio, cryptsetup, cups,
+	cvs, dbus, docker-engine, domoticz, dovecot,
+	dovecot-pigeonhole, dropbear, efl, elixir, f2fs-tools, ffmpeg,
+	gd, gdk-pixbuf, ghostscript, glibc, grub2, gst1-plugins-bad,
+	hostapd, iputils, jasper, json-c, libcurl, libwebsockets,
+	linux, live555, mesa3d, mosquitto, mpv, nodejs, opencv,
+	opencv3, openjpeg, patchelf, perl, php, postgresql,
+	python-django, python-gunicorn, python-matplotlib, ripgrep,
+	rtl8188eu, rtl8821au, ruby, shadowsocks-libev, squid,
+	tpm2-abrmd, tpm2-tools, trousers, uacme, webkitgtk, wireshark,
+	wolfssl, wpa_supplicant, wpewebkit, xen, xlib_libX11,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12876: nodejs fails to build when host-icu has been built before
+	#13111: python-gunicorn: missing dependency on python-setuptools
+	#13121: wpa_supplicant fails to build without libopenssl enabled
+	#13141: Target-finalize fail with "depmod: ERROR: Bad version passed"
+	#13156: package live555 new license
+
 2020.02.4, released July 26th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 9598ef4eca..53608d4b99 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.4
+export BR2_VERSION := 2020.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1595750000
+BR2_VERSION_EPOCH = 1598727000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
