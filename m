From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:22:53 +0200
Subject: [Buildroot] [git commit] package/nginx: fix mail modules not
	building
Message-ID: <20160505204505.8595D81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=868955a2eb8feb1e4a302d954d8c9ddfd6fd198d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the missing --with-mail configure option

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
