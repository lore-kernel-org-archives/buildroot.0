From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Oct 2012 22:54:50 +0300
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
	supports it
Message-ID: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/beecrypt/beecrypt.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index d165aee..101d0df 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -18,6 +18,12 @@ BEECRYPT_CONF_OPT = \
 		--without-java \
 		--without-python
 
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+BEECRYPT_CONF_OPT += --enable-openmp
+else
+BEECRYPT_CONF_OPT += --disable-openmp
+endif
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 # C++ support needs icu
 BEECRYPT_DEPENDENCIES += icu
-- 
1.7.7.6
