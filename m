From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:40 -0000
Subject: [Buildroot] [git commit branch/next] Revert "rsyslog: fix config
	file comment style"
Message-ID: <20150808105629.3EB5B7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a9095a39a72926e622285ba21d93dd48d580f0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit d42f0f96aa13bc160bdfeb40ca75f53adb7af64e, which
breaks the build since the patch being added by this commit is in fact
already part of the 8.9.0 rsyslog release we are using.

Indeed, in the rsyslog repository:

$ git tag --contains fe01c9ec4979c78b6a7caf045cab17ba52d4ad08
[...]
v8.10.0
v8.10.0.ad1
v8.11.0
v8.7.0
v8.8.0
v8.8.0.ad1
v8.9.0
v8.9.0.ad1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rsyslog/0001-fix-config-file-comments.patch    |   37 --------------------
 1 files changed, 0 insertions(+), 37 deletions(-)

diff --git a/package/rsyslog/0001-fix-config-file-comments.patch b/package/rsyslog/0001-fix-config-file-comments.patch
deleted file mode 100644
index bc5448d..0000000
--- a/package/rsyslog/0001-fix-config-file-comments.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From fe01c9ec4979c78b6a7caf045cab17ba52d4ad08 Mon Sep 17 00:00:00 2001
-From: Brad Barden <brad+github@mifflinet.net>
-Date: Sun, 11 Jan 2015 17:52:11 -0600
-Subject: [PATCH] bugfix header in platform/redhat/rsyslog.conf
-
-the "For more information" doc path includes the string "*/", breaking c-style comment format. fixes #202.
----
- platform/redhat/rsyslog.conf | 19 +++++++++----------
- 1 file changed, 9 insertions(+), 10 deletions(-)
-
-diff --git a/platform/redhat/rsyslog.conf b/platform/redhat/rsyslog.conf
-index 340874d..3df6c7e 100644
---- a/platform/redhat/rsyslog.conf
-+++ b/platform/redhat/rsyslog.conf
-@@ -1,13 +1,12 @@
--/* rsyslog configuration file (for Red Hat-based systems)
-- * note that most of this config file uses old-style format,
-- * because it is well-known AND quite suitable for simple cases
-- * like we have with the default config. For more advanced 
-- * things, RainerScript configuration is suggested.
-- *
-- * For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
-- * or latest version online at http://www.rsyslog.com/doc/rsyslog_conf.html 
-- * If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html
-- */
-+# rsyslog configuration file (for Red Hat-based systems)
-+# note that most of this config file uses old-style format,
-+# because it is well-known AND quite suitable for simple cases
-+# like we have with the default config. For more advanced 
-+# things, RainerScript configuration is suggested.
-+#
-+# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
-+# or latest version online at http://www.rsyslog.com/doc/rsyslog_conf.html 
-+# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html
- 
- #### MODULES ####
- 
