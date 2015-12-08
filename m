From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 Dec 2015 09:09:07 -0300
Subject: [Buildroot] [PATCH] p11-kit: bump to version 0.23.2
Message-ID: <1449576547-5982-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch is upstream
so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ansport.c-include-sys-select.h-for-fd_set.patch | 36 ----------------------
 package/p11-kit/p11-kit.hash                       |  2 +-
 package/p11-kit/p11-kit.mk                         |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch

diff --git a/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch b/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch
deleted file mode 100644
index bff732c..0000000
--- a/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1071268d06da269de56c895af940e6f15bcf79e7 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 2 Dec 2015 07:15:43 -0300
-Subject: [PATCH] rpc-transport.c: include sys/select.h for fd_set
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fd_set and friends, according to POSIX.1-2001, needs sys/select.h, so
-include it otherwise the build fails for uClibc:
-
-p11-kit/rpc-transport.c: In function ?rpc_socket_read?:
-p11-kit/rpc-transport.c:350:2: error: unknown type name ?fd_set?
-p11-kit/rpc-transport.c:416:4: warning: implicit declaration of function
-?FD_ZERO? [-Wimplicit-function-declaration]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- p11-kit/rpc-transport.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/p11-kit/rpc-transport.c b/p11-kit/rpc-transport.c
-index 7176b39..5251e11 100644
---- a/p11-kit/rpc-transport.c
-+++ b/p11-kit/rpc-transport.c
-@@ -55,6 +55,7 @@
- #include <string.h>
- 
- #ifdef OS_UNIX
-+#include <sys/select.h>
- #include <sys/socket.h>
- #include <sys/wait.h>
- #include <sys/un.h>
--- 
-2.4.10
-
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index d43a8fd..c0182eb 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e57371669f3b157141b86c429bd9c29741994b2f5ff115fcb8a03e751b0f6ac4	p11-kit-0.23.1.tar.gz
+sha256	ba726ea8303c97467a33fca50ee79b7b35212964be808ecf9b145e9042fdfaf0	p11-kit-0.23.2.tar.gz
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 03d26e2..e856cac 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.1
+P11_KIT_VERSION = 0.23.2
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
-- 
2.4.10
