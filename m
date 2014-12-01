From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:30:37 +0100
Subject: [Buildroot] [git commit] flot: add error handling to for loop
Message-ID: <20141201223450.A47E880048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bd3cbf90cc8b51b7d86ef80df192db9dcc2f817
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flot/flot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
