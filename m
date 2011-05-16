From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 10:13:19 +0200
Subject: [Buildroot] [git commit] haserl: remove 0.8.0 install workaround
Message-ID: <20110516081400.8AF8383511@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=efce5be9af5c026bb1136cb2876c36edaaaba49a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed anymore as stripping is handled on a global level.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/haserl.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index ff3c924..605cbfc 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -7,9 +7,6 @@
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 
-# force haserl 0.8.0 to use install-sh so stripping works
-HASERL_CONF_ENV = ac_cv_path_install=./install-sh
-
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
 		--with-lua-headers=$(STAGING_DIR)
-- 
1.7.3.4
