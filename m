From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Oct 2009 16:05:10 +0200
Subject: [Buildroot] [git commit master] zlib: fix typo
Message-ID: <20091004140620.420D577788@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8ac5d34e7887ef01e1a38592908ea441b827f956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo introduced by 1e32e0700a (remove dedicated target-headers option).
Noticed by Alexander Clouter <alex@digriz.org.uk>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 9131832..f207bcf 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -68,7 +68,7 @@ $(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
 	touch -c $@
 
-zlib: $(ZLIB_TARGET) $(if $(BR2_HAVE_DEVFILES,$(TARGET_DIR)/usr/lib/libz.a)
+zlib: $(ZLIB_TARGET) $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/libz.a)
 
 zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
 
-- 
1.6.3.3
