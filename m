From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:43 -0300
Subject: [Buildroot] [PATCH 56/93] binutils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-57-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/binutils/binutils.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 966cc79..ca481d2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -108,16 +108,16 @@ endef
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
-	$(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
-	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 
 # If we don't want full binutils on target
 ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
-	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
 
-- 
2.7.3
