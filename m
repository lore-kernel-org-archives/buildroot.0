From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 27 Feb 2018 03:40:33 -0800
Subject: [Buildroot] [PATCH 1/1] apache sbindir
Message-ID: <20180227114033.7746-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The apache configure script help indicates that the sbindir is PREFIX/sbin , but it actually uses PREFIX/bin. I suspect most people would expect httpd to be /usr/sbin/httpd , not /usr/bin/httpd.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/apache/apache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e1b1a209cb..010ec31c33 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -29,6 +29,7 @@ APACHE_MPM = worker
 endif
 
 APACHE_CONF_OPTS = \
+	--sbindir=/usr/sbin \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
-- 
2.14.3
