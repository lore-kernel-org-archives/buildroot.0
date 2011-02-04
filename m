From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Feb 2011 19:49:50 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.18.2 libbb fix
Message-ID: <20110204185011.1BF468F3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3fa18d27d3f4254f467333a903dcb5f7fcd53b24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.2/busybox-1.18.2-libbb.patch      |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch

diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch
new file mode 100644
index 0000000..aa7e75d
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch
@@ -0,0 +1,10 @@
+--- busybox-1.18.2/libbb/vfork_daemon_rexec.c
++++ busybox-1.18.2-libbb/libbb/vfork_daemon_rexec.c
+@@ -52,6 +52,7 @@ pid_t FAST_FUNC spawn(char **argv)
+ 	 * Interested party can wait on pid and learn exit code.
+ 	 * If 111 - then it (most probably) failed to exec */
+ 	if (failed) {
++		safe_waitpid(pid, NULL, 0); /* prevent zombie */
+ 		errno = failed;
+ 		return -1;
+ 	}
-- 
1.7.3.4
