From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Dec 2016 09:10:14 +0100
Subject: [Buildroot] [git commit] swupdate: replace BR2_PREFER_STATIC_LIB
	with BR2_STATIC_LIBS
Message-ID: <20161210081349.4C15A818EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6969e97e7803519d4f6b8266fc395d8a94c0a76b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol to control static compilation was renamed in 2015.02, but missed
when swupdate was added.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c905c1d..688f4ee 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -83,7 +83,7 @@ SWUPDATE_BUILD_CONFIG = $(@D)/.config
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define SWUPDATE_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
 endef
