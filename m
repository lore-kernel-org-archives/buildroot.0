From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Apr 2012 13:29:22 +0200
Subject: [Buildroot] [PATCH 2/3] Fix systemd failure with media devices
In-Reply-To: <cover.1334748542.git.maxime.ripard@free-electrons.com>
References: <cover.1334748542.git.maxime.ripard@free-electrons.com>
Message-ID: <81922605e072cb2c80e6b3bbad5ae5f8ab810e31.1334748542.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/systemd/systemd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 717bdcc..83800c5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,8 +64,13 @@ define SYSTEMD_INSTALL_TTY_HOOK
 	ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
 
+define SYSTEMD_INSTALL_MISC
+	mkdir -p $(TARGET_DIR)/media
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
+	SYSTEMD_INSTALL_MISC \
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.5.4
