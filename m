From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  9 Jul 2012 21:20:32 +0100
Subject: [Buildroot] [PATCH] Add /var/www to device table
Message-ID: <1341865232-3690-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The /var/www directory is listed in /etc/passwd in the skeleton target
filesystem as the home directory of the www-data user (uid 33).

In the final target filesystem, /var/www should be owned by www-data. This
is important for the lighttpd package, for example.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 v2: Removed redundant TAB from line added device table file.
 v3: Added Acked-by information.

 target/generic/device_table.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index fc397a9..421728b 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -10,6 +10,7 @@
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
 /home/default				d	2755	1000	1000	-	-	-	-	-
+/var/www				d	755	33	33	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
-- 
1.7.9.5
