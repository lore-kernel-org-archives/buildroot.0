From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 21:56:28 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/lcms2: add support for host
	variant
Message-ID: <20161218205630.17019-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming ghostscript package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 package/lcms2/lcms2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 9a4cf5ed2..29f8ac8de 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -31,4 +31,5 @@ else
 LCMS2_CONF_OPTS += --without-zlib
 endif
 
+$(eval $(host-autotools-package))
 $(eval $(autotools-package))
-- 
2.11.0
