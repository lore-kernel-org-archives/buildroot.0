From: Will Newton <will.newton@gmail.com>
Date: Thu, 23 May 2013 14:20:09 +0100
Subject: [Buildroot] [PATCH 2/2] udpcast: Add udpcast-select-h.patch.
Message-ID: <CAFbHwiQ-Hk3+fh4yuSZk7zj27AgcYH4VfyQULPd_hn5e2E50pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the build on AArch64 (and potentially others).
The patch has been submitted upstream.

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/udpcast/udpcast-select-h.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/udpcast/udpcast-select-h.patch

diff --git a/package/udpcast/udpcast-select-h.patch
b/package/udpcast/udpcast-select-h.patch
new file mode 100644
index 0000000..9a8cfc9
--- /dev/null
+++ b/package/udpcast/udpcast-select-h.patch
@@ -0,0 +1,11 @@
+--- udpcast-20120424/console.h    2005-12-22 22:59:18.000000000 +0000
++++ udpcast-20120424.mod/console.h    2013-05-22 22:22:19.835474140 +0100
+@@ -6,6 +6,8 @@
+ #include <winbase.h>
+ #endif /* __MINGW32__ */
+
++#include <sys/select.h>
++
+ #define prepareConsole udpc_prepareConsole
+ #define getConsoleFd udpc_getConsoleFd
+ #define restoreConsole udpc_restoreConsole
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-udpcast-Add-udpcast-select-h.patch.patch
Type: application/octet-stream
Size: 1118 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130523/d0554794/attachment-0001.obj>
