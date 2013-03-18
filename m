From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 09:46:02 +0100
Subject: [Buildroot] [git commit] urg: handle config scripts properly
Message-ID: <20130318084644.12EFD9B135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d8d855f0ab28d6cd608b7204a9e13a18b15092
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

urg installs two <foo>-config scripts, so the ones installed in
$(STAGING_DIR) should be fixed up, and the ones installed in
$(TARGET_DIR) should be removed. Use the <pkg>_CONFIG_SCRIPTS
infrastructure to do this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/urg/urg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
