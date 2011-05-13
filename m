From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 13 May 2011 12:04:10 +0200
Subject: [Buildroot] [git commit] dropbear: fix static link for version
	0.53.1
Message-ID: <20110513100601.07B39834D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8e52c47d7dd992595de0177d332323162313735
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dropbear-0.53.1-static_build_fix.patch         |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/dropbear/dropbear-0.53.1-static_build_fix.patch

diff --git a/package/dropbear/dropbear-0.53.1-static_build_fix.patch b/package/dropbear/dropbear-0.53.1-static_build_fix.patch
new file mode 100644
index 0000000..0e0a91a
--- /dev/null
+++ b/package/dropbear/dropbear-0.53.1-static_build_fix.patch
@@ -0,0 +1,26 @@
+dropbear: fix static build
+
+the -lcrypt is missing during the link
+
+svr-authpasswd.o: In function `svr_auth_password':
+svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
+collect2: ld returned 1 exit status
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -77,7 +77,7 @@ STRIP=@STRIP@
+ INSTALL=@INSTALL@
+ CPPFLAGS=@CPPFLAGS@
+ CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
+-LIBS+=@LIBS@
++LIBS+=@CRYPTLIB@ @LIBS@
+ LDFLAGS=@LDFLAGS@
+ 
+ EXEEXT=@EXEEXT@
-- 
1.7.3.4
