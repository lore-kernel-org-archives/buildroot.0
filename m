From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:28 +0100
Subject: [Buildroot] [PATCH 10/10] package/dvb-app: remove tests
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/dvb-apps/0004-Makefile-remove-test.patch | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch

diff --git a/package/dvb-apps/0004-Makefile-remove-test.patch b/package/dvb-apps/0004-Makefile-remove-test.patch
new file mode 100644
index 0000000..45bfad9
--- /dev/null
+++ b/package/dvb-apps/0004-Makefile-remove-test.patch
@@ -0,0 +1,27 @@
+From c578772d6abc5fdf3ec83f632c371373e5baf9f1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 26 Dec 2014 01:04:58 +0100
+Subject: [PATCH] Makefile: remove test
+
+Tests needs static libraries, remove them for shared only build.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 65a2273..105c460 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,7 +10,6 @@ DVB_API_MINOR := $(word 3, $(shell grep -m1 "DVB_API_VERSION_MINOR" $(VERSION_FI
+ 
+ all clean install:
+ 	$(MAKE) -C lib $@
+-	$(MAKE) -C test $@
+ 	$(MAKE) -C util $@
+ 
+ update:
+-- 
+1.9.3
+
-- 
1.9.3
