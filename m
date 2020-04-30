From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 11:52:38 +0200
Subject: [Buildroot] [PATCH 01/11] package/pkg-generic.mk: use $(PKG)_NAME
 in step_pkg_size_after
In-Reply-To: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200430095249.782597-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we're already using $(PKG)_DIR in step_pkg_size_after, we can
also just use $(PKG)_NAME. This allows to make $(1) useless, which
means it can be dropped in a follow-up commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8cd5a7ff62..d8df34ed14 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -76,7 +76,7 @@ define step_pkg_size_after
 	LC_ALL=C comm -13 \
 		$($(PKG)_DIR)/.files-list$(3).before \
 		$($(PKG)_DIR)/.files-list$(3).after \
-		| sed -r -e 's/^[^,]+/$(1)/' \
+		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
 		> $($(PKG)_DIR)/.files-list$(3).txt
 	rm -f $($(PKG)_DIR)/.files-list$(3).before
 	rm -f $($(PKG)_DIR)/.files-list$(3).after
-- 
2.25.4
