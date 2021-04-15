From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:03:48 +0200
Subject: [Buildroot] [git commit] package/postgis: add optional json-c
 dependency
Message-ID: <20210415185143.30793804AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4e7fd305ae25f205aff19b0318f57b6fdb75cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/postgis/postgis.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 92a9968993..5a2987b182 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -28,4 +28,11 @@ else
 POSTGIS_CONF_OPTS += --without-raster
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+POSTGIS_DEPENDENCIES += json-c
+POSTGIS_CONF_OPTS += --with-json
+else
+POSTGIS_CONF_OPTS += --without-json
+endif
+
 $(eval $(autotools-package))
