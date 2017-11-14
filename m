From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 07:58:35 -0500
Subject: [Buildroot] [PATCH v2 1/1] libpjsip: remove deprecated config
 options
Message-ID: <20171114125835.2056-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

disable-small-filter and disable-large-filter have been deprecated as
of 2.7, causing messages during compile time complaining about how they
are deprecated and have no effect.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed typo in commit message. depricated -> deprecated (Luca Ceresoli)

 package/libpjsip/libpjsip.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 6f3f9e3f1a..c772d4117a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -38,8 +38,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
-	--disable-small-filter \
-	--disable-large-filter \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-- 
2.13.6
