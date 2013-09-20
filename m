From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Fri, 20 Sep 2013 10:35:46 +0200
Subject: [Buildroot] [PATCH] Fixed the generation of locales
Message-ID: <1379666146-5993-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: tbultel <tbultel@basystemes.fr>

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> 

The -s option is only mandatory for the charmap,
else the filename is always empty and nothing
is generated.

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
-- 
1.7.0.4
