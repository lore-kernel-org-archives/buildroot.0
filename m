From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Oct 2019 19:04:32 +0200
Subject: [Buildroot] [PATCH 2/3] package/proj: needs host-pkgconf
In-Reply-To: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
References: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008170433.26574-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-config is used to retrieve sqlite dependency since version 6.0.0 and
https://github.com/OSGeo/PROJ/commit/322493235696097b94294f5f466a32f015a95626

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proj/proj.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 735e96bb5f..5a8ca3ded8 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -9,7 +9,7 @@ PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
-PROJ_DEPENDENCIES = sqlite
+PROJ_DEPENDENCIES = host-pkgconf sqlite
 
 PROJ_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.23.0
