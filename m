From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:52:29 +0200
Subject: [Buildroot] [git commit] rtl8189fs: disable debug messages
Message-ID: <20210713192708.BCB969557C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb320899fa46565e174846bb42dad71a4cdcb22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Debug messages in rtl8189fs are enabled by default. Add patch
that disables debug messages to make driver less noisy.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-include-disable-debug-messages.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/rtl8189fs/0001-include-disable-debug-messages.patch b/package/rtl8189fs/0001-include-disable-debug-messages.patch
new file mode 100644
index 0000000000..532982b1d3
--- /dev/null
+++ b/package/rtl8189fs/0001-include-disable-debug-messages.patch
@@ -0,0 +1,28 @@
+From 5d3a44ff1aeb8ace6e08df3cad16102aaac1ef09 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 13 Jun 2021 15:51:51 +0300
+Subject: [PATCH] include: disable debug messages
+
+Disable debug messages to make rtl8189fs driver less noisy.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ include/autoconf.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/include/autoconf.h b/include/autoconf.h
+index 44efe42..b5df57b 100644
+--- a/include/autoconf.h
++++ b/include/autoconf.h
+@@ -224,8 +224,6 @@
+ /*
+  * Debug Related Config
+  */
+-#define CONFIG_DEBUG /* DBG_871X, etc... */
+-
+ #ifdef CONFIG_DEBUG
+ #define DBG	1	// for ODM & BTCOEX debug
+ //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
+-- 
+2.32.0
+
