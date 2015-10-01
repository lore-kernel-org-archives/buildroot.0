From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  2 Oct 2015 01:06:31 +0300
Subject: [Buildroot] [PATCH] vtun: fix gcc5 build
Message-ID: <e7f752b1db41fb8e094a79efd6210501de26a7b0.1443737191.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -std=gnu89 to CFLAGS to keep pre gcc5 inline function symbols visibility
rules.

Fixes:
http://autobuild.buildroot.net/results/a7e/a7e684174b90a852318a7a8bf41c4f477d159d56/
http://autobuild.buildroot.net/results/ab0/ab01f8e0467e85322c63b81bb7e84fd251e5d556/
http://autobuild.buildroot.net/results/117/117a68bf648b050dabed8088d1165c1d7d9301f0/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/vtun/vtun.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2b64ab9efc69..884ebc666431 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -14,4 +14,6 @@ VTUN_CONF_OPTS = \
 	--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 	--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
+VTUN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 $(eval $(autotools-package))
-- 
2.5.3
