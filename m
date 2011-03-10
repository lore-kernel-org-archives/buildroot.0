From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] libxml2: remove xml2-config
	script from TARGET_DIR
Message-ID: <20110310111401.160068FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c08e016efad74b087b71df09b028f615eb5453db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index d07f631..2a267b2 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -30,6 +30,14 @@ HOST_LIBXML2_CONF_OPT = \
 		--enable-shared --without-debugging --without-python \
 		--without-threads
 
+define LIBXML2_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/xml2-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
+endif
+
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))
 
-- 
1.7.3.4
