From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 16 Apr 2014 10:34:42 +0200
Subject: [Buildroot] [PATCH] host-nodejs: use g++ as linker
Message-ID: <1397637282-10098-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/f6b/f6b80ae32acf7f89bb1c12999679ff1be9733d44/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/nodejs/nodejs.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b5973b5..79393e2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -40,11 +40,17 @@ define HOST_NODEJS_CONFIGURE_CMDS
 endef
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		LD="$(HOSTCXX)"
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) install \
+		$(HOST_CONFIGURE_OPTS) \
+		LD="$(HOSTCXX)"
 endef
 
 ifeq ($(BR2_i386),y)
-- 
1.9.1
