From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Nov 2017 00:02:05 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.8
Message-ID: <20171127225537.E468C80F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d745e94683d70d12a10a413a58e833df60042c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 28 ++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 093f8f0..6387435 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2017.02.8, Released November 27th, 2017
+
+	Important / security related fixes.
+
+	Qt: 5.6 version updated to 5.6.3.
+
+	Reproducible: Do not override SOURCE_DATE_EPOCH if already set
+	in the environment.
+
+	Updated/fixed packages: apr, apr-util, arqp-standalone,
+	collectd, dvb-apps, ffmpeg, google-breakpad, gstreamer,
+	imagemagick, libfastjson, libglib2, libpjsip, libplist,
+	localedef, luajit, mesa3d, openssh, openssl, postgresql,
+	python3, python-pyqt5, qt5base, qt5canvas3d, qt5connectivity,
+	qt5declarative, qt5engineio, qt5graphicaleffects,
+	qt5imageformats, qt5location, qt5multimedia, qt5quickcontrols,
+	qt5quickcontrols2, qt5script, qt5sensors, qt5serialbus,
+	qt5serialport, qt5svg, qt5tools, qt5webchannel, qt5webkit,
+	qt5websockets, qt5x11extras, qt5xmlpatterns, quagga, ruby,
+	samba4, snmppp, ti-gfx, vboot-utils, webkitgtk, wireshark,
+	xapp_xdriinfo.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	10326: mesa3d package fails to build when BR2_SHARED_STATIC_LIBS=y
+	10361: python3 python-config script generates invalid includes
+	10501: host-localedef fails to compile on Ubuntu 17.10
+
 2017.02.7, Released October 28th, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index cbc57f5..6136593 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.7
+export BR2_VERSION := 2017.02.8
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1509216000
+BR2_VERSION_EPOCH = 1511823000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
