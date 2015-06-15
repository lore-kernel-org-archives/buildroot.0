From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 00:57:21 +0200
Subject: [Buildroot] [PATCH v3 1/2] pkg-generic: support for lzma archives
Message-ID: <1434409042-17117-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.8.0
