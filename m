From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:31:51 +0100
Subject: [Buildroot] [git commit] jimtcl: add error handling to for loop
Message-ID: <20141201223450.CEDAB80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4782c35f1d99d8d3fb61025ce2bfdd68d9b1d6ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
