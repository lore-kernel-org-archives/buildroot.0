From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:39:22 +0200
Subject: [Buildroot] [git commit] package/inotify-tools: bump to version
 3.20.2.2
Message-ID: <20200618203740.784ED8111E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cbb7141e7a397a0fa8f0ad05d8ece3042901759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream provided tarball. Drop autoreconf.

Update homepage URL. The old URL redirects to the new one.

Format hash file with two spaces delimiters.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/inotify-tools/Config.in          | 2 +-
 package/inotify-tools/inotify-tools.hash | 4 ++--
 package/inotify-tools/inotify-tools.mk   | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index 1ca01b6e1e..6b113d9e42 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 	  filesystem events. Provides the 'inotifywait' and
 	  'inotifywatch' binaries.
 
-	  https://github.com/rvoicilas/inotify-tools
+	  https://github.com/inotify-tools/inotify-tools
diff --git a/package/inotify-tools/inotify-tools.hash b/package/inotify-tools/inotify-tools.hash
index 83dc22b4a2..5984827f8b 100644
--- a/package/inotify-tools/inotify-tools.hash
+++ b/package/inotify-tools/inotify-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a433cc1dedba851078276db69b0e97f9fe41e4ba3336d2971adfca4b3a6242ac inotify-tools-3.20.1.tar.gz
-sha256 e41fc126320a79ed53b5aa3386f059f7d10770856d6fd714ab80a96ce6bd09d6 COPYING
+sha256  c5b018567814ea555d716f518b6e3ae243c733f7bd3e8585d81748a6da286f3c  inotify-tools-3.20.2.2.tar.gz
+sha256  e41fc126320a79ed53b5aa3386f059f7d10770856d6fd714ab80a96ce6bd09d6  COPYING
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 63626307c2..b410ade33d 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-INOTIFY_TOOLS_VERSION = 3.20.1
-INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
+INOTIFY_TOOLS_VERSION = 3.20.2.2
+INOTIFY_TOOLS_SITE = https://github.com/inotify-tools/inotify-tools/releases/download/$(INOTIFY_TOOLS_VERSION)
 INOTIFY_TOOLS_LICENSE = GPL-2.0+
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
-INOTIFY_TOOLS_AUTORECONF = YES
 
 $(eval $(autotools-package))
