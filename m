From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:48:05 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/rygel: fix build
 with NLS
Message-ID: <20190902114357.59F2489019@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4475ab561087e0cc82f6e93bcec51ce59788c64c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/1aea53bedb9620a0881e5d4ea76820d49df2f2d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7511fa25650d58b5359e9f30d738ef48212aac6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
