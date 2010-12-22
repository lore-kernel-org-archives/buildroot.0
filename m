From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:25 +0100
Subject: [Buildroot] [PATCH 6/7] libxml2: remove xml2-config script from
	TARGET_DIR
In-Reply-To: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b5cd2040e13def8b92682c0b3097e2bb45c5801f.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 387dce3..b9d036d 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -33,6 +33,12 @@ HOST_LIBXML2_CONF_OPT = \
 		--enable-shared --without-debugging --without-python \
 		--without-threads
 
+define LIBXML2_REMOVE_CONFIG_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/usr/bin/xml2-config
+endef
+
+LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
+
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))
 
-- 
1.7.0.4
