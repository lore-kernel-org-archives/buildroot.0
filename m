From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 14:04:03 +0200
Subject: [Buildroot] [git commit] Makefile: Fix KERNEL_ARCH for big endian
	ARC
Message-ID: <20130610120910.B29399AA3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8332ffab07456bd3969b6c4bff2d0c9d3e1e51e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Big endian ARC is called arceb, not arcbe.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d7437a7..c514e4f 100644
--- a/Makefile
+++ b/Makefile
@@ -239,7 +239,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arcle/arc/ \
-	-e s/arcbe/arc/ \
+	-e s/arceb/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
