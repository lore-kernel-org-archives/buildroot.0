From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  7 Mar 2013 08:17:22 +0100
Subject: [Buildroot] [v3 3/3] luajit: allow to build Lua extensions without
	lua
In-Reply-To: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
References: <1362640642-9951-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1362640642-9951-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-05-install-inc.patch |   17 +++++++++++++++++
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
1.7.9.5
