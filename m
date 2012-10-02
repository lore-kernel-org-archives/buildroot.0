From: Valentine Barshak <gvaxon@gmail.com>
Date: Tue,  2 Oct 2012 23:03:51 +0400
Subject: [Buildroot] [PATCH 2/2] Makefile: Add /usr/lib/locale to
	target-purgelocales
In-Reply-To: <1349204631-21077-1-git-send-email-gvaxon@gmail.com>
References: <1349204631-21077-1-git-send-email-gvaxon@gmail.com>
Message-ID: <1349204631-21077-3-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages install locales to /usr/lib/locale.
Parse and purge unneeded ones there too.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 009debe..694c49a 100644
--- a/Makefile
+++ b/Makefile
@@ -476,7 +476,7 @@ target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
 
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man)); \
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
 	do \
 		(cd $$dir && rm -f locale.dir && \
 		for lang in $$(ls .|grep -v "man\|locale\.dir"); \
-- 
1.7.11.4
