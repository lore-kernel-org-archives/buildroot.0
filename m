From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:39:18 +0200
Subject: [Buildroot] [git commit] package/trace-cmd: bump version to 2.6.1,
	add hash
Message-ID: <20170611123922.7FFB08172D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06b609159dd926b6d1b6e0c43ddcfe9127178722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-trace-record.c-with-non-ptrace-compile.patch | 32 ----------------------
 package/trace-cmd/trace-cmd.hash                   |  2 ++
 package/trace-cmd/trace-cmd.mk                     |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch b/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch
deleted file mode 100644
index 5f7d2ba..0000000
--- a/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bdfcddd4f135dc1d4fefb0373d9ebb93ef5110cb Mon Sep 17 00:00:00 2001
-From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
-Date: Mon, 7 Dec 2015 16:41:19 -0500
-Subject: [PATCH] trace-cmd: Fix trace-record.c with non ptrace compile
-
-Fix ptrace_wait() when NO_PTRACE=1 is defined.
-
-Status: upstream
-
-Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
-[Romain backport to 2.6]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- trace-record.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/trace-record.c b/trace-record.c
-index df82883..f83ec4b 100644
---- a/trace-record.c
-+++ b/trace-record.c
-@@ -1099,7 +1099,7 @@ static void ptrace_wait(enum trace_type type, int main_pid)
- 		 (!WIFEXITED(status) || pid != main_pid));
- }
- #else
--static inline void ptrace_wait(int main_pid) { }
-+static inline void ptrace_wait(enum trace_type type, int main_pid) { }
- static inline void enable_ptrace(void) { }
- static inline void ptrace_attach(int pid) { }
- 
--- 
-2.5.5
-
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
new file mode 100644
index 0000000..5bf4154
--- /dev/null
+++ b/package/trace-cmd/trace-cmd.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f088534808274f6233fe15130791238fb14ce9bf6e7234f9b3fe6b5a42a1245d  trace-cmd-trace-cmd-v2.6.1.tar.gz
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 9d2154d..0dc1456 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.6
+TRACE_CMD_VERSION = trace-cmd-v2.6.1
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
