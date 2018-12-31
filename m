From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 09:41:48 +0100
Subject: [Buildroot] [PATCH] netsurf: fix linking with some toolchains
Message-ID: <20181231084148.28775-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/5f0d051cd60655a37a161782135b72bddec353a6/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/0005-fix-linking-nsfb.patch | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/netsurf/0005-fix-linking-nsfb.patch

diff --git a/package/netsurf/0005-fix-linking-nsfb.patch b/package/netsurf/0005-fix-linking-nsfb.patch
new file mode 100644
index 000000000..0859b51e5
--- /dev/null
+++ b/package/netsurf/0005-fix-linking-nsfb.patch
@@ -0,0 +1,27 @@
+From 313fe128be671e7b53621a365130867fbbbd72bd Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 30 Dec 2018 18:48:01 +0100
+Subject: [PATCH] fix linking nsfb
+
+see http://autobuild.buildroot.net/results/5f0d051cd60655a37a161782135b72bddec353a6/
+---
+ netsurf/frontends/framebuffer/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/netsurf/frontends/framebuffer/Makefile b/netsurf/frontends/framebuffer/Makefile
+index 249c7c4..53bdcff 100644
+--- a/netsurf/frontends/framebuffer/Makefile
++++ b/netsurf/frontends/framebuffer/Makefile
+@@ -29,9 +29,7 @@ CFLAGS += -std=c99 -g -Dsmall \
+ LDFLAGS += -lm
+ 
+ # non optional pkg-configed libs
+-LDFLAGS += -Wl,--whole-archive
+ $(eval $(call pkg_config_find_and_add,libnsfb,libnsfb))
+-LDFLAGS += -Wl,--no-whole-archive
+ 
+ # freetype is optional but does not use pkg-config
+ ifeq ($(NETSURF_FB_FONTLIB),freetype)
+-- 
+2.17.1
+
-- 
2.17.1
