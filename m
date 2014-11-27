From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:03 +0100
Subject: [Buildroot] [PATCHv2 45/74] jimtcl: add error handling to for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-46-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jimtcl/jimtcl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 27f43f0..add61d6 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -51,7 +51,7 @@ endef
 
 define JIMTCL_INSTALL_STAGING_CMDS
 	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
-		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ ; \
+		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
 	done; \
 	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.$(JIMTCL_LIB);
 	ln -s libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.so
-- 
2.1.0
