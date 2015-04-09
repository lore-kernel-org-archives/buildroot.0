From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 11:54:48 +0200
Subject: [Buildroot] [git commit] php: use TARGET_MAKE_ENV for buildconf
Message-ID: <20150409095517.BB4D07FF19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86071180d4c2072f93363313761339fa89ad917a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we miss the PATH for hosts that lack autotools. Fixes:
http://autobuild.buildroot.net/results/368/368da962f657801817a4b962415e55606915c871/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
