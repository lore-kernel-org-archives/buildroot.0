From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 10:19:14 +0200
Subject: [Buildroot] [git commit] pkg-perl: fix build of perl XS packages
Message-ID: <20140815090111.632B19D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6057878756f6f58d613a40be9636581ae5950aa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set OPTIMIZE in order to avoid the use of the host $Config{optimize} value
which could cause breakage when cross-compiling for the target.

See discussion in http://lists.busybox.net/pipermail/buildroot/2014-August/104129.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-perl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
