From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:27:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/linux-tools: gpio
	does not build in parallel
Message-ID: <20170906112608.98C848211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6866015b7017c07a782c3eeb14e7ec90fff31ff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Partially fixes #10276.

Reported-by: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4a03d1ac29fbd5d67145a7ee4631fd38163939ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-gpio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk
index ba75ab4..d5a0dbd 100644
--- a/package/linux-tools/linux-tool-gpio.mk
+++ b/package/linux-tools/linux-tool-gpio.mk
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
