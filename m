From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 02:11:25 +0200
Subject: [Buildroot] [git commit] purge-locales: further refactoring after
	removing man paths
Message-ID: <20150714001156.6DC70819D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=805240bae841c221c1dc6d42b07fca31d595e298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the man paths have been removed, it is no longer necessary to
grep them out and the loop can be simplified.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 02a1032..f764ae5 100644
--- a/Makefile
+++ b/Makefile
@@ -546,9 +546,9 @@ define PURGE_LOCALES
 
 	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/lib/locale)); \
 	do \
-		for lang in $$(cd $$dir; ls .|grep -v man); \
+		for langdir in $$dir/*; \
 		do \
-			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
+			grep -qx $${langdir##*/} $(LOCALE_WHITELIST) || rm -rf $$langdir; \
 		done; \
 	done
 endef
