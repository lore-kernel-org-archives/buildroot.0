From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 23:44:32 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/poppler: enable autodetection of
	openjpeg
In-Reply-To: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1461620673-31313-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables autodetection for installed openjpeg library.
Previously we were forcing to version 1.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
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
-- 
1.9.1
