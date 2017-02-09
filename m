From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 21:50:16 +0200
Subject: [Buildroot] [PATCH 5/7] ddrescue: use generic extract command
In-Reply-To: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
Message-ID: <4814b71b518d6d805d63e83b533cd394155b13d5.1486669818.git.baruch@tkos.co.il>
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
index 23f03436e9fa..4c87e4dac8fa 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -9,11 +9,5 @@ DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPLv2+
 DDRESCUE_LICENSE_FILES = COPYING
-DDRESCUE_DEPENDENCIES = host-lzip
-
-define DDRESCUE_EXTRACT_CMDS
-	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(DDRESCUE_SOURCE) | \
-		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-endef
 
 $(eval $(autotools-package))
-- 
2.11.0
