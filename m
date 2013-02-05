From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 21:38:16 +0100
Subject: [Buildroot] [git commit] busybox: busybox-update-config should
	depend on busybox-configure
Message-ID: <20130205204625.5F1149A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f026d3642d9ea3bcbc85f2f1ab302a3e35eaa0de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before the config file can be copied, it has to exist.  The
other xxx-update-config targets do this as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9154c08..599e145 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -223,5 +223,5 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-busybox-update-config:
+busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
