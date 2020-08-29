From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 21:52:14 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.5
Message-ID: <20200829194803.18F92817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b13d173016095df1d6299318c97d62b06db5875e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6ec5f4eb7121a2dd8cf08c4ea805aa3c9a586b84)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index ea2749788e..9014ef7b02 100644
--- a/CHANGES
+++ b/CHANGES
@@ -381,6 +381,38 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
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
