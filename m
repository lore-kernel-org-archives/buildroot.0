From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:15:54 +0100
Subject: [Buildroot] [git commit] luajit: allow to build Lua extensions
	without lua
Message-ID: <20140113222141.C77289B94E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=443f8c1f4d394c94731a333e26ab523f0fb84abc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit-05-install-inc.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
