From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 13:42:41 -0300
Subject: [Buildroot] [PATCH 1/4] audit: fix audispd path in auditd.conf
In-Reply-To: <20181103164244.10607-1-casantos@datacom.com.br>
References: <20181103164244.10607-1-casantos@datacom.com.br>
Message-ID: <20181103164244.10607-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

audispd is installed at /usr/sbin but the configuration file pointed
to /sbin, causing auditd to fail on startup.

This patch cannot be sent upstream because audispd does not exist
anymore on the master branch (it was merged to auditd).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 ...0001-Fix-audispd-path-in-auditd.conf.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/audit/0001-Fix-audispd-path-in-auditd.conf.patch

diff --git a/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch b/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
new file mode 100644
index 0000000000..ccf45db911
--- /dev/null
+++ b/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
@@ -0,0 +1,32 @@
+From 6e1fd09f7bc131c8f16d9cc43e2455ba4650c651 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Sat, 3 Nov 2018 08:25:58 -0300
+Subject: [PATCH] Fix audispd path in auditd.conf
+
+audispd is installed at /usr/sbin but the configuration file pointed
+to /sbin, causing auditd to fail on startup.
+
+This patch cannot be sent upstream because audispd does not exist
+anymore on the master branch (it was merged to auditd).
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ init.d/auditd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/init.d/auditd.conf b/init.d/auditd.conf
+index 4dcda83..998904f 100644
+--- a/init.d/auditd.conf
++++ b/init.d/auditd.conf
+@@ -13,7 +13,7 @@ max_log_file = 8
+ num_logs = 5
+ priority_boost = 4
+ disp_qos = lossy
+-dispatcher = /sbin/audispd
++dispatcher = /usr/sbin/audispd
+ name_format = NONE
+ ##name = mydomain
+ max_log_file_action = ROTATE
+-- 
+2.17.1
+
-- 
2.17.1
