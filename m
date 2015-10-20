From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 14:52:53 +0100
Subject: [Buildroot] [PATCH 1/3] noip: use a simpler sed command with our
	$(SED) variable
Message-ID: <1445349175-41234-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/noip/noip.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index fceea1e..98edfca 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -11,8 +11,7 @@ NOIP_LICENSE = GPLv2+
 NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
-	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
-		$(@D)/noip2.c
+	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		PREFIX=/usr CONFDIR=/etc
 endef
-- 
1.7.1
