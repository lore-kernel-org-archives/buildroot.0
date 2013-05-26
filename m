From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 21:02:17 +0200
Subject: [Buildroot] [git commit branch/next] udpcast: Add
	udpcast-select-h.patch.
Message-ID: <20130526194930.82FEE9A58B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c096b5985ab5f29a051da3645eda5aa43231bdc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch fixes the build on AArch64 (and potentially others).
The patch has been submitted upstream.

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udpcast/udpcast-select-h.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/udpcast/udpcast-select-h.patch b/package/udpcast/udpcast-select-h.patch
new file mode 100644
index 0000000..9a8cfc9
--- /dev/null
+++ b/package/udpcast/udpcast-select-h.patch
@@ -0,0 +1,11 @@
+--- udpcast-20120424/console.h	2005-12-22 22:59:18.000000000 +0000
++++ udpcast-20120424.mod/console.h	2013-05-22 22:22:19.835474140 +0100
+@@ -6,6 +6,8 @@
+ #include <winbase.h>
+ #endif /* __MINGW32__ */
+ 
++#include <sys/select.h>
++
+ #define prepareConsole udpc_prepareConsole
+ #define getConsoleFd udpc_getConsoleFd
+ #define restoreConsole udpc_restoreConsole
