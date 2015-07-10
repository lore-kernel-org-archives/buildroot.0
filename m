From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:27:57 -0500
Subject: [Buildroot] [PATCH v8 11/16] rsyslog: fix config file comment style
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-12-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

The upstream versions of rsyslog (v8 and higher) have this commit to fix
the config file comment issue. Carry this patch here until the version
is bumped.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v7 -> v8:
  - Reverted change to make file in favor of using upstream patch
    (Suggested by Samuel)

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes
---
 .../rsyslog/0001-fix-config-file-comments.patch    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/rsyslog/0001-fix-config-file-comments.patch

diff --git a/package/rsyslog/0001-fix-config-file-comments.patch b/package/rsyslog/0001-fix-config-file-comments.patch
new file mode 100644
index 0000000..bc5448d
--- /dev/null
+++ b/package/rsyslog/0001-fix-config-file-comments.patch
@@ -0,0 +1,37 @@
+From fe01c9ec4979c78b6a7caf045cab17ba52d4ad08 Mon Sep 17 00:00:00 2001
+From: Brad Barden <brad+github@mifflinet.net>
+Date: Sun, 11 Jan 2015 17:52:11 -0600
+Subject: [PATCH] bugfix header in platform/redhat/rsyslog.conf
+
+the "For more information" doc path includes the string "*/", breaking c-style comment format. fixes #202.
+---
+ platform/redhat/rsyslog.conf | 19 +++++++++----------
+ 1 file changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/platform/redhat/rsyslog.conf b/platform/redhat/rsyslog.conf
+index 340874d..3df6c7e 100644
+--- a/platform/redhat/rsyslog.conf
++++ b/platform/redhat/rsyslog.conf
+@@ -1,13 +1,12 @@
+-/* rsyslog configuration file (for Red Hat-based systems)
+- * note that most of this config file uses old-style format,
+- * because it is well-known AND quite suitable for simple cases
+- * like we have with the default config. For more advanced 
+- * things, RainerScript configuration is suggested.
+- *
+- * For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
+- * or latest version online at http://www.rsyslog.com/doc/rsyslog_conf.html 
+- * If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html
+- */
++# rsyslog configuration file (for Red Hat-based systems)
++# note that most of this config file uses old-style format,
++# because it is well-known AND quite suitable for simple cases
++# like we have with the default config. For more advanced 
++# things, RainerScript configuration is suggested.
++#
++# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
++# or latest version online at http://www.rsyslog.com/doc/rsyslog_conf.html 
++# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html
+ 
+ #### MODULES ####
+ 
-- 
1.9.1
