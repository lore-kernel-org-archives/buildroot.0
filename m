From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Nov 2014 18:08:14 -0300
Subject: [Buildroot] [PATCH] system/permissions: /etc/random-seed must be
	mode 600
Message-ID: <1416517694-7952-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it's a big security risk.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/device_table.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/device_table.txt b/system/device_table.txt
index e15412d..8e7dbd2 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -11,6 +11,7 @@
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
+/etc/random-seed			f	600	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
-- 
2.0.4
