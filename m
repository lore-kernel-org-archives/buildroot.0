From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] qwt: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132039.7479C7F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6614054ff6d6450ec5cefff763d5bfc8e6969390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
