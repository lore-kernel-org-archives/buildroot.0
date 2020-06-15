From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 13:16:43 +0200
Subject: [Buildroot] [PATCH] core: splimplify locales whitelisting
Message-ID: <20200615111643.30568-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d2f3455bd1..fae3b2a1ba 100644
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
-- 
2.20.1
