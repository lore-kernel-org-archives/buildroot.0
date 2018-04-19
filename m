From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 19 Apr 2018 16:14:17 -0300
Subject: [Buildroot] [PATCH 1/2] syslog-ng: bump version header in conf file
 to 3.10
Message-ID: <20180419191418.28285-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Remove a runtime warning message about configuration file being too old.

Do the same as commit 3dad25466d "syslog-ng: Bump version header in conf
file to 3.9". Package version of syslog-ng is 3.10.1, so bump version
number in syslog-ng.conf to 3.10.

Also add a comment to avoid the same warning message reappears when the
package is bumped.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Chris Packham <judge.packham@gmail.com>
---
Wrapped version of the warning message that shows at every boot:
  Starting syslog-ng daemon: WARNING: Configuration file format is too
  old, syslog-ng is running in compatibility mode Please update it to
  use the syslog-ng 3.10 format at your time of convenience,
  compatibility mode can operate less efficiently in some cases. To
  upgrade the configuration, please review the warnings about
  incompatible changes printed by syslog-ng, and once completed change
  the @version header at the top of the configuration file.;
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index a3384eebc3..e767255d71 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.9
+ at version: 3.10
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 325fac5842..d82f9a1aa4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When updating the version, please check at runtime if version at
+# syslog-ng.conf header needs to be updated
 SYSLOG_NG_VERSION = 3.10.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
-- 
2.14.1
