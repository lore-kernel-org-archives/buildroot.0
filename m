From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:54:50 +0100
Subject: [Buildroot] [git commit] mongoose: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.D23D88002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d77936d446057c9e83040a573f2c3dea59170400
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 35e4b43..7a5d356 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -29,6 +29,9 @@ endef
 define MONGOOSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/examples/web_server/web_server \
 		$(TARGET_DIR)/usr/sbin/mongoose
+endef
+
+define MONGOOSE_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
 		$(TARGET_DIR)/etc/init.d/S85mongoose
 endef
