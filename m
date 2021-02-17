From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 20:36:28 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.11
Message-ID: <20210217191536.4C3B386126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08e03785d3812c085c438a6040ccedc3e9f5809d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 21 +++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2236bfb5ef..441af3c9f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2020.02.11, released January 31st, 2021
+
+	Important / security related fixes.
+
+	meson: Fix ccache detection handling when per-package builds
+	are used.
+
+	Fakeroot: Fix compatibility issue with glibc 2.33
+
+	Updated/fixed packages: atftp, busybox, cereal, connman,
+	dhcpcd, dnsmasq, docker-cli, docker-engine, fakeroot,
+	intel-mediadriver, intel-microcode, jasper,
+	kodi-inputstream-adaptive, libbsd, libopenssl, linux-headers,
+	mosquitto, orc, php, postgresql, privoxy, pugixml,
+	python-bottle, python-django, python3, rauc, sox, subversion,
+	tzdata, wireguard-linux-compat, wpa_supplicant, xenomai, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13506: BR2_PACKAGE_DHCPCD missing directory creation
+
 2020.02.10, released January 31st, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 0b897a8e44..2feaf20ac8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.10
+export BR2_VERSION := 2020.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1612128000
+BR2_VERSION_EPOCH = 1613590000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index e76752e14d..a3c5adcca5 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02.10'
+RELEASE='2020.02.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
