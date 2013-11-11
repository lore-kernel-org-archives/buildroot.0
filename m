From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Mon, 11 Nov 2013 14:29:24 -0800
Subject: [Buildroot] [PATCH] tstools: fix build (link) error
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109191543.414f5694@skate>
Message-ID: <1384208964-29099-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 ...x-a-build-error-linking-of-shared-library.patch | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch

diff --git a/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch b/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch
new file mode 100644
index 0000000..e87413f
--- /dev/null
+++ b/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch
@@ -0,0 +1,23 @@
+From 1f83d1aa7f3abc75faeb31f169f1162e11168e16 Mon Sep 17 00:00:00 2001
+From: Tzu-Jung Lee <tjlee@ambarella.com>
+Date: Mon, 11 Nov 2013 14:16:11 -0800
+Subject: [PATCH] build: fix a build error (linking of shared library)
+
+Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
+
+diff --git a/Makefile b/Makefile
+index ad7f163..83ff416 100644
+--- a/Makefile
++++ b/Makefile
+@@ -203,7 +203,7 @@ $(STATIC_LIB): $(OBJS)
+ 	ar rc $(STATIC_LIB) $(OBJS)
+ 
+ $(SHARED_LIB): $(OBJS)
+-	$(LD) -shared -o $(SHARED_LIB) $(OBJS) -lc
++	$(CC) -shared -o $(SHARED_LIB) $(OBJS) -lc
+ endif
+ 
+ # Build all of the utilities with the static library, so that they can
+-- 
+1.8.4.3
+
-- 
1.8.4.3
