From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:55 -0300
Subject: [Buildroot] [PATCH 08/93] zip: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-9-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
 
-- 
2.7.3
