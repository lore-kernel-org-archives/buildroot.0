From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 21:08:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.11
Message-ID: <20180411190852.574828842B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a0e4e865add1079e7cf8336def4f7aab00b2e0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 20 ++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d006d9365b..a0100074cd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2017.02.11, Released April 11th, 2018
+
+	Important / security related fixes.
+
+	dependencies: Blacklist tar 1.30+ and build our own host-tar
+	if needed as tar 1.30+ changed the --numeric-owner output for
+	long path names. Build host-tar before other host-dependencies
+	as they need it to extract their source tarballs.
+
+	Updated/fixed packages: apache, busybox, clamav, dhcp,
+	dnsmasq, dovecot, exim, imagemagick, irssi, jq, libcurl,
+	libpjsip, librsvg, libtasn1, libvorbis, libxml2, lz4, mariadb,
+	mbedtls, mosquitto, ntp, openblas, opencv3, openssl, patch,
+	postgresql, python-webpy, qt53d, qt5tools, quagga, rsync,
+	samba4, sngrep, tremor, wavpack, wireshark, xerces, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10856: openblas on qemu_x86_64_defconfig fails with "sgemm_..
+
 2017.02.10, Released January 31st, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 56dd82b108..8791163621 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.10
+export BR2_VERSION := 2017.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1517426000
+BR2_VERSION_EPOCH = 1523473000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
