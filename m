From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] netplug: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.709FD81974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15c229ea4232e052063a65f9f57153ba1ba0579b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netplug/netplug.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index aeebcad..a165192 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -11,11 +11,11 @@ NETPLUG_LICENSE = GPLv2
 NETPLUG_LICENSE_FILES = COPYING
 
 define NETPLUG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define NETPLUG_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 define NETPLUG_INSTALL_INIT_SYSV
