From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 13:52:34 +0100
Subject: [Buildroot] [git commit] newt: disable parallel build
Message-ID: <20111118125342.B12288F5CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4ddc194d00a6e7db8501861af5e32e14e0c28a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The newt build system contains a race condition, which sometimes breaks
the build with high BR2_JLEVEL settings.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/newt/newt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 28b5321..eb944a9 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -42,7 +42,7 @@ $(NEWT_DIR)/.configured: $(NEWT_DIR)/.source
 	touch $(NEWT_DIR)/.configured
 
 $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION): $(NEWT_DIR)/.configured
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC="$(TARGET_CC)" -C $(NEWT_DIR)
+	$(MAKE1) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC="$(TARGET_CC)" -C $(NEWT_DIR)
 	touch -c $@
 
 $(STAGING_DIR)/usr/lib/libnewt.a: $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
