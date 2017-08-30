From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:08:49 +0200
Subject: [Buildroot] [git commit] package/linux-tools: gpio does not build
	in parallel
Message-ID: <20170830200127.DCE6B81814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a03d1ac29fbd5d67145a7ee4631fd38163939ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partially fixes #10276.

Reported-by: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/linux-tool-gpio.mk.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index ba75ab4..d5a0dbd 100644
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
