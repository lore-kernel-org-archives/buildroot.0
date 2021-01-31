From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 22:44:08 +0100
Subject: [Buildroot] [git commit] Update for 2020.11.2
Message-ID: <20210131213104.4FD0D812BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a93208ccec836de5178ca6ba54ca8c30cec1108c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 551cb630079316efe928d7c2eb0358a19e38fc48)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 37 +++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 51710d03ea..ba88b3f57f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2020.11.2, released January 31st, 2021
+
+	Important / security related fixes.
+
+	Download: Ensure git submodules are correctly fetched if
+	enabled for a package with <pkg>_GIT_SUBMODULES = YES and the
+	host variant is downloaded first.
+
+	Toolchain: Mark CodeSourcery Aarch64 2014.11 toolchain as not
+	having libatomic. Bootlin PowerPC-440 FP toolchain updated for
+	SecurePLT fix.
+
+	pkg-stats: Fix python 3.8+ deprecation warning.
+
+	meson: Ensure ccache is not detected and used, as it may
+	conflict with the ccache handling in Buildroot.
+
+	Updated/fixed packages: barebox, boost, brltty, dbus,
+	docker-containerd, dovecot, dovecot-pigeonhole,
+	environment-setup, firmware-imx, gcc, gerbera, glibc,
+	gmrender-resurrect, igd2-for-linux, kodi-pvr-zattoo, libclc,
+	libfuse3, libllcp, libodb-mysql, libtorrent-rasterbar,
+	libupnp, lpc32xxcdl, luarocks, mpd, multipath-tools, mutt,
+	nfs-utils, nodejs, openjpeg, openldap, opentracing-cpp,
+	openvpn, p11-kit, paho-mqtt-c, php, poppler, postgresql,
+	python3, redis, resiprocate, rpm, runc, socat, sslh, sudo,
+	sunxi-mali-mainline-driver, syslog-ng, systemd, tini,
+	tpm2-tss, trace-cmd, tzdata, uboot-tools, uhd, ushare,
+	util-linux, vlc, wavpack, wireguard-linux-compat, wolfssl,
+	xapp_xload, xorriso, zic
+
+	Removed packages: libupnp18
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13471: package/mpd/mpd.conf make use of path not created
+
 2020.11.1, released December 27th, 2020
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 753a9bdcdc..ed12abd2f0 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.1'
+RELEASE='2020.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
