From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 08:46:34 +0200
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: bump version
Message-ID: <20190407065145.EC9538DEF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d99eb67ce04c3b864c2e7f3dae73cebcff863b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Actually build fails with musl libc due to missing header inclusion
<unistd.h> (usually included by stdlib.h) in package code which in order
contains type definition of ssize_t.
A Git repository has been setted up for this project as upstream, and
contains a commit which solves build failure removing the use of ssize_t
at all.
No other http tarballs have been released on current site, so
development seems to continue on Git repository.

- Set SITE_METHOD = git
- Switch site to: https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb
- Bump version to latest commit to include commit which fixes build
  failure.

Fixes:
http://autobuild.buildroot.net/results/c84/c84b65642cb1b2d246f3a92ac957af5c5fcb86e8/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bayer2rgb-neon/bayer2rgb-neon.hash | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index bc0d6b1d51..1f4f5f33b3 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b14c8b2b86207fe8222f79bef83dc3ae94222827f1882466ca65705238d15085 bayer2rgb-neon-v0.4.tar.bz2
+sha256 1a84dcf6557c2017ebe258502f60575e0971511c548fc88aee5ab68ca0bb268a bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index f6914e4214..02651dcfee 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BAYER2RGB_NEON_VERSION = v0.4
-BAYER2RGB_NEON_SOURCE = bayer2rgb-neon-$(BAYER2RGB_NEON_VERSION).tar.bz2
-BAYER2RGB_NEON_SITE = https://git.phytec.de/bayer2rgb-neon/snapshot
+BAYER2RGB_NEON_VERSION = bef3ecafe290d61a50fd27da3e5d0df6f4b88045
+BAYER2RGB_NEON_SITE = https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb.git
+BAYER2RGB_NEON_SITE_METHOD = git
 BAYER2RGB_NEON_LICENSE = GPL-3.0
 BAYER2RGB_NEON_LICENSE_FILES = COPYING
 BAYER2RGB_NEON_INSTALL_STAGING = YES
