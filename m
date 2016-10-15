From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:03 +0200
Subject: [Buildroot] [git commit] rtmpdump: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.7E23F81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=503aabf672ed3cbe09996f5d949a3e4d1426061f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtmpdump/rtmpdump.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index ad4308c..2e3428f 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -38,7 +38,7 @@ RTMPDUMP_MAKE_FLAGS = \
 	$(RTMPDUMP_SHARED)
 
 define RTMPDUMP_BUILD_CMDS
-	$(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
 		XLDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -46,11 +46,11 @@ define RTMPDUMP_BUILD_CMDS
 endef
 
 define RTMPDUMP_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 define RTMPDUMP_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 $(eval $(generic-package))
