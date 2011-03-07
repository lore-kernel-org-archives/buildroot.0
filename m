From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:50 +0100
Subject: [Buildroot] [PATCH 6/6] libxslt: remove xslt-config script from
	TARGET_DIR
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <efeebdbd427906fecf404e9a71066398d144f082.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
