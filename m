From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:11:11 +0100
Subject: [Buildroot] [git commit] ed: use generic extract command
Message-ID: <20170215211147.7B0F3821DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77941272f41c484a71c2a76be285a514ed518957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The generic code now knows how to extract .tar.lz archives. Remove the local
extract code.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ed/ed.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 50adeb4..6b9f65e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -10,15 +10,9 @@ ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_CONF_OPTS = \
 	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)"
-ED_DEPENDENCIES = host-lzip
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
-define ED_EXTRACT_CMDS
-	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(ED_SOURCE) | \
-		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-endef
-
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) ./configure \
