From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:36:40 +0200
Subject: [Buildroot] [git commit] package/poppler: enable autodetection of
	openjpeg
Message-ID: <20160609223644.EB07D80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1aceeae2d854cf7bb6946c82d27e843da38ba63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch enables autodetection for installed openjpeg library.
Previously we were forcing to version 1.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 1113e4b..c6cd2eb 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -75,7 +75,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg1
+POPPLER_CONF_OPTS += --enable-libopenjpeg
 else
 POPPLER_CONF_OPTS += --enable-libopenjpeg=none
 endif
