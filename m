From: Atharva Lele <itsatharva@gmail.com>
Date: Sun, 14 Jul 2019 21:53:34 +0530
Subject: [Buildroot] [PATCH 1/2] package/cpio: add host version
Message-ID: <20190714162335.12684-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The latest cpio has a --reproducible option, which may come handy when
we try to, well, be reproducible...

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Atharva: Made change pointed out by Arnout: remove HOST_CPIO_CONF_OPTS]
Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - Add patch from Yann to my series
---
 package/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 9a09279572..cc40838840 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -17,3 +17,4 @@ CPIO_DEPENDENCIES += argp-standalone
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.22.0
