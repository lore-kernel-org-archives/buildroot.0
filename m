From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:42 -0000
Subject: [Buildroot] [git commit branch/next] purge-locales: skip /usr/man
	and /usr/share/man
Message-ID: <20150808105631.AEB4B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36480eab8f64846004cf5c16daff9d55f8f7e31d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These directories are going to be removed anyway, so no point purging
their locales.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 546bcd3..02a1032 100644
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
