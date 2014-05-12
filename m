From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:55:54 +0200
Subject: [Buildroot] [git commit] package/xbmc: add missing dependency on
	libtheora
Message-ID: <20140512205829.9886F9CBAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45f3af23405b10d51fed63d555f1cdf7c89cbf81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc/xbmc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 1bfc17d..c7a4607 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -127,6 +127,10 @@ ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
 XBMC_DEPENDENCIES += wavpack
 endif
 
+ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
+XBMC_DEPENDENCIES += libtheora
+endif
+
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
 	cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap
