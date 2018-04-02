From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 2 Apr 2018 16:32:27 +0200
Subject: [Buildroot] [git commit] package: add libnpsr host package
Message-ID: <20180402144245.E261982BC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e7d8674ae7b0868caebf4be151de95f7707743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libnspr/libnspr.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 14381bb5e8..d91393f6e8 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -49,4 +49,7 @@ LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIBRARY= install
 LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
 endif
 
+HOST_LIBNSPR_CONF_OPTS += --$(if $(filter %64,$(HOSTARCH)),en,dis)able-64bit
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
