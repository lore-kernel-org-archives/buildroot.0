From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] dmalloc: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.570527F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16473dde4c4e2f174a4c8f95bbdf0c935366a754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/dmalloc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index ffa9a39..6ebb44c 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -48,7 +48,7 @@ DMALLOC_POST_PATCH_HOOKS += DMALLOC_POST_PATCH
 
 # both DESTDIR and PREFIX are ignored..
 define DMALLOC_INSTALL_STAGING_CMDS
-	$(MAKE) includedir="$(STAGING_DIR)/usr/include" \
+	$(TARGET_MAKE_ENV) $(MAKE) includedir="$(STAGING_DIR)/usr/include" \
 		bindir="$(STAGING_DIR)/usr/bin" \
 		libdir="$(STAGING_DIR)/usr/lib" \
 		shlibdir="$(STAGING_DIR)/usr/lib" \
