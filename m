From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:12:37 +0200
Subject: [Buildroot] [git commit] libnss: remove upstream patch
Message-ID: <20180602201105.F05E283864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=800aefb1822f8d9a30b5a116f523cd573744ea2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The merge of the next branch failed to remove an upstream applied patch.

Fixes:
http://autobuild.buildroot.net/results/31f/31fe428584ada680f30d11e5d1abfbc533c0a70e/
http://autobuild.buildroot.net/results/bb2/bb25363497dfd7fd5f8a81c28110fab87d5c2dc8/
http://autobuild.buildroot.net/results/70a/70adacf85154d2a663808cf0db69849b6a490457/

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Avoid-stringop-truncation-warning-r-fran.patch | 33 ----------------------
 1 file changed, 33 deletions(-)

diff --git a/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch b/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch
deleted file mode 100644
index c14880b117..0000000000
--- a/package/libnss/0004-Bug-1438426-Avoid-stringop-truncation-warning-r-fran.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f0ce70989526fc9a0223398c99ea0d09777ea5df Mon Sep 17 00:00:00 2001
-From: Martin Thomson <martin.thomson@gmail.com>
-Date: Thu, 15 Feb 2018 16:34:02 +1100
-Subject: [PATCH] Bug 1438426 - Avoid stringop-truncation warning, r=franziskus
-
---HG--
-extra : rebase_source : 4ea1630d0da0ce3523309e3da33ee50961682242
-
-Upstream-commit: https://github.com/nss-dev/nss/commit/f0ce70989526fc9a0223398c99ea0d09777ea5df
-[Thomas: edited after git format-patch to add the nss/ prefix needed
-for the patch to apply properly on the source code extracted by the
-tarball.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- nss/coreconf/nsinstall/pathsub.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/coreconf/nsinstall/pathsub.c b/nss/coreconf/nsinstall/pathsub.c
-index a42a9f30a..c31a946f0 100644
---- a/nss/coreconf/nsinstall/pathsub.c
-+++ b/nss/coreconf/nsinstall/pathsub.c
-@@ -212,7 +212,7 @@ reversepath(char *inpath, char *name, int len, char *outpath)
- 	    xchdir("..");
- 	} else {
- 	    cp -= 3;
--	    strncpy(cp, "../", 3);
-+	    memcpy(cp, "../", 3);
- 	    xchdir(buf);
- 	}
-     }
--- 
-2.14.3
-
