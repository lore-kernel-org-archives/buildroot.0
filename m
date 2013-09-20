From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 10:48:44 +0200
Subject: [Buildroot] [git commit] Makefile: Fix the generation of locales
Message-ID: <20130920085051.3799F9B80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea27d6e929414e7af438836f3dde49076b1aa316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -s option is only mandatory for the charmap,
else the filename is always empty and nothing
is generated.

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 6ef0edc..71d94ad 100644
--- a/Makefile
+++ b/Makefile
@@ -554,7 +554,7 @@ ifneq ($(GENERATE_LOCALE),)
 target-generatelocales: host-localedef
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
 	$(Q)for locale in $(GENERATE_LOCALE) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.' -s` ; \
+		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
 		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
 		if test -z "$${charmap}" ; then \
 			charmap="UTF-8" ; \
