From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:00:22 +0100
Subject: [Buildroot] [git commit] package/wine: host-wine also needs bison
 and flex
Message-ID: <20181211215709.E5FB28CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4d153b16ac51df1e8294eaf2413e43131620a7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/wine/wine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index dc559efd95..78c8e6ab63 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,6 +10,7 @@ WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
+HOST_WINE_DEPENDENCIES = host-bison host-flex
 
 # Wine needs its own directory structure and tools for cross compiling
 WINE_CONF_OPTS = \
