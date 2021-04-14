From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 14 Apr 2021 22:10:42 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/postgis: add optional pcre
 dependency
In-Reply-To: <20210414201042.3685-1-ps.report@gmx.net>
References: <20210414201042.3685-1-ps.report@gmx.net>
Message-ID: <20210414201042.3685-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgis/postgis.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 5a2987b182..c6c1b8ff50 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -35,4 +35,8 @@ else
 POSTGIS_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+POSTGIS_DEPENDENCIES += pcre
+endif
+
 $(eval $(autotools-package))
-- 
2.31.1
