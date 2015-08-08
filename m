From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:50 -0000
Subject: [Buildroot] [git commit branch/next] pkg-generic: support for lzma
	archives
Message-ID: <20150808105612.D00C27F891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57d0d93efd4034c6d874568defe6fc77810b1e4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 99a3c1e..44bd2c9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -73,6 +73,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
+INFLATE.lzma = $(XZCAT)
 INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
