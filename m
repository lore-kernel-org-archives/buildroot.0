From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:22:04 +0200
Subject: [Buildroot] [PATCH 06/13] pkg-{download,
	generic}: use new $($(PKG)_DL_DIR)
In-Reply-To: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704162211.13238-7-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let the infrastructure use the new variable $(PKG)_DL_DIR

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 2 +-
 package/pkg-generic.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index be61fb130a..9a455dc79b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -95,7 +95,7 @@ define DOWNLOAD
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-n $($(PKG)_RAW_BASE_NAME) \
 		-N $($(PKG)_RAWNAME) \
-		-o $(DL_DIR)/$(notdir $(1)) \
+		-o $($(PKG)_DL_DIR)/$(notdir $(1)) \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(DOWNLOAD_URIS) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1cd41fda5..5d169b20d6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -579,7 +579,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$($(2)_DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
-- 
2.13.2
