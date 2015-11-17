From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:03:28 +0100
Subject: [Buildroot] [git commit] core/legal-info: fix missing double-$
Message-ID: <20151117160747.29BA380097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3c7b5274d7dfbf60b357f7c0e42bf9d2d2e5fdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a5d0e57..08f4f31 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -795,7 +795,7 @@ else
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
-	$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
+	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
 # Copy the source tarball (just hardlink if possible)
 	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
