From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 10:15:57 +0100
Subject: [Buildroot] [git commit] Makefile: Add /usr/lib/locale to
	target-purgelocales
Message-ID: <20140204091934.8332A9C72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d66538b34ac735f279d3c21d83e790acc83745a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages install locales to /usr/lib/locale.
Parse and purge unneeded ones there too.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index dc57cf4..4a675d4 100644
--- a/Makefile
+++ b/Makefile
@@ -564,7 +564,7 @@ target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
 
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man)); \
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
 	do \
 		for lang in $$(cd $$dir; ls .|grep -v man); \
 		do \
