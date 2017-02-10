From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Feb 2017 07:52:15 +0200
Subject: [Buildroot] [PATCH 3/4] ddrescue: use generic extract command
In-Reply-To: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
Message-ID: <08d0ee4a05af046bff99079cd8a00045d75aef1e.1486705936.git.baruch@tkos.co.il>
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
