From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 23 Nov 2015 23:23:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/zmqpp: fix missing install of
	static library
In-Reply-To: <1448317402-10464-1-git-send-email-joerg.krause@embedded.rocks>
References: <1448317402-10464-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1448317402-10464-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zmqpp's Makefile does not install the static library.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-Install-static-library-for-static-builds.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/zmqpp/0003-Install-static-library-for-static-builds.patch

diff --git a/package/zmqpp/0003-Install-static-library-for-static-builds.patch b/package/zmqpp/0003-Install-static-library-for-static-builds.patch
new file mode 100644
index 0000000..3b4d488
--- /dev/null
+++ b/package/zmqpp/0003-Install-static-library-for-static-builds.patch
@@ -0,0 +1,30 @@
+From 1637443262cc861a161fd7c734bc0610a340335b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 23 Nov 2015 22:53:09 +0100
+Subject: [PATCH 3/3] Install static library for static builds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 90c7059..abed6fa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -142,6 +142,9 @@ ifeq ($(BUILD_SHARED),yes)
+ 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED).$(VERSION_MAJOR)
+ 	ln -sf $(LIBRARY_SHARED).$(APP_VERSION) $(LIBDIR)/$(LIBRARY_SHARED)
+ endif
++ifeq ($(BUILD_STATIC),yes)
++	install -m 755 $(BUILD_PATH)/$(LIBRARY_ARCHIVE) $(LIBDIR)/$(LIBRARY_ARCHIVE)
++endif
+ 	if [ -f $(BUILD_PATH)/$(CLIENT_TARGET) ]; then install -m 755 $(BUILD_PATH)/$(CLIENT_TARGET) $(BINDIR); fi
+ 	$(LDCONFIG)
+ 	@echo "use make installcheck to test the install"
+-- 
+2.6.2
+
-- 
2.6.2
