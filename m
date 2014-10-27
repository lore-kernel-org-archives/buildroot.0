From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Oct 2014 00:33:26 +0200
Subject: [Buildroot] [PATCH] ipset: Don't include host headers
Message-ID: <c69b0ea4caf640e9ca3c2357f6e701cab02fa689.1414449206.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch removing /usr/local/include from the include path.

Fixes:
http://autobuild.buildroot.net/results/4f5/4f55c2415281c6204500efe28fe9e24c8ef73863/

Technically speaking this autobuild failure has already been fixes when
-Werror was removed in commit a923b44112aa3 (ipset: add patch to fix
--enable-debug build). But the warning in this case indicates a real problem
that needs to be fixed by itself.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...Make_global.am-Don-t-include-host-headers.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch

diff --git a/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch b/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch
new file mode 100644
index 000000000000..f8809791d3ff
--- /dev/null
+++ b/package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch
@@ -0,0 +1,29 @@
+From 1f1b5ed5e8402214a6516a380247123e6dd75d2a Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 28 Oct 2014 00:19:25 +0200
+Subject: [PATCH] Make_global.am: Don't include host headers
+
+This is bad for cross compilation.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ Make_global.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Make_global.am b/Make_global.am
+index 25c4d64715c7..11ea1c333186 100644
+--- a/Make_global.am
++++ b/Make_global.am
+@@ -71,8 +71,7 @@
+ #            curr:rev:age
+ LIBVERSION = 8:0:5
+ 
+-AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include \
+-	-I/usr/local/include
++AM_CPPFLAGS = $(kinclude_CFLAGS) $(all_includes) -I$(top_srcdir)/include
+ 
+ AM_CFLAGS = -std=gnu99
+ 
+-- 
+2.1.1
+
-- 
2.1.1
