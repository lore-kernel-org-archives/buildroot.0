From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:56:23 +0200
Subject: [Buildroot] [git commit] Makefile: do not purge locale-archive from
	target
Message-ID: <20140715205632.7875C9D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=201adefb6e17e30d8e66b3d673c58cfd17ac1b5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rules to purge unwanted locales from the target also removed
the locale-archive file from /usr/lib/locale which contains the
locale definitions explicitly generated for the target.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b3bd91e..1af51de 100644
--- a/Makefile
+++ b/Makefile
@@ -538,7 +538,7 @@ LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
 define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
-	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
+	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
 
 	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
 	do \
