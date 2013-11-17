From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 08:49:07 +0100
Subject: [Buildroot] [git commit] wvstreams: remove tcl dependency support
Message-ID: <20131117075010.C1AFD9BC8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=157101726c3d490d20cae4f3ad61197330b06df1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As far as I can tell enabling tcl support has no affect on the actual
library.  Furthermore, wvstreams has been checking for/linking against
tcl 8.3 which has never been supported in buildroot as far as I can tell
(8.4 added in 2005).  That being said there is clearly no reason to keep
this around.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wvstreams/wvstreams.mk |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index b4f7d89..41155a7 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -22,7 +22,8 @@ WVSTREAMS_CONF_OPT += \
 	--with-openssl \
 	--with-zlib \
 	--without-pam \
-	--disable-warnings
+	--disable-warnings \
+	--without-tcl
 
 # needed for openssl detection when statically linking (as ssl needs lz)
 WVSTREAMS_CONF_ENV += LIBS=-lz
@@ -38,13 +39,6 @@ else
 	WVSTREAMS_CONF_OPT += --without-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_TCL),y)
-	WVSTREAMS_DEPENDENCIES += tcl
-	WVSTREAMS_CONF_OPT += --with-tcl
-else
-	WVSTREAMS_CONF_OPT += --without-tcl
-endif
-
 ifeq ($(BR2_PACKAGE_QT),y)
 	WVSTREAMS_DEPENDENCIES += qt
 	WVSTREAMS_CONF_OPT += --with-qt
