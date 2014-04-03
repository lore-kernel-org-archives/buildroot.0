From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:36:49 +0200
Subject: [Buildroot] [git commit] Revert "php: fix build for xtensa"
Message-ID: <20140403193845.43EB39A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=611ce96b3daad5fe377d4da342560658a3d8231e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 410c3cf7ebe69016e73bbe63d1ba4b0a251b5c9a.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ef42e58..ba1200b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -45,10 +45,6 @@ ifneq ($(BR2_INET_IPV6),y)
 endif
 endif
 
-ifeq ($(BR2_xtensa),y)
-PHP_CFLAGS += -mtext-section-literals
-endif
-
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 
