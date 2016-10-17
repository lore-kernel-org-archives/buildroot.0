From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:11 -0300
Subject: [Buildroot] [PATCH 84/93] qwt: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-85-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/qwt/qwt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index da30dd2..d1bb524 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -54,13 +54,13 @@ endef
 # that when building with qmake, -L$(STAGING_DIR)/usr/lib is used and
 # not -L/usr/lib.
 define QWT_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
 	$(SED) "s%QWT_INSTALL_PREFIX = .*%QWT_INSTALL_PREFIX = $(STAGING_DIR)/usr%" \
 		$(STAGING_DIR)/usr/mkspecs/features/qwtconfig.pri
 endef
 
 define QWT_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
 	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
-- 
2.7.3
