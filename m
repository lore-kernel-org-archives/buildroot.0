From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:51 +0200
Subject: [Buildroot] [PATCH 5/5] libnl: include limits.h to fix build failure
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3457649b632f03157ec00eca12113ca032d03891.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the ULONG_MAX definition problem:

In file included from cache.c:43:
../include/netlink-local.h: In function '__str2type':../include/netlink-local.h:218: error: 'ULONG_MAX' undeclared (first use in this function)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/libnl-1.1-netlink-local-fix.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libnl/libnl-1.1-netlink-local-fix.patch

diff --git a/package/libnl/libnl-1.1-netlink-local-fix.patch b/package/libnl/libnl-1.1-netlink-local-fix.patch
new file mode 100644
index 0000000..79cda28
--- /dev/null
+++ b/package/libnl/libnl-1.1-netlink-local-fix.patch
@@ -0,0 +1,19 @@
+Fixes the ULONG_MAX definition problem:
+
+In file included from cache.c:43:
+../include/netlink-local.h: In function '__str2type':../include/netlink-local.h:218: error: 'ULONG_MAX' undeclared (first use in this function)
+
+Patch borrowed from OpenEmbedded, recipes/libnl/files/netlink-local-fix.patch.
+
+Index: libnl-1.1/include/netlink-local.h
+===================================================================
+--- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
++++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
+@@ -26,6 +26,7 @@
+ #include <sys/socket.h>
+ #include <inttypes.h>
+ #include <assert.h>
++#include <limits.h>
+ 
+ #include <arpa/inet.h>
+ #include <netdb.h>
-- 
1.6.3.3
