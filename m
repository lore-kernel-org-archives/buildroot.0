From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:30:53 +0100
Subject: [Buildroot] [git commit] Makefile: ignore .config for defconfig
Message-ID: <20131227084417.3C91F9C206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=063f4ee32af9fb725f82f10e9676595f5c7b5282
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we do not include .config for all '%_defconfig' targets, but
we forgot to also exclude plain 'defconfig'.

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 925c1d2..3190541 100644
--- a/Makefile
+++ b/Makefile
@@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	%_defconfig allyesconfig allnoconfig silentoldconfig release \
+	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version olddefconfig
 
