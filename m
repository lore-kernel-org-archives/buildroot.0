From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 20:59:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.11
Message-ID: <20190223195810.95A198B875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56347fc8eabc7c563bb9794ac5a9429fb9d2a6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 22 ++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2bc4258a06..819950ee5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2018.02.11, Released February 23th, 2019
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
+	Updated/fixed packages: bind, dhcpcd, dovecot, ghostscript,
+	gnuradio, imagemagick, jpeg-turbo, libarchive, libb64,
+	libcurl, libid3tag, madplay, mosquitto, openssh, php,
+	postgresql, proftpd, python, python-django, python3, qt5base,
+	sqlcipher, swupdate, systemd, unzip, webkitgtk
+
 2018.02.10, Released January 31th, 2019
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 2ee7f92aa9..37504ae1ce 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.10
+export BR2_VERSION := 2018.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1548952000
+BR2_VERSION_EPOCH = 1550952000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
