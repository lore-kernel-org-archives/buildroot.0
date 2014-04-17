From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:52:09 +0200
Subject: [Buildroot] [git commit] xbmc: Fix compile error with missing
	host-gettext
Message-ID: <20140417201755.B04E39C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e53d44976f224255ea62e4b9a004d52056139e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoreconf -vif lib/cpluff
autoreconf: Entering directory `lib/cpluff'
autoreconf: running: autopoint --force
Can't exec "autopoint": No such file or directory at /home/buildroot/output/host/usr/share/autoconf/Autom4te/FileUtils.pm line 345.
autoreconf: failed to run autopoint: No such file or directory
autoreconf: autopoint is needed because this package uses Gettext
make[1]: *** [lib/cpluff/configure] Error 1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
