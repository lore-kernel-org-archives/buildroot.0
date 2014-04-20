From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 19:35:47 +0200
Subject: [Buildroot] [git commit] Revert "host-nodejs: use g++ as linker"
Message-ID: <20140420173732.565A29C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f565796fbb211d1f052241db76f36bae28f9e902
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ea737fb100785b3b5756dad320db04062261fd04, which in
the end didn't fix the autobuilder problem. Since then,
fb80d283412b610fc0f5e4baf1c5bcdf093dadc2 ('nodejs: add a patch forcing
link command to use CXX') was added, and was successfully tested.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 79393e2..b5973b5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -40,17 +40,11 @@ define HOST_NODEJS_CONFIGURE_CMDS
 endef
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(MAKE) -C $(@D) \
-		$(HOST_CONFIGURE_OPTS) \
-		LD="$(HOSTCXX)"
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(MAKE) -C $(@D) install \
-		$(HOST_CONFIGURE_OPTS) \
-		LD="$(HOSTCXX)"
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 $(MAKE) -C $(@D) install
 endef
 
 ifeq ($(BR2_i386),y)
