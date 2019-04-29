From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 13:54:05 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.2
Message-ID: <20190429175907.B06B1811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7620c10c190a96b8f2378e018f6637f7693ac6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b4b3e7cd4618e56f5c6a8ea098ffd573a2e868e)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/CHANGES b/CHANGES
index ae6a3bb95c..15cdb0715c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,47 @@
+2019.02.2, Released April 29th, 2019
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
+	gst1-plugins-base, gst1-plugins-ugly, haproxy, hostapd,
+	ipsec-tools, libfreefare, libfuse, libkrb5, libpng, libxml2,
+	libxslt, linknx, linux, linux-firmware, linux-tools, live555,
+	lldp, lrzsz, lynx, madplay, make, minicom, mongodb, msmtp,
+	musl, mutt, neon, netsnmp, numactl, opus, perl, php,
+	postgresql, pure-ftpd, python-urllib3, python3, qt5base,
+	rapidxml, rpm, rsyslog, ruby, runc, samba4, sane-backends,
+	softether, stunnel, sysklogd, syslinux, syslog-ng,
+	systemd-bootchart, thttpd, thrift, tiff, tor, tpm2-tools,
+	tpm2-tss, webkitgtk, yaffs2utils, wget, wpa_supplicant, wsapi,
+	xapp_xfd, xapp_xload, xlib_libXpm, xserver_xorg-server, xz,
+	znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11756: package/syslinux: MBR's don't fit because of binutils..
+	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
+
 2019.02.1, Released March 29th, 2019
 
 	Important / security related fixes.
