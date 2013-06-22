From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 00:22:32 +0200
Subject: [Buildroot] [PATCH] system/permissions: make /root group+others
	non-writable
Message-ID: <1371939752-29205-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Upon logging, dropbear whines if /root is group- or others-writable, and
key-based authentication is attempted, reverting to password-based
authentication:
    dropbear[149]: /root must be owned by user or root, and not writable by others
    dropbear[149]: Password auth succeeded for 'root' from 192.168.127.35:41566

On my system, /root was 770. Changing to 700 fixed the issue.

Having /root 700 is a good idea, anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/device_table.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/device_table.txt b/system/device_table.txt
index 43c0cfa..7ae4b07 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -9,6 +9,7 @@
 /dev					d	755	0	0	-	-	-	-	-
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
+/root					d	700	0	0	-	-	-	-	-
 /home/default				d	755	1000	1000	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
-- 
1.8.1.2
