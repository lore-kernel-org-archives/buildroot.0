From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 08:40:39 +0200
Subject: [Buildroot] [git commit] package/poppler: fix openjpeg support
Message-ID: <20170602064220.318D67FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3294a594cfcd121832e1b7c0e71067607a453e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the last version bump --enable-libopenjpeg always needs a
parameter:
https://cgit.freedesktop.org/poppler/poppler/commit/configure.ac?id=65c5a5266462244130f110599ac5d1011a04216e

Fixes
http://autobuild.buildroot.net/results/557/557b9b386863b6c865bcca86a2b87c7028700ec4/
http://autobuild.buildroot.net/results/f27/f27380e803be50e066be1659a8512fd74d1fa6de/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5757100..9ccf2ea 100644
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
