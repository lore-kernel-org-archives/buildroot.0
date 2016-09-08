From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Thu,  8 Sep 2016 09:53:09 +0200
Subject: [Buildroot] [PATCH] package/php: explicitly disable phpdbg.
In-Reply-To: <20160907171607.GA4759@free.fr>
References: <20160907171607.GA4759@free.fr>
Message-ID: <1473321189-18197-1-git-send-email-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building php, the package will also build/install phpdbg.
This patch explicitly disables this behaviour.

Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index d7e27a1..5d676e4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,6 +19,7 @@ PHP_CONF_OPTS = \
 	--disable-all \
 	--without-pear \
 	--with-config-file-path=/etc \
+	--disable-phpdbg \
 	--disable-rpath
 PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
-- 
2.8.1
