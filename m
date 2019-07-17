From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:47:34 +0200
Subject: [Buildroot] [git commit] package/cpio: add host version
Message-ID: <20190717065217.DB01E83DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48f2f4dd8e4a54dcbfcda947c6ced724c77841c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest cpio has a --reproducible option, which may come handy when
we try to, well, be reproducible...

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Atharva: don't force --bindir, as noticed by Arnout]
Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Atharva Lele <itsatharva@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
