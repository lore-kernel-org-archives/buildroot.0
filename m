From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  6 May 2013 12:14:55 +0200
Subject: [Buildroot] [PATCH 1/3] armv8: Fix defconfig build
In-Reply-To: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1367835297-6560-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 14f48861 ("arc: Add ARC and ARC BE architecture") introduced a
sed match against arc* buildroot architecture to translate it to arc.

This causes a problem with armv8, which is called in buildroot aarch64,
which is also matching, resulting in a build failure.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1692a36..9128c75 100644
--- a/Makefile
+++ b/Makefile
@@ -238,7 +238,8 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
-	-e s/arc.*/arc/ \
+	-e s/arcle/arc/ \
+	-e s/arcbe/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
-- 
1.8.1.2
