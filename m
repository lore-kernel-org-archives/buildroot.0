From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:15:36 +0200
Subject: [Buildroot] [git commit] Make: simplify locales whitelisting
Message-ID: <20200618201403.830007FD24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88d5f52441c4b3d2de816ba93adba87f529b51d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ce1c08a6f6..04c29b1c71 100644
--- a/Makefile
+++ b/Makefile
@@ -695,8 +695,7 @@ LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 # in the whitelist file. If it doesn't, kill it.
 # Finally, specifically for X11, regenerate locale.dir from the whitelist.
 define PURGE_LOCALES
-	rm -f $(LOCALE_WHITELIST)
-	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
+	printf '%s\n' $(LOCALE_NOPURGE) locale-archive > $(LOCALE_WHITELIST)
 
 	for dir in $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale); \
 	do \
