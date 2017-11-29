From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 08:37:49 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] Update for 2017.08.2
Message-ID: <20171129073333.760E281D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d02d0be586bfdaff926a7c6c8930d186cdd92b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 35 +++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index cfe4894..cf04f02 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2017.08.2, Released November 28th, 2017
+
+	Important / security related fixes.
+
+	Qt: 5.6 version updated to 5.6.3.
+
+	Reproducible: Do not override SOURCE_DATE_EPOCH if already set
+	in the environment.
+
+	Makefiles: Workaround include order issues for certain make
+	versions by explicitly sorting the result of wildcard where it
+	matters.
+
+	Updated/fixed packages: apr, apr-util, arqp-standalone,
+	azure-iot-sdk-c, collectd, dvb-apps, ffmpeg, go-bootstrap,
+	google-breakpad, gstreamer, imagemagick, irssi, jimtcl,
+	kvm-unit-test, libcurl, libfastjson, libglib2, libidn,
+	libpjsip, libplist, localedef, lttng-tools, luajit, mesa3d,
+	moarvm, mp4v2, openssh, openssl, oracle-mysql, postgresql,
+	python3, python-pyqt5, qt, qt5base, qt5canvas3d,
+	qt5connectivity, qt5declarative, qt5engineio,
+	qt5graphicaleffects, qt5imageformats, qt5location,
+	qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5script,
+	qt5sensors, qt5serialbus, qt5serialport, qt5svg, qt5tools,
+	qt5webchannel, qt5webkit, qt5websockets, qt5x11extras,
+	qt5xmlpatterns, quagga, redis, ruby, samba4, sdl2, snmppp,
+	swupdate, ti-gfx, uboot-tools, usb_modeswitch, vboot-utils,
+	webkitgtk, wget, wireshark, xapp_xdriinfo.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	10326: mesa3d package fails to build when BR2_SHARED_STATIC_LIBS=y
+	10361: python3 python-config script generates invalid includes
+	10501: host-localedef fails to compile on Ubuntu 17.10
+
 2017.08.1, Released October 23rd, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index f2afe80..4a07516 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.08.1
+export BR2_VERSION := 2017.08.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1508790000
+BR2_VERSION_EPOCH = 1511938000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
