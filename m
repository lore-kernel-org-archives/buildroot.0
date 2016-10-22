From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] zip: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.BAAFB819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7073047608f6bbd9cc6047d136abd0a3ed010af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zip/zip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 5338f88..d2487b7 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -27,14 +27,14 @@ ZIP_TARGET_CFLAGS = \
 	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 
 define ZIP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(ZIP_TARGET_CFLAGS) $(ZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
 
 define ZIP_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
 		prefix=$(TARGET_DIR)/usr
 endef
 
