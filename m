From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 03:19:57 -0500
Subject: [Buildroot] [PATCH] portmap: respect target CFLAGS
Message-ID: <1290241197-23723-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/portmap/portmap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 471cc4b..d245bbe 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -15,6 +15,7 @@ PORTMAP_FLAGS += NO_FORK=1
 endif
 
 define PORTMAP_BUILD_CMDS
+	CFLAGS="$(TARGET_CFLAGS)" \
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
-- 
1.7.3.2
