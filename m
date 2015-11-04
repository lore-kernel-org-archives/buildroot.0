From: Steven Noonan <steven@uplinklabs.net>
Date: Tue,  3 Nov 2015 23:36:48 -0800
Subject: [Buildroot] [PATCH] pkg-generic: use correct variable name for tar
	extraction exclusions
Message-ID: <1446622608-22556-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only users of this feature are in package/gcc, but they were using
$(2)_TAR_EXCLUDES instead of pkg-generic's $(2)_EXCLUDES. The former name makes
more sense to me and is more readable, so let's just use that.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1ae0315..63d72bb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -519,7 +519,7 @@ $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
 		-C $$($(2)_DIR) \
-		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
+		$$(foreach x,$$($(2)_TAR_EXCLUDES),--exclude='$$(x)' ) \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-- 
2.6.2
