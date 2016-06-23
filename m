From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:09:23 +0200
Subject: [Buildroot] [git commit] busybox: disable nsenter/unshare in
	default config
Message-ID: <20160623191635.BF4978000A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d472a622be6277b497511464a0313ec5f7c6760c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These require newer toolchain components. Since they didn't exist in
previous versions no functionality is lost. Fixes:
http://autobuild.buildroot.net/results/b63/b6312626b3938555c4e5a68ad42f6951b02d7760/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 1059d67..02b1ee1 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Busybox version: 1.25.0
-# Tue Jun 21 21:03:53 2016
+# Wed Jun 22 20:07:11 2016
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -575,12 +575,12 @@ CONFIG_FEATURE_MOUNT_CIFS=y
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_FEATURE_MOUNT_OTHERTAB=y
-CONFIG_NSENTER=y
-CONFIG_FEATURE_NSENTER_LONG_OPTS=y
+# CONFIG_NSENTER is not set
+# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 # CONFIG_REV is not set
 CONFIG_SETARCH=y
 CONFIG_UEVENT=y
-CONFIG_UNSHARE=y
+# CONFIG_UNSHARE is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 CONFIG_BLKID=y
