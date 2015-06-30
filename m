From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 18:55:59 +0200
Subject: [Buildroot] [git commit] sunxi-mali: fix linking of malitest
Message-ID: <20150630165610.279C181784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a6a8841d0a2eb9fc6cac2e72e518a518f2fd71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/a15/a152beb56cdc4591868e14cce9a60e51cbfb0abc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-linking-of-test-app-needs-libUMP.patch    |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

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
