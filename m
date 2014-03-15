From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:39:07 +0100
Subject: [Buildroot] [git commit] pppd: install to staging
Message-ID: <20140315214420.5FB239BF8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e63802618deb17fd30e2e36c6e27d6015a95f1eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/pppd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0e24bd2..03118ca 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -11,6 +11,7 @@ PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
 PPPD_LICENSE_FILES = pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
+PPPD_INSTALL_STAGING = YES
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_RADIUS_CONF = dictionary dictionary.ascend dictionary.compat \
 			dictionary.merit dictionary.microsoft \
@@ -92,4 +93,8 @@ define PPPD_INSTALL_TARGET_CMDS
 	$(PPPD_INSTALL_RADIUS)
 endef
 
+define PPPD_INSTALL_STAGING_CMDS
+	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPT) install-devel
+endef
+
 $(eval $(generic-package))
