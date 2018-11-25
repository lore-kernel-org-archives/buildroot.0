From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:37:17 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/audit: fix
 audispd path in auditd.conf
Message-ID: <20181125203425.92D02882D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bb61e32484f4e094425d874a01b449cb7530c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

audispd is installed at /usr/sbin but the configuration file pointed
to /sbin, causing auditd to fail on startup.

This patch cannot be sent upstream because audispd does not exist
anymore on the master branch (it was merged to auditd).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4be494b8045b51ddc41cec370950a95bc72fba55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-audispd-path-in-auditd.conf.patch     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
