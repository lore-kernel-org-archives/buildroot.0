From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 19:18:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] CHANGES: update with
 recent changes
Message-ID: <20190427171349.20897812A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f1be376dbf614d36714d4ca51e8d5432a9b4a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/CHANGES b/CHANGES
index 7b16afa5fb..622b31141a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,46 @@
+2019.02.2, Not yet released
+
+	Important / security related fixes.
+
+	Only build host-lzip / host-xz when really needed by packages,
+	not just when not available on the build host.
+
+	fs: Set FAKEROOTDONTTRYCHOWN environment variable to not
+	forward {f,l,}chown calls to libc when running under fakeroot
+	to fix issues when building in restricted environments
+	(E.G. user namespace with bubblewrap).
+
+	Linux: Also build default make target to ensure extra files
+	like the gdb scripts enabled by CONFIG_GDB_SCRIPTS are also
+	built. Notice: This may mean that extra host utilities like
+	uboot-mkimage are needed.
+
+	Defconfigs: ASUS tinker and Amarula vyasa rk3822: Support
+	larger kernel images, Atmel SAM5D27, SAM5D2,3,4 xplained:
+	Increase rootfs size to fit utilities, Raspberry Pi 64bit:
+	Include overlays in sdcard image
+
+	Updated/fixed packages: android-tools, apache, bind, binutils,
+	busybox, civetweb, cjson, copas, davfs2, docker-cli,
+	docker-containerd, docker-engine, dovecot, dovecot-pigeonhole,
+	freerdp, gerbera, ghostscript, git, gnutls, go, gst-omx,
+	gst1-plugins-ugly, haproxy, hostapd, ipsec-tools, libfreefare,
+	libfuse, libkrb5, libpng, libxml2, libxslt, linknx, linux,
+	linux-firmware, linux-tools, live555, lldp, lrzsz, lynx,
+	madplay, make, minicom, mongodb, msmtp, musl, mutt, neon,
+	netsnmp, numactl, opus, perl, php, postgresql, pure-ftpd,
+	python-urllib3, python3, qt5base, rapidxml, rpm, rsyslog,
+	ruby, runc, samba4, sane-backends, softether, stunnel,
+	sysklogd, syslinux, syslog-ng, systemd-bootchart, thttpd,
+	thrift, tiff, tor, tpm2-tools, tpm2-tss, webkitgtk,
+	yaffs2utils, wget, wpa_supplicant, wsapi, xapp_xfd,
+	xlib_libXpm, xserver_xorg-server, xz, znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11756: package/syslinux: MBR's don't fit because of binutils..
+	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
+
 2019.02.1, Released March 29th, 2019
 
 	Important / security related fixes.
