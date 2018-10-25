From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 20:43:18 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.7
Message-ID: <20181025184151.712BD88F0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c9284703c496b913d936689df72d49e095442e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 27 +++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index cdf682164f..0c073bdf20 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,30 @@
+2018.02.7, Released October 25th, 2018
+
+	Important / security related fixes.
+
+	Detect and reject build paths containing '@', as this confuses
+	a number of packages, including GCC.
+
+	utils/get-developers: Add -e option for use with git
+	send-email.
+
+	utils/diffconfig: Make it work for (non-Buildroot) config
+	files not using the BR2_ prefix.
+
+	u-boot: Fix for environment image handling on big endian
+	systems.
+
+	Updated/fixed packages: binutils, ca-certificates,
+	cups-filters, erlang, libarchive, libcurl, libssh, live555,
+	ljlinenoise, file, freetype, gcc, git, gvfs, leveldb, mariadb,
+	mongoose, netsnmp, nmap, nodejs, ntp, open-plc-utils, poco,
+	psmisc, qptpd2, python-enum34, qemu, qt, qt5base, spice,
+	spice-protocols, setools, tinc, ustr, wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11396: uboot environment image checksum invalid if target is big endian
+
 2018.02.6, Released October 7th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a3db8987eb..9fb131fe86 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.6
+export BR2_VERSION := 2018.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1538896000
+BR2_VERSION_EPOCH = 1540493000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
