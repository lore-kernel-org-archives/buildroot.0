From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 23:13:58 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.3
Message-ID: <20190223221207.65AFE837F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8147c71039f775c8b10e6eceab78d43bb557bde5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 30 ++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f99c996eb5..45a153c799 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2018.11.3, Released February 23th, 2019
+
+	Important / security related fixes.
+
+	Ensure the PLATFORM and OS environment variables are not set,
+	as they cause build issues for some packages.
+
+	The package list infrastructure now correctly handles packages
+	installing files with old mtime.
+
+	Linux: Skip hash checks for user supplied downloadable
+	patches, as no hash checksums are available for those.
+
+	scanpypi: protect against zip-slip vulnerability in zip/tar
+	handling
+
+	Download: fixes for SSH/SCP support
+
+	SDK: Fix handling of relative symlinks (targets starting with
+	'.' or '..')
+
+	Updated/fixed packages: bind, dhcpcd, docker-compose,
+	docker-containerd, docker-engine, dovecot, dovecot-pigeonhole,
+	dtc, efivar, ghostscript, gnuradio, imagemagick, jpeg-turbo,
+	libarchive, libb64, libcurl, libgeotiff, libgpiod, libid3tag,
+	libupnp18, log4cplus, madplay, meson, mosquitto, openssh, php,
+	poco, postgresql, proftpd, pulseaudio, python, python-django,
+	python3, qt5base, reaver, runc, sg3_utils, sqlcipher,
+	swupdate, systemd, unzip, webkitgtk, xenomai
+
 2018.11.2, Released January 30th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index e2d016403b..105ee47322 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11.2
+export BR2_VERSION := 2018.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1545257000
+BR2_VERSION_EPOCH = 1550960000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
