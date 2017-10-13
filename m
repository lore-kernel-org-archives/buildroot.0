From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 13 Oct 2017 12:43:24 +0200
Subject: [Buildroot] [PATCH] bzip2: fix passing of TARGET_MAKE_ENV to make
Message-ID: <1507891404-1225-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_MAKE_ENV is not passed to make because it is on a different
line without a backslash.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/bzip2/bzip2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 62571ed5a3a6..e43533072b2d 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -12,13 +12,13 @@ BZIP2_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_BUILD_SHARED_CMDS
-	$(TARGET_MAKE_ENV)
+	$(TARGET_MAKE_ENV) \
 		$(MAKE) -C $(@D) -f Makefile-libbz2_so $(TARGET_CONFIGURE_OPTS)
 endef
 endif
 
 define BZIP2_BUILD_CMDS
-	$(TARGET_MAKE_ENV)
+	$(TARGET_MAKE_ENV) \
 		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover $(TARGET_CONFIGURE_OPTS)
 	$(BZIP2_BUILD_SHARED_CMDS)
 endef
-- 
2.7.4
