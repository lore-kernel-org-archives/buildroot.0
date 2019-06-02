From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Jun 2019 21:19:22 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/poppler: fix build with cmake
 < 3.10
Message-ID: <20190602191922.9491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f9e24d38d3aa4519615c5a0ae7f62af610df976f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poppler/poppler.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a2bb7e3049..56998dd530 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -20,6 +20,9 @@ POPPLER_CONF_OPTS = \
 	-DENABLE_GOBJECT_INTROSPECTION=OFF \
 	-DENABLE_GTK_DOC=OFF
 
+# cmake older than 3.10 require this to avoid try_run() in FindThreads
+POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
-- 
2.20.1
