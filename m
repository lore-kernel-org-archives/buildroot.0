From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Feb 2015 17:29:08 +0100
Subject: [Buildroot] [git commit branch/next] odhcp6c: install default state
	script
Message-ID: <20150225161643.1BB96817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=899935b3e29a5aee3b6b26fb0ccfe78a921cfc13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/odhcp6c/odhcp6c.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 520eaf2..8102c26 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -9,4 +9,11 @@ ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
 ODHCP6C_LICENSE = GPLv2
 ODHCP6C_LICENSE_FILES = COPYING
 
+define ODHCP6C_INSTALL_SCRIPT
+        $(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
+		$(TARGET_DIR)/usr/sbin/odhcp6c-update
+endef
+
+ODHCP6C_POST_INSTALL_TARGET_HOOKS += ODHCP6C_INSTALL_SCRIPT
+
 $(eval $(cmake-package))
