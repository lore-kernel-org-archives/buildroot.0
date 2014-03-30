From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:52 +0400
Subject: [Buildroot] [PATCH v3 08/10] Revert "php: fix build for xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-9-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 410c3cf7ebe69016e73bbe63d1ba4b0a251b5c9a.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/php/php.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index de02f4b..5797758 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -35,10 +35,6 @@ ifneq ($(BR2_INET_IPV6),y)
 endif
 endif
 
-ifeq ($(BR2_xtensa),y)
-PHP_CFLAGS += -mtext-section-literals
-endif
-
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 
-- 
1.8.1.4
