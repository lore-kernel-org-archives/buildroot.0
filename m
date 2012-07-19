From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:21:01 +0200
Subject: [Buildroot] [PATCH 2/5] gettext: remove the gettext-target make
	target, unused
In-Reply-To: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <014b6ef48526fab18d423272169747d95b423609.1342732829.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    4 ----
 1 file changed, 4 deletions(-)

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
1.7.9.5
