From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:59 +0100
Subject: [Buildroot] [PATCHv2 41/74] flot: add error handling to for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-42-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flot/flot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 79bdf1f..58e3ff1 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -27,7 +27,7 @@ FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
 
 define FLOT_INSTALL_TARGET_CMDS
 	for i in $(FLOT_FILES); do \
-		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
+		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js || exit 1; \
 	done
 endef
 
-- 
2.1.0
