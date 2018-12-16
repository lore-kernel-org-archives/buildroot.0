From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:11:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/wine: host-wine
 also needs bison and flex
Message-ID: <20181216210756.3024E83CFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f2f18ba0fd4383920125e6231a1b929b1ec8267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Just like the build of the target wine, the build of host wine also
needs bison and flex, otherwise the build fails with:

checking for flex... no
configure: error: no suitable flex found. Please install the 'flex' package.

(and similarly for bison once host-flex is provided)

This was detected using per-package directories. It used to "work"
because host-wine comes alphabetically after host-flex and host-bison,
which are dependencies of target wine.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e4d153b16ac51df1e8294eaf2413e43131620a7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 02c4c0f155..2728436671 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,6 +10,7 @@ WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
+HOST_WINE_DEPENDENCIES = host-bison host-flex
 
 # Wine needs its own directory structure and tools for cross compiling
 WINE_CONF_OPTS = \
