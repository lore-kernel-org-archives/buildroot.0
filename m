From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Jun 2015 22:14:40 +0300
Subject: [Buildroot] [PATCH] libpcap: fix noMMU build
Message-ID: <02edde06e35ad1c82e48df83b593257b2356870e.1433272480.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a "uClinux is also Linux" patch to fix build for Blackfin.

Fixes:
http://autobuild.buildroot.net/results/e19/e19e8ebb46560050029576baa040f2c6928e6424/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ....in-fix-detect-of-if_bonding.h-on-uclinux.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch

diff --git a/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch b/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
new file mode 100644
index 000000000000..7838c6f25676
--- /dev/null
+++ b/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
@@ -0,0 +1,30 @@
+From 5b8dc4eaeab60d5effc33055e5bce9ac0d98d339 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 2 Jun 2015 21:39:15 +0300
+Subject: [PATCH] configure.in: fix detect of if_bonding.h on uclinux
+
+noMMU Linux (uClinux) is also Linux
+
+Upstream status: https://github.com/the-tcpdump-group/libpcap/pull/440
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index be4b29e2f8ba..31287d0dbe61 100644
+--- a/configure.in
++++ b/configure.in
+@@ -149,7 +149,7 @@ struct rtentry;
+ fi
+ 
+ case "$host_os" in
+-linux*)
++linux*|uclinux*)
+ 	AC_CHECK_HEADERS(linux/sockios.h linux/if_bonding.h,,,
+ 	[
+ #include <sys/socket.h>
+-- 
+2.1.4
+
-- 
2.1.4
