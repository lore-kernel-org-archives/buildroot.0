From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 00:57:47 +0200
Subject: [Buildroot] [PATCH 02/11] gettext: remove the gettext-target make
	target, unused
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347836276-24262-3-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
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
-- 
1.7.2.5
