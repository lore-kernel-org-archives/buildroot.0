From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jan 2014 16:48:00 +0100
Subject: [Buildroot] [PATCH 2/9] luajit: allow to build Lua extensions
	without lua
In-Reply-To: <cover.1388936665.git.yann.morin.1998@free.fr>
References: <cover.1388936665.git.yann.morin.1998@free.fr>
Message-ID: <b1fc6b2d72918b1180ee41c2cabdd6d2a34e953b.1388936665.git.yann.morin.1998@free.fr>
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
