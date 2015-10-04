From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:50 +0100
Subject: [Buildroot] [PATCH v2 10/18] barebox: remove now-redundant ccache
	handling
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-11-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: No change
---
 boot/barebox/barebox.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index e45976d..00e1537 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -52,8 +52,7 @@ else
 BAREBOX_ARCH = $(KERNEL_ARCH)
 endif
 
-BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
-	$(TARGET_CROSS)"
+BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
 BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-- 
2.5.3
