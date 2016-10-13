From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:54 -0300
Subject: [Buildroot] [PATCH 47/51] espeak: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-48-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/espeak/espeak.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 0aa049e..734ec30e 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -32,12 +32,12 @@ define ESPEAK_CONFIGURE_CMDS
 endef
 
 define ESPEAK_BUILD_CMDS
-	$(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
 		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
 endef
 
 define ESPEAK_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
