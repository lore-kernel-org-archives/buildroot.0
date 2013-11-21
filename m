From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Nov 2013 14:12:51 +0100
Subject: [Buildroot] [git commit] squid: fix compilation due to missing
	include of time.h
Message-ID: <20131121131329.17EBF9BD70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92ba26b5eefd7da21a2a3e93589dda08d99a4c74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b33/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../squid/squid-03-missing-include-time_h.patch    |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid-03-missing-include-time_h.patch b/package/squid/squid-03-missing-include-time_h.patch
new file mode 100644
index 0000000..18b3ab3
--- /dev/null
+++ b/package/squid/squid-03-missing-include-time_h.patch
@@ -0,0 +1,28 @@
+ipc/Kid.cc: add missing include of time.h
+
+Function time() comes from <time.h>, so add the necessary include.
+This fixes compilation on some configurations, for example
+http://autobuild.buildroot.net/results/b33/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+Upstream-status: submitted (http://bugs.squid-cache.org/show_bug.cgi?id=3967)
+
+---
+ src/ipc/Kid.cc |  4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+
+diff --git a/src/ipc/Kid.cc b/src/ipc/Kid.cc
+--- a/src/ipc/Kid.cc
++++ b/src/ipc/Kid.cc
+@@ -11,6 +11,10 @@
+ #include <sys/wait.h>
+ #endif
+ 
++#if HAVE_TIME_H
++#include <time.h>
++#endif
++
+ int TheProcessKind = pkOther;
+ 
+ Kid::Kid():
