From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:10:52 +0200
Subject: [Buildroot] [git commit] host-nodejs: use g++ as linker
Message-ID: <20140416172410.B0C319C506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea737fb100785b3b5756dad320db04062261fd04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/f6b/f6b80ae32acf7f89bb1c12999679ff1be9733d44/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

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
