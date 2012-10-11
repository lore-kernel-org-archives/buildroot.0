From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 10:37:29 +0200
Subject: [Buildroot] [git commit] libv4l: ensure TARGET_CFLAGS are used
Message-ID: <20121011084009.E9C9399835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c69b809fc12e071225430a7fb627c785cdaa3fc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the lfs handling issues have been worked around, we can
pass TARGET_CONFIGURE_OPTS on the make command line to ensure
TARGET_CFLAGS are used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/libv4l.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a793285..21cdb6d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -23,19 +23,19 @@ endif
 
 define LIBV4L_BUILD_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
 			$(LIBV4L_MAKE_OPTS); done
 endef
 
 define LIBV4L_INSTALL_STAGING_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
 			DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
 define LIBV4L_INSTALL_TARGET_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
 			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
