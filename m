From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:50 +0100
Subject: [Buildroot] [PATCH 18/51] mongoose: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongoose/mongoose.mk | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.1.0
