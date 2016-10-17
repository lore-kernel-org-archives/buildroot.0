From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:18 -0300
Subject: [Buildroot] [PATCH 91/93] qt: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-92-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/qt/qt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8c0ff7b..508f35a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -505,7 +505,7 @@ endef
 endif
 
 define QT_CONFIGURE_CMDS
-	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
+	-[ -f $(@D)/Makefile ] && $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) confclean
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
@@ -632,7 +632,7 @@ endef
 # remove the sysroot path from them, since pkg-config already adds it
 # automatically.
 define QT_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
 	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
-- 
2.7.3
