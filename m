From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Aug 2019 20:06:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/rygel: fix build with NLS
Message-ID: <20190808180637.26172-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1aea53bedb9620a0881e5d4ea76820d49df2f2d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rygel/rygel.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 1f917b207e..1bf3ab4350 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -14,11 +14,13 @@ RYGEL_DEPENDENCIES = \
 	gupnp-av \
 	libgee \
 	libmediaart \
-	sqlite
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
 RYGEL_INSTALL_STAGING = YES
 # We're patching configure.ac
 RYGEL_AUTORECONF = YES
 
+RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
 	--disable-apidocs \
 	--disable-coverage \
-- 
2.20.1
