From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Oct 2019 19:04:33 +0200
Subject: [Buildroot] [PATCH 3/3] package/proj: needs host-sqlite
In-Reply-To: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
References: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008170433.26574-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

proj needs sqlite binary to build proj.db since version 6.0.0 and
https://github.com/OSGeo/PROJ/commit/d928db15d53805d9b728b440079756081961c536

So add host-sqlite dependency

Fixes:
 - http://autobuild.buildroot.org/results/668f30b404df4e7e0886e8382c6dcf2983947c01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
 
-- 
2.23.0
