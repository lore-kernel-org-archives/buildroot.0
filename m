From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon, 25 Feb 2019 22:23:59 +0100
Subject: [Buildroot] [PATCH 1/1] imx-mkimage: Add patch to satisfy unused
 version generation
Message-ID: <20190225212359.19095-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

http://autobuild.buildroot.net/results/1973d39b113c37e65c35f1f0a56354f192ae02d7

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 .../0003-Add-unused-fake-version.patch        | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/imx-mkimage/0003-Add-unused-fake-version.patch

diff --git a/package/imx-mkimage/0003-Add-unused-fake-version.patch b/package/imx-mkimage/0003-Add-unused-fake-version.patch
new file mode 100644
index 0000000000..f437a17ac7
--- /dev/null
+++ b/package/imx-mkimage/0003-Add-unused-fake-version.patch
@@ -0,0 +1,32 @@
+From e75feef80b51c9060e3702390040495312648ad2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
+Date: Mon, 25 Feb 2019 22:15:55 +0100
+Subject: [PATCH] Add unused fake version
+
+The Makefile makes the assumption that the build process runs
+from a Git clone of the source code.
+We can safely add a fake version here, because the code to
+print it is broken anyway.
+
+---
+ Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ccf42e8..6041574 100644
+--- a/Makefile
++++ b/Makefile
+@@ -37,9 +37,7 @@ $(MKIMG): src/build_info.h $(SRCS)
+ bin: $(MKIMG)
+ 
+ src/build_info.h:
+-	@echo -n '#define MKIMAGE_COMMIT 0x' > src/build_info.h
+-	@git rev-parse --short=8 HEAD >> src/build_info.h
+-	@echo '' >> src/build_info.h
++	@echo '#define MKIMAGE_COMMIT 0xdeadbeef' > src/build_info.h
+ 
+ help:
+ 	@echo $(CURR_DIR)
+-- 
+2.17.1
+
-- 
2.17.1
