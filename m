From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 11:08:48 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.3
Message-ID: <20170602090911.D71E082A0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cae46d7b8d010392a91a5b5a87b57b72542df154
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 24 ++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f26077a..d8b369f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2017.02.3, Released June 2nd, 2017
+
+	Important / security related fixes.
+
+	Download: <pkg>-source-check fixed for packages from git.
+
+	External toolchain: musl dynamic linker symlink for mips-sf
+	corrected.
+
+	Updated/fixed packages: armadillo, audiofile, bash,
+	bluez_utils, cppcms, dbus, dhcp, dropbear, efibootmgr, efl,
+	elfutils, faketime, fbgrab, flashrom, ftop, gdb, git,
+	google-breakpad, gpsd, hans, kvm-unit-tests, kyua, libev,
+	libmicrohttpd, libminiupnpc, libtasn1, libubox, ltp-testsuite,
+	lua, madplay, mariadb, mono, mosquitto, mxml, ntp,
+	nvidia-driver, openblas, openvpn, oracle-mysql, picocom, popt,
+	postgresql, pulseview, qt5base, qwt, rabbitmq-c, redis,
+	rpcbind, rtmpdump, samba4, strongswan, sudo, vlc
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9796: source-check broken for Git downloads
+	#9871: fbgrab 1.3 won't build with BR2_REPRODUCIBLE set
+
 2017.02.2, Released May 1st, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 92ecdf1..f74d59b 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.2
+export BR2_VERSION := 2017.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1493676000
+BR2_VERSION_EPOCH = 1496390000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
