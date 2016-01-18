From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon, 18 Jan 2016 09:42:19 -0600
Subject: [Buildroot] [PATCH v3 2/4] package/dhcp: add bind configure options
	for cross compiling
In-Reply-To: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1453131741-1613-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
Changes v2 -> v3
  - removed RFC tag
Changes v1 -> v2
  - no changes
---
 package/dhcp/0001-bind-configure.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/dhcp/0001-bind-configure.patch

diff --git a/package/dhcp/0001-bind-configure.patch b/package/dhcp/0001-bind-configure.patch
new file mode 100644
index 0000000..9a38f45
--- /dev/null
+++ b/package/dhcp/0001-bind-configure.patch
@@ -0,0 +1,19 @@
+add bind configure options for cross compiling
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3-P1/bind/Makefile.in
+===================================================================
+--- dhcp-4.3.3-P1.orig/bind/Makefile.in
++++ dhcp-4.3.3-P1/bind/Makefile.in
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
2.7.0
