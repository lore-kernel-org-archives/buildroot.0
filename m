From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Jan 2015 23:16:20 +0100
Subject: [Buildroot] [PATCH] package/openldap: do not build the doc
Message-ID: <1422742580-23169-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the documentation fails on some autobuilders,
so disable it as we're not interested in it.

Fixes:
    http://autobuild.buildroot.org/results/1dc/1dc17a54e57130bffd19d360c9a7faae440b8916/
    http://autobuild.buildroot.org/results/407/40797597024cbb9054fdda8bdf4d011bba966b06/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openldap/0003-disable-docs.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/openldap/0003-disable-docs.patch

diff --git a/package/openldap/0003-disable-docs.patch b/package/openldap/0003-disable-docs.patch
new file mode 100644
index 0000000..7ce61e6
--- /dev/null
+++ b/package/openldap/0003-disable-docs.patch
@@ -0,0 +1,23 @@
+doc: do not build
+
+Building the documentation fails on some autobuilders,
+so disable it as we're not interested in it.
+
+Fixes:
+    http://autobuild.buildroot.org/results/1dc/1dc17a54e57130bffd19d360c9a7faae440b8916/
+    http://autobuild.buildroot.org/results/407/40797597024cbb9054fdda8bdf4d011bba966b06/
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN openldap-2.4.40.orig/Makefile.in openldap-2.4.40/Makefile.in
+--- openldap-2.4.40.orig/Makefile.in	2014-09-19 03:48:49.000000000 +0200
++++ openldap-2.4.40/Makefile.in	2015-01-31 23:12:54.347678913 +0100
+@@ -13,7 +13,7 @@
+ ## top-level directory of the distribution or, alternatively, at
+ ## <http://www.OpenLDAP.org/license.html>.
+ 
+-SUBDIRS= include libraries clients servers tests doc
++SUBDIRS= include libraries clients servers tests
+ CLEANDIRS=
+ INSTALLDIRS= 
+ 
-- 
1.9.1
