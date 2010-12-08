From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:57 +0100
Subject: [Buildroot] [PATCH 05/17] ifplugd: ensure target directories exist
	before copying into
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/ifplugd/ifplugd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 5e66cea..0be903c 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -22,6 +22,7 @@ define IFPLUGD_INSTALL_FIXUP
 		$(INSTALL) $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
 		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	fi
+	mkdir -p $(TARGET_DIR)/etc/ifplugd
 	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.action \
 		$(TARGET_DIR)/etc/ifplugd/
 	$(INSTALL) -m 0755 $(@D)/conf/ifplugd.init \
-- 
1.7.2.3
