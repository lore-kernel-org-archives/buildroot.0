From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 10:36:52 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/nginx: fix mail modules not
	building
Message-ID: <1462268217-31545-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the missing --with-mail configure option

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - new in v2. split from the patch to bump nginx to 1.10.0
   (suggested by Thomas Petazzoni)
---
 package/nginx/nginx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 7348e48..f6bae7e 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -193,6 +193,7 @@ endif # BR2_PACKAGE_NGINX_HTTP
 
 # mail modules
 ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
+NGINX_CONF_OPTS += --with-mail
 
 ifeq ($(BR2_PACKAGE_NGINX_MAIL_SSL_MODULE),y)
 NGINX_DEPENDENCIES += openssl
-- 
2.7.4
