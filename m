From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:11:11 +0100
Subject: [Buildroot] [git commit] ddrescue: use generic extract command
Message-ID: <20170215211147.8B4A9821DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a7a97c270c2148136093d6ad372f390ac20685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The generic code now knows how to extract .tar.lz archives. Remove the local
extract code

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ddrescue/ddrescue.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 145d052..4e244e6 100644
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
