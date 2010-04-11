From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:15 +0200
Subject: [Buildroot] [PATCH 19/25] Get rid of now unused HOST_ARCH
	computation code
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e35dcfa8703a12f09850900f5ab32918fd849a58.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
