From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 14:52:54 +0100
Subject: [Buildroot] [PATCH 2/3] noip: add $(TARGET_MAKE_ENV) before $(MAKE)
In-Reply-To: <1445349175-41234-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445349175-41234-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445349175-41234-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/noip/noip.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 98edfca..a61d141 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -12,8 +12,8 @@ NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
 	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		PREFIX=/usr CONFDIR=/etc
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
-- 
1.7.1
