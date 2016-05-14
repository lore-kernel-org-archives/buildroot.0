From: Troy Dack <troy@dack.com.au>
Date: Sun, 15 May 2016 09:33:08 +1000
Subject: [Buildroot] [PATCH 1/3] OrangePi Plus rootfs-overlay files
In-Reply-To: <1463268790-1076-1-git-send-email-troy@dack.com.au>
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
Message-ID: <1463268790-1076-2-git-send-email-troy@dack.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Troy Dack <troy@dack.com.au>
---
 .../orangepi_plus/rootfs-overlay/etc/profile        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 board/orangepi/orangepi_plus/rootfs-overlay/etc/profile

diff --git a/board/orangepi/orangepi_plus/rootfs-overlay/etc/profile b/board/orangepi/orangepi_plus/rootfs-overlay/etc/profile
new file mode 100644
index 0000000..a4ddccd
--- /dev/null
+++ b/board/orangepi/orangepi_plus/rootfs-overlay/etc/profile
@@ -0,0 +1,21 @@
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin
+
+if [ "$PS1" ]; then
+        if [ "`id -u`" -eq 0 ]; then
+                export PS1='\h:\w\# '
+        else
+                export PS1='\h:\w\$ '
+        fi
+fi
+
+export PAGER='/bin/more '
+export EDITOR='/bin/vi'
+
+# Source configuration files from /etc/profile.d
+for i in /etc/profile.d/*.sh ; do
+        if [ -r "$i" ]; then
+                . $i
+        fi
+        unset i
+done
+
-- 
2.7.4
