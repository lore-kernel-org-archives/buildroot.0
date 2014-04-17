From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Apr 2014 07:26:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] xbmc: Fix compile error with missing
	host-gettext
Message-ID: <1397712379-3474-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf -vif lib/cpluff
autoreconf: Entering directory `lib/cpluff'
autoreconf: running: autopoint --force
Can't exec "autopoint": No such file or directory at /home/buildroot/output/host/usr/share/autoconf/Autom4te/FileUtils.pm line 345.
autoreconf: failed to run autopoint: No such file or directory
autoreconf: autopoint is needed because this package uses Gettext
make[1]: *** [lib/cpluff/configure] Error 1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Use AUTOPOINT=/bin/true instead of depending on host-gettext (Thomas)
v1: http://patchwork.ozlabs.org/patch/338691/

 package/xbmc/xbmc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 7453db5..1bfc17d 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -129,7 +129,7 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
-	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
+	cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap
 endef
 XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
 
-- 
1.7.10.4
