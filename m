From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 14:55:39 -0300
Subject: [Buildroot] [PATCH v2] ezxml: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <1477677339-13156-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ezxml/ezxml.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 7693466..62e8a90 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -11,8 +11,8 @@ EZXML_LICENSE = MIT
 EZXML_LICENSE_FILES = license.txt
 
 define EZXML_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
-	-f GNUmakefile -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f GNUmakefile \
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR)
 endef
 
 define EZXML_INSTALL_STAGING_CMDS
-- 
2.7.3
