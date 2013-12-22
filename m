From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:42:10 +0100
Subject: [Buildroot] [PATCH 02/10] luajit: allow to build Lua extensions
	without lua
In-Reply-To: <cover.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <2e07141a79ae410d940b226e23a8493d545aed69.1387744636.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/luajit-05-install-inc.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/luajit/luajit-05-install-inc.patch

diff --git a/package/luajit/luajit-05-install-inc.patch b/package/luajit/luajit-05-install-inc.patch
new file mode 100644
index 0000000..1fd11b1
--- /dev/null
+++ b/package/luajit/luajit-05-install-inc.patch
@@ -0,0 +1,17 @@
+Install includes like lua's ones
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -31,7 +31,7 @@ DPREFIX= $(DESTDIR)$(PREFIX)
+ INSTALL_BIN=   $(DPREFIX)/bin
+ INSTALL_LIB=   $(DPREFIX)/lib
+ INSTALL_SHARE= $(DPREFIX)/share
+-INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
++INSTALL_INC=   $(DPREFIX)/include
+ 
+ INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
+ INSTALL_JITLIB= $(INSTALL_LJLIBD)/jit
-- 
1.8.1.2
