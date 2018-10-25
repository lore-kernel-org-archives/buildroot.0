From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 14:40:48 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] Update for 2018.08.2
Message-ID: <20181025124022.13E2988ECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=507020139190aaf44793c3c901321d23ba476c13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 30 ++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index aa5c2ad047..303ff8f7f4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2018.08.2, Released October 25th, 2018
+
+	Important / security related fixes.
+
+	Workaround added for incompatibility issues between host-dtc
+	and older U-Boot and Linux kernel versions.
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
+	cups-filters, dtc, erlang, file, freetype, gcc, git, gvfs,
+	jasper, leveldb, libarchive, libssh, live555, ljlinenoise,
+	mariadb, mongoose, netsnmp, nmap, nodejs, ntp, open-plc-utils,
+	poco, psmisc, ptpd2, python-enum34, qemu, qt, qt5base,
+	setools, spice, spice-protocol, tinc, ustr, wireshark,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11396: uboot environment image checksum invalid if target is big endian
+
 2018.08.1, Released October 7th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index d193a9ae10..3179ee759b 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08.1
+export BR2_VERSION := 2018.08.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1538904000
+BR2_VERSION_EPOCH = 1540470000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
