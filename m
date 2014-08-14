From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 14 Aug 2014 20:49:59 +0200
Subject: [Buildroot] [PATCH] pkg-perl: fix build of perl XS packages
Message-ID: <1408042199-28433-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set OPTIMIZE in order to avoid the use of the host $Config{optimize} value
which could cause breakage when cross-compiling for the target.

See discussion in http://lists.busybox.net/pipermail/buildroot/2014-August/104129.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index f073d70..51eaf52 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -56,6 +56,7 @@ define $(2)_CONFIGURE_CMDS
 			--config full_ar="$$(TARGET_AR)" \
 			--config cc="$$(TARGET_CC)" \
 			--config ccflags="$$(TARGET_CFLAGS)" \
+			--config optimize=" " \
 			--config ld="$$(TARGET_CC)" \
 			--config lddlflags="-shared $$(TARGET_LDFLAGS)" \
 			--config ldflags="$$(TARGET_LDFLAGS)" \
@@ -78,6 +79,7 @@ define $(2)_CONFIGURE_CMDS
 			FULL_AR="$$(TARGET_AR)" \
 			CC="$$(TARGET_CC)" \
 			CCFLAGS="$$(TARGET_CFLAGS)" \
+			OPTIMIZE=" " \
 			LD="$$(TARGET_CC)" \
 			LDDLFLAGS="-shared $$(TARGET_LDFLAGS)" \
 			LDFLAGS="$$(TARGET_LDFLAGS)" \
-- 
1.9.1
