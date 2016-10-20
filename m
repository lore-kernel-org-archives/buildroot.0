From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Thu, 20 Oct 2016 23:12:37 +0200
Subject: [Buildroot] [PATCH] pppd: Move netinet/in.h above linux header
	includes
Message-ID: <1476997957-27184-1-git-send-email-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Linux uapi headers try to avoid redeclaring things from libc via
linux/libc-compat.h. However that only works if the libc header is
included first.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

---
This looks better now regarding the uclibc breakage.

diff --git a/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch b/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
new file mode 100644
index 0000000..2f6933f
--- /dev/null
+++ b/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
@@ -0,0 +1,22 @@
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..b827620 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -47,6 +47,8 @@
+ #include <sys/socket.h>
+ #endif
+ 
++#include <netinet/in.h>
++
+ /* Ugly header files on some Linux boxes... */
+ #if defined(HAVE_LINUX_IF_H)
+ #include <linux/if.h>
+@@ -84,8 +86,6 @@ typedef unsigned long UINT32_t;
+ #include <linux/if_ether.h>
+ #endif
+ 
+-#include <netinet/in.h>
+-
+ #ifdef HAVE_NETINET_IF_ETHER_H
+ #include <sys/types.h>
+ 
-- 
2.7.4
