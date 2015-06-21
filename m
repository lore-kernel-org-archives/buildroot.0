From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:47:12 +0200
Subject: [Buildroot] [git commit] pkg-generic: support for lzma archives
Message-ID: <20150621074842.27E41807FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57d0d93efd4034c6d874568defe6fc77810b1e4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
