From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Jun 2017 06:54:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/poppler: fix openjpeg support
Message-ID: <20170602045451.2297-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the last version bump --enable-libopenjpeg always needs a
parameter:
https://cgit.freedesktop.org/poppler/poppler/commit/configure.ac?id=65c5a5266462244130f110599ac5d1011a04216e

Fixes
http://autobuild.buildroot.net/results/557/557b9b386863b6c865bcca86a2b87c7028700ec4/
http://autobuild.buildroot.net/results/f27/f27380e803be50e066be1659a8512fd74d1fa6de/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5757100b5..9ccf2ea06 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -100,7 +100,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += --enable-libopenjpeg
+POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg2
 else
 POPPLER_CONF_OPTS += --enable-libopenjpeg=none
 endif
-- 
2.11.0
