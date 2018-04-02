From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 10:14:26 +0200
Subject: [Buildroot] [v4 05/13] pkg-{download,
 generic}: use new $($(PKG)_DL_DIR)
In-Reply-To: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402081434.4411-5-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let the infrastructure use the new variable $(PKG)_DL_DIR

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 2 +-
 package/pkg-generic.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2ee745fddd..151b2e5423 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -95,7 +95,7 @@ define DOWNLOAD
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-n $($(PKG)_BASENAME_RAW) \
 		-N $($(PKG)_RAWNAME) \
-		-o $(DL_DIR)/$(notdir $(1)) \
+		-o $($(PKG)_DL_DIR)/$(notdir $(1)) \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(DOWNLOAD_URIS) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 25a34e6ca2..e7f4a0402d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -613,7 +613,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$($(2)_DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
-- 
2.16.2
