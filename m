From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 23 Jun 2021 07:31:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.1.2
Message-ID: <20210623043120.11900-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PostGIS 3.1.2
2021/05/21

 * Bug Fixes

  - #4871, TopoGeometry::geometry cast returns NULL for empty
           TopoGeometry objects (Sandro Santilli)
  - #4826, postgis_tiger_geocoder Better answers when no zip is provided
           (Regina Obe)
  - #4817, handle more complex compound coordinate dystems (Paul Ramsey)
  - #4842, Only do axis flips on CRS that have a "Lat" as the first column (Paul Ramsey)
  - Support recent Proj versions that have removed pj_get_release (Paul Ramsey)
  - #4835, Adjust tolerance for geodetic calculations (Paul Ramsey)
  - #4840, Improper conversion of negative geographic azimuth to positive (Paul Ramsey)
  - #4853, DBSCAN cluster not formed when recordset length equal to minPoints (Dan Baston)
  - #4863, Update bboxes after scale/affine coordinate changes (Paul Ramsey)
  - #4876, Fix raster issues related to PostgreSQL 14 tablefunc changes
           (Paul Ramsey, Regina Obe)
  - #4877, mingw64 PostGIS / PostgreSQL 14 compile (Regina Obe, Tom Lane)
  - #4838, Update to support Tiger 2020 (Regina Obe)
  - #4890, Change Proj cache lifetime to last as long as connection (Paul Ramsey)
  - #4845, Add Pg14 build support (Paul Ramsey)

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 2f0d62728f..8a8e47ffcc 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e96afef586db6939d48fb22fbfbc9d0de5e6bc1722d6d553d63bb41441a2a7d  postgis-3.1.1.tar.gz
+sha256  2cdd3760176926704b4eb25ff3357543c9637dee74425a49082906857c7e0732  postgis-3.1.2.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 442872aea3..a0acf62e05 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.1
+POSTGIS_VERSION = 3.1.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.31.1
