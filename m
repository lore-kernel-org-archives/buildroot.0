From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Get rid of now unused HOST_ARCH
	computation code
Message-ID: <20100411195037.4988820B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ce3bd8da2aa10b9e7a6051aa2ef6b57ab58b7236
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8f1a29d..43ff2dd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -174,20 +174,6 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
-HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
-	-e 's/sparc.*/sparc/' \
-	-e 's/arm.*/arm/g' \
-	-e 's/m68k.*/m68k/' \
-	-e 's/ppc/powerpc/g' \
-	-e 's/v850.*/v850/g' \
-	-e 's/sh[234]/sh/' \
-	-e 's/mips-.*/mips/' \
-	-e 's/mipsel-.*/mipsel/' \
-	-e 's/cris.*/cris/' \
-	-e 's/i[3-9]86/i386/' \
-	-e 's/xtensa.*/xtensa/' \
-	)
-
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-- 
1.6.3.3
