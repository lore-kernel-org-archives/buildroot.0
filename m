From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 22:41:28 +0100
Subject: [Buildroot] [git commit] package/infozip: factorize common CFLAGS
Message-ID: <20150205214228.881B580E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ecf34b9f5add58c5c03fc2ea77a30d96065395e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/infozip/infozip.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 229299c..3f53224 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -14,9 +14,12 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 INFOZIP_DEPENDENCIES += bzip2
 endif
 
+# Infozip's default CFLAGS.
+INFOZIP_CFLAGS = -I. -DUNIX
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
@@ -28,7 +31,7 @@ endef
 
 define HOST_INFOZIP_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(HOST_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
