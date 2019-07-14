From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 11:03:01 +0200
Subject: [Buildroot] [PATCH] package/cpio: add host version
Message-ID: <20190714090301.26552-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest cpio has a --reproducible option, which may come handy when
we try to, well, be reproducible...

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Atharva Lele <itsatharva@gmail.com>
---
 package/cpio/cpio.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 9a09279572..d2814b87a5 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -16,4 +16,7 @@ ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CPIO_DEPENDENCIES += argp-standalone
 endif
 
+HOST_CPIO_CONF_OPTS = --bindir=$(HOST_DIR)/bin
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
