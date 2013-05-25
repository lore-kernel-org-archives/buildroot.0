From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 May 2013 22:33:32 +0200
Subject: [Buildroot] [PATCH] system/device-table: do not set /home/default
	stgid
Message-ID: <1369514012-19606-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, /home/default is mode 2755 which means it is setgid.
Since /home/default is not group-writable, it is useless.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
AFAICS, there is no reason that /home/default be setgid.
However, I have not audited all packages to check whether one
would require that.
---
 system/device_table.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index 421728b..43c0cfa 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -9,7 +9,7 @@
 /dev					d	755	0	0	-	-	-	-	-
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
-/home/default				d	2755	1000	1000	-	-	-	-	-
+/home/default				d	755	1000	1000	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
-- 
1.8.1.2
