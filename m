From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 09:36:18 +0100
Subject: [Buildroot] [PATCH 2/3] urg: handle config scripts properly
In-Reply-To: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363595779-5094-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363595779-5094-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

urg installs two <foo>-config scripts, so the ones installed in
$(STAGING_DIR) should be fixed up, and the ones installed in
$(TARGET_DIR) should be removed. Use the <pkg>_CONFIG_SCRIPTS
infrastructure to do this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/urg/urg.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index b544ece..99f63a9 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -17,6 +17,8 @@ URG_DEPENDENCIES = sdl sdl_net
 URG_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
+URG_CONFIG_SCRIPTS = c_urg-config urg-config
+
 define URG_EXTRACT_CMDS
 	$(RM) -rf $(URG_DIR)
 	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(URG_SOURCE)
-- 
1.7.9.5
