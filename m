From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:59:19 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] syslog-ng: bump version
 header in conf file to 3.10
Message-ID: <20180501073416.0AEB4890ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436ac38c7d53e3b907edd0d3fd8cea2d6104ef59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Remove a runtime warning message about configuration file being too old.

Do the same as commit 3dad25466d "syslog-ng: Bump version header in conf
file to 3.9". Package version of syslog-ng is 3.10.1, so bump version
number in syslog-ng.conf to 3.10.

Also add a comment to avoid the same warning message reappears when the
package is bumped.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 905f8d814ad21af9c3fd22ececce0824cb20db80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 325fac5842..2b6f2c09e9 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When updating the version, please check at runtime if the version in
+# syslog-ng.conf header needs to be updated
 SYSLOG_NG_VERSION = 3.10.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
