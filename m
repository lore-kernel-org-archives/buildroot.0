From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Aug 2017 21:25:41 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: gpio does not build in
	parallel
Message-ID: <20170830192541.14873-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partially fixes #10276.

Reported-by: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ciro Santilli <ciro.santilli@gmail.com>
---
 package/linux-tools/linux-tool-gpio.mk.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index ba75ab4c3f..d5a0dbda38 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -15,13 +15,13 @@ define GPIO_BUILD_CMDS
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		gpio
 endef
 
 define GPIO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		gpio_install
-- 
2.11.0
