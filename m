From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:26:59 +0200
Subject: [Buildroot] [git commit] gettext: remove the gettext-target make
	target, unused
Message-ID: <20120920195432.2A03A996BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd54bec3adbc41151151acbcdd069de99a181985
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/gettext.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 20bd672..6b2c336 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -130,10 +130,6 @@ gettext-dirclean:
 #
 #############################################################
 
-gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
-	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
-
 $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
 		$(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
