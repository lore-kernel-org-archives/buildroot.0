From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 20:34:43 +0200
Subject: [Buildroot] [git commit] Update for 2020.05.2
Message-ID: <20200829183018.4FED387168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e11f38130b617267101ab74dae5354557c09a4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1549e0b60751eab41e2d51899981d43d602275af)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/CHANGES b/CHANGES
index c9457f469d..251d664d69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -116,6 +116,40 @@
 	#13081: host-e2fsprogs attempts to create udev  rules.d on build host if not exists
 	#13101: BR audit2allow support
 
+2020.05.2, released August 29th, 2020
+
+	Important / security related fixes.
+
+	Infrastructure: Ensure RPATH entries that may be needed for
+	dlopen() are not dropped by patchelf.
+
+	BR_VERSION_FULL/setlocalversion (used by make print-version
+	and /etc/os-release): Properly handle local git tags
+
+	Updated/fixed packages: apache, assimp, at91bootstrap3, bind,
+	boost, busybox, capnproto, cegui, chrony, collectd, cpio,
+	cryptsetup, cups, cvs, dbus, docker-engine, domoticz, dovecot,
+	dovecot-pigeonhole, dropbear, efl, elixir, f2fs-tools, ffmpeg,
+	gd, gdk-pixbuf, ghostscript, glibc, gnuradio, grub2,
+	gst1-plugins-bad, gstreamer1-editing-services, hostapd,
+	ibm-sw-tpm2, iputils, jasper, json-c, libcurl, libressl,
+	libwebsockets, linux, live555, mesa3d, mongodb, mosquitto,
+	mpv, nodejs, opencv, opencv3, openfpgaloader, openjpeg,
+	patchelf, perl, php, postgresql, prosody, python-django,
+	python-gunicorn, python-matplotlib, ripgrep, rtl8188eu,
+	rtl8821au, ruby, shadowsocks-libev, squid, systemd,
+	tpm2-abrmd, tpm2-tools, trousers, uboot, webkitgtk, wireshark,
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
 2020.05.1, released July 25th, 2020
 
 	Important / security related fixes.
