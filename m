From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:06:22 +0100
Subject: [Buildroot] [git commit] tinyhttpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221141.146018002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=577a1b2072ce4cc00c7bf7b8b966bb61fd98293a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyhttpd/tinyhttpd.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index ec47fd9..0934b71 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -16,9 +16,12 @@ endef
 
 define TINYHTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/tinyhttpd
+	mkdir -p $(TARGET_DIR)/var/www
+endef
+
+define TINYHTTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
 		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
-	mkdir -p $(TARGET_DIR)/var/www
 endef
 
 $(eval $(generic-package))
