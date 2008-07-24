From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 15:21:57 +0200
Subject: [Buildroot] [PATCH 5/5] lxdoom: make package depend on X11 server
In-Reply-To: <1216905717-9197-4-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-4-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1216905717-9197-5-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lxdoom depends on a X11 server to be built, this patch will only show lxdoom if
a X11 server is selected and add xserver_xorg-server to the dependency list.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/lxdoom/Config.in |    2 ++
 package/lxdoom/lxdoom.mk |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lxdoom/Config.in b/package/lxdoom/Config.in
index e3c9be8..4e0d804 100644
--- a/package/lxdoom/Config.in
+++ b/package/lxdoom/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_LXDOOM
 	bool "lxdoom"
+	depends on BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
 	help
 	  This is the linux version of the popular doom game.
+
 config BR2_PACKAGE_LXDOOM_WAD
 	bool "doom shareware wad file"
 	depends on BR2_PACKAGE_LXDOOM || BR2_PACKAGE_PRBOOM
diff --git a/package/lxdoom/lxdoom.mk b/package/lxdoom/lxdoom.mk
index b79fa66..9444656 100644
--- a/package/lxdoom/lxdoom.mk
+++ b/package/lxdoom/lxdoom.mk
@@ -17,6 +17,6 @@ LXDOOM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--includedir=/usr/include --enable-shared \
 		$(DISABLE_NLS)
 
-LXDOOM_DEPENDENCIES = uclibc  
+LXDOOM_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package,lxdoom))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package,lxdoom))
-- 
1.5.4.3
