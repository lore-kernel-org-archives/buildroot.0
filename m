From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:33:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/kismet: fix
 static build with uclibc
Message-ID: <20210426141046.2F7AA81327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91d3e2ae45cdd5cba2af60329d90fb34525ddcc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix static build with uclibc which is raised since bump to version
2020-12-R3 in commit 14522a8f9d272204763c49a21ebce5653430c612

Fixes:
 - http://autobuild.buildroot.org/results/69dcb7ac99e63fca342e4d52d9311d1ee1931911

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 72bb0380dac9ebb904c5c038a73d7a05d5582c17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kismet/kismet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 5445db0b1f..3a171af7b2 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -18,6 +18,9 @@ KISMET_DEPENDENCIES = \
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
 KISMET_SELINUX_MODULES = kismet
+# Needed because tarball configure has not been rebuilt after
+# https://github.com/kismetwireless/kismet/commit/e70968bcbca86dd448d619c40cdeaae8b7dcee98
+KISMET_AUTORECONF = YES
 
 KISMET_CONF_OPTS = --disable-debuglibs
 
