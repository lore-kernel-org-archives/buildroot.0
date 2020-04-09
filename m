From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Apr 2020 12:44:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.11
Message-ID: <20200409103323.153D38E20C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a6d31c87e1573bc83986471c194b944d7a365b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 21 +++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a620a69955..3e6ed5a742 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2019.02.11, released April 9th, 2020
+
+	Important / security related fixes.
+
+	core: Fix compatibility with make 4.3+. Also fixup /lib
+	references in libtool .la files, similar to how it is done for
+	/usr/*.
+
+	toolchain: Fix kernel headers validation check for external
+	toolchains.
+
+	Updated/fixed packages: barebox-aux, bluez5_utils, busybox,
+	civetweb, collectd, ffmpeg, gcc, gnutls, gvfs, haproxy,
+	hiredis, kmscube, libical, libopenssl, libsndfile,
+	linux-tools, ntp, php, pure-ftpd, screen, sysdig, tor,
+	util-linux, vala, vlc, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12746: "sysdig" package description points to http://sysdig.org, ..
+
 2019.02.10, released March 16th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 1f6c2a6dd6..0cbe1076c5 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.10
+export BR2_VERSION := 2019.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1584393000
+BR2_VERSION_EPOCH = 1586429000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
