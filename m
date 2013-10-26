From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 13:58:23 +0200
Subject: [Buildroot] [git commit] freetype: fix host build
Message-ID: <20131026115941.DC9E19BBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=129abd31b7ef3e3c3c4f43324e23367f942940c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b49/b49c1c502215c7972d61c900e876909c9e79c312/

PNG support has to be explictly disabled now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1ca779e..93fb3db 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -19,6 +19,7 @@ FREETYPE_DEPENDENCIES = host-pkgconf \
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
+HOST_FREETYPE_CONF_OPT = --without-png
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
