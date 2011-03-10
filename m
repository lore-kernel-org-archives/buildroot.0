From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] libxslt: remove xslt-config
	script from TARGET_DIR
Message-ID: <20110310111401.3F7528FEC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efeebdbd427906fecf404e9a71066398d144f082
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 5fa2f4c..1efdcf8 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -39,5 +39,13 @@ endef
 
 LIBXSLT_POST_INSTALL_STAGING_HOOKS += LIBXSLT_XSLT_CONFIG_FIXUP
 
+define LIBXSLT_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/xslt-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
+endif
+
 $(eval $(call AUTOTARGETS,package,libxslt))
 $(eval $(call AUTOTARGETS,package,libxslt,host))
-- 
1.7.3.4
