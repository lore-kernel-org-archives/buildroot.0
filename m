From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2015 17:47:43 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix broken symlinks
Message-ID: <20151123164743.GA28906@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The created symlinks are wrong.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/jimtcl/jimtcl.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e79e0f6..4afb217 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -33,8 +33,8 @@ else
 JIMTCL_SHARED = --shared
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
-		$(1)/usr/lib/libjim.$(JIMTCL_VERSION)
-	ln -s libjim.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
+		$(1)/usr/lib/libjim.so.$(JIMTCL_VERSION)
+	ln -sf libjim.so.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
 endef
 endif
 
-- 
1.7.10.4
