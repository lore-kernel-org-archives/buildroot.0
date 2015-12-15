From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:57:10 +0100
Subject: [Buildroot] [git commit] wine: Add OpenAL dependency
Message-ID: <20151215215718.3375B81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4b489ce36fa4e97a7a0994d7cea1265ff585439
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 1a1fea0..98958ef 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -25,7 +25,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-openal \
 	--without-opencl \
 	--without-oss
 
@@ -163,6 +162,13 @@ else
 WINE_CONF_OPTS += --without-curses
 endif
 
+ifeq ($(BR2_PACKAGE_OPENAL),y)
+WINE_CONF_OPTS += --with-openal
+WINE_DEPENDENCIES += openal
+else
+WINE_CONF_OPTS += --without-openal
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 WINE_CONF_OPTS += --with-ldap
 WINE_DEPENDENCIES += openldap
