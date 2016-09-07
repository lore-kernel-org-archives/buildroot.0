From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Wed,  7 Sep 2016 17:43:46 +0200
Subject: [Buildroot] [PATCH] package/php: explicitly disable phpdbg.
In-Reply-To: <1473263026-14588-1-git-send-email-theo.debrouwere@skynet.be>
References: <1473263026-14588-1-git-send-email-theo.debrouwere@skynet.be>
Message-ID: <1473263026-14588-2-git-send-email-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building php, the package will also build/install phpdbg.
This patch explicitly disables this behaviour.

Signed-off-by: Theo Debrouwere <tdebrouwere@televic.com>
---
 package/php/php.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index d7e27a1..a63a8df 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,7 +19,9 @@ PHP_CONF_OPTS = \
 	--disable-all \
 	--without-pear \
 	--with-config-file-path=/etc \
+	--enable-phpdbg=no \
 	--disable-rpath
+
 PHP_CONF_ENV = \
 	ac_cv_func_strcasestr=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
-- 
2.8.1
