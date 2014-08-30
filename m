From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Aug 2014 11:52:25 +0200
Subject: [Buildroot] [PATCH 3/5] package/polarssl: fix static link
In-Reply-To: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409392347-16392-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/754/754947d2a77a4dbe91057d8ce64fc4996e716ece/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/polarssl/polarssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 24f09ed..545a2cd 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -8,7 +8,7 @@ POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.11
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
-	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
+	-DUSE_SHARED_POLARSSL_LIBRARY=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 	-DUSE_STATIC_POLARSSL_LIBRARY=ON \
 	-DBUILD_TESTS=OFF \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.1.0
