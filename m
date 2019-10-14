From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Oct 2019 23:05:14 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/clamav: fix clamsubmit linking
Message-ID: <20191014210514.2176-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout in review of
https://patchwork.ozlabs.org/patch/1175732/, set OBJC to $(TARGET_CC)

Fixes:
 - http://autobuild.buildroot.org/results/49973b2283c65de5155deaf633cd6569a37af375

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Drop non upstreamable patch and set OBJC

 package/clamav/clamav.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 18aedd7591..5caab1e0f6 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -22,7 +22,8 @@ CLAMAV_DEPENDENCIES = \
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
 	ac_cv_c_mmap_private=yes \
-	have_cv_ipv6=yes
+	have_cv_ipv6=yes \
+	OBJC=$(TARGET_CC)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CLAMAV_LIBS += -latomic
-- 
2.23.0
