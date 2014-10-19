From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:50 +0200
Subject: [Buildroot] [PATCH 14/15] package/polarssl: cleanup configure
	options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-15-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test build is already disabled by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/polarssl/polarssl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 98dd5bc..21bf160 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -8,7 +8,6 @@ POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.11
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
-	-DBUILD_TESTS=OFF \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
 
 POLARSSL_INSTALL_STAGING = YES
-- 
2.1.2
