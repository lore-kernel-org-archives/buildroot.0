From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:38:30 +0200
Subject: [Buildroot] [git commit] package/proj: needs host-sqlite
Message-ID: <20191008203256.0482681534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edd44d34ae99bf57cc2de3cb9cc37a08926ec10b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

proj needs sqlite binary to build proj.db since version 6.0.0 and
https://github.com/OSGeo/PROJ/commit/d928db15d53805d9b728b440079756081961c536

So add host-sqlite dependency

Fixes:
 - http://autobuild.buildroot.org/results/668f30b404df4e7e0886e8382c6dcf2983947c01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proj/proj.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 5a8ca3ded8..ca943141ce 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -9,7 +9,7 @@ PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
-PROJ_DEPENDENCIES = host-pkgconf sqlite
+PROJ_DEPENDENCIES = host-pkgconf host-sqlite sqlite
 
 PROJ_CFLAGS = $(TARGET_CFLAGS)
 
