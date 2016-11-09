From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:24:26 +0100
Subject: [Buildroot] [git commit] php-fpm: remove config comments to fix
	startup
Message-ID: <20161109212653.664BB81D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdcb7c25cdce46ec0bf6f1b993dc0502035c0cb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comments in the Buildroot-provided php-fpm.conf would produce the
following error when starting php-fpm:

ERROR: [/etc/php-fpm.conf:2] value is NULL for a ZEND_INI_PARSER_ENTRY

Removing the comments fixes the problem.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
