From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 15:50:21 +0200
Subject: [Buildroot] [git commit branch/next] system/device-table: do not
	set /home/default stgid
Message-ID: <20130530194325.53DF19A65D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03bc3c3bdcffbef498b9072e9cd1c079fd0dd26a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, /home/default is mode 2755 which means it is setgid.
Since /home/default is not group-writable, it is useless.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/device_table.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
