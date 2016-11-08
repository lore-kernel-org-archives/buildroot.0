From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  8 Nov 2016 14:49:42 -0500
Subject: [Buildroot] [PATCH 1/1] php-fpm: remove config comments to fix
	startup
Message-ID: <1478634582-15683-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comments in the Buildroot-provided php-fpm.conf would produce the
following error when starting php-fpm:

ERROR: [/etc/php-fpm.conf:2] value is NULL for a ZEND_INI_PARSER_ENTRY

Removing the comments fixes the problem.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/php/php-fpm.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
index b75a58f..88014b8 100644
--- a/package/php/php-fpm.conf
+++ b/package/php/php-fpm.conf
@@ -1,9 +1,6 @@
 [www]
-# Only start children when there are requests to be processed
 pm = ondemand
-# Terminate them again after there haven't been any for 2 minutes
 pm.process_idle_timeout = 120s
-# Maximum number of children processing PHP requests concurrently
 pm.max_children = 5
 
 listen = /var/run/php-fpm.sock
-- 
2.7.4
