From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 30 Jun 2015 17:48:17 +0200
Subject: [Buildroot] [PATCH] sunxi-mali: fix linking of malitest
Message-ID: <1435679297-15362-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/a15/a152beb56cdc4591868e14cce9a60e51cbfb0abc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0002-linking-of-test-app-needs-libUMP.patch        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch

diff --git a/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch b/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch
new file mode 100644
index 0000000..1c8f7ee
--- /dev/null
+++ b/package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch
@@ -0,0 +1,18 @@
+linking of test app needs libUMP
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/test/Makefile b/test/Makefile
+index 700416e..92085cb 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -5,7 +5,7 @@
+ all: test
+ 
+ test: ../config.mk test.c
+-	$(CC) $(CFLAGS) -o $@ test.c -lEGL -lGLESv2
++	$(CC) $(CFLAGS) -o $@ test.c -lEGL -lGLESv2 -lUMP
+ 
+ clean:
+ 	rm -f test
+
-- 
2.1.4
