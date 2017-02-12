From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 22:15:41 +0200
Subject: [Buildroot] [PATCH v3 4/5] ddrescue: use generic extract command
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <99e007645be62d83bce674a444b85158194f090b.1486930542.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generic code now knows how to extract .tar.lz archives. Remove the local
extract code

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ddrescue/ddrescue.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 145d0520d66f..4e244e6bdaef 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -9,12 +9,6 @@ DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPLv2+
 DDRESCUE_LICENSE_FILES = COPYING
-DDRESCUE_DEPENDENCIES = host-lzip
-
-define DDRESCUE_EXTRACT_CMDS
-	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(DDRESCUE_SOURCE) | \
-		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-endef
 
 define DDRESCUE_CONFIGURE_CMDS
 	(cd $(@D); \
-- 
2.11.0
