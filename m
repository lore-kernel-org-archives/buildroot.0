From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat,  9 Jan 2016 15:59:44 -0600
Subject: [Buildroot] [RFC PATCH 2/3] package/dhcp: fix bind configure for
	cross-compiling
In-Reply-To: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
References: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1452376785-31174-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/dhcp/0001-bind-configure.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/dhcp/0001-bind-configure.patch

diff --git a/package/dhcp/0001-bind-configure.patch b/package/dhcp/0001-bind-configure.patch
new file mode 100644
index 0000000..41af039
--- /dev/null
+++ b/package/dhcp/0001-bind-configure.patch
@@ -0,0 +1,19 @@
+fix bind configure for cross-compiling
+
+Signed-of-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3/bind/Makefile.in
+===================================================================
+--- dhcp-4.3.3.orig/bind/Makefile.in
++++ dhcp-4.3.3/bind/Makefile.in
+@@ -30,7 +30,9 @@ bindconfig = --disable-kqueue --disable-
+ 	--without-openssl --without-libxml2 --enable-exportlib \
+ 	--with-gssapi=no --enable-threads=no @BINDCONFIG@ \
+ 	--with-export-includedir=${binddir}/include \
+-	--with-export-libdir=${binddir}/lib
++	--with-export-libdir=${binddir}/lib \
++	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
++	--build=$(GNU_HOST_NAME) --with-randomdev=/dev/urandom
+ 
+ @BIND_ATF_FALSE at cleandirs = ./lib ./include
+ @BIND_ATF_TRUE at cleandirs = ./lib ./include ./atf
-- 
2.6.4
