From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 22:02:16 -0300
Subject: [Buildroot] [PATCH] php: use TARGET_MAKE_ENV for buildconf
Message-ID: <1428541336-8281-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise we miss the PATH for hosts that lack autotools. Fixes:
http://autobuild.buildroot.net/results/368/368da962f657801817a4b962415e55606915c871/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index eb4f797..f355632 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -25,7 +25,7 @@ PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 # PHP can't be AUTORECONFed the standard way unfortunately
 PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
 define PHP_BUILDCONF
-	cd $(@D) ; ./buildconf --force
+	cd $(@D) ; $(TARGET_MAKE_ENV) ./buildconf --force
 endef
 PHP_PRE_CONFIGURE_HOOKS += PHP_BUILDCONF
 
-- 
2.0.5
