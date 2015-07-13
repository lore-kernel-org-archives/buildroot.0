From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 Jul 2015 23:00:34 +0200
Subject: [Buildroot] [PATCH] purge-locales: skip /usr/man and /usr/share/man
Message-ID: <1436821234-31713-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These directories are going to be removed anyway, so no point purging
their locales.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4b6360b..60bb006 100644
--- a/Makefile
+++ b/Makefile
@@ -544,7 +544,7 @@ define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
 
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
 	do \
 		for lang in $$(cd $$dir; ls .|grep -v man); \
 		do \
-- 
2.1.4
