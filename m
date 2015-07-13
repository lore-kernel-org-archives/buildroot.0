From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 23:00:09 +0200
Subject: [Buildroot] [PATCH 2/4] pkg-generic: Package can't depends on
	themselves
In-Reply-To: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436821211-4446-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So filter out the current package name from the dependencies list.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index beff2d7..ebaa48f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -415,8 +415,8 @@ endif
 endif
 
 # Eliminate duplicates in dependencies
-$(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
-$(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
+$(2)_FINAL_DEPENDENCIES = $$(filter-out $(1),$$(sort $$($(2)_DEPENDENCIES)))
+$(2)_FINAL_PATCH_DEPENDENCIES = $$(filter-out $(1),$$(sort $$($(2)_PATCH_DEPENDENCIES)))
 $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
 $(2)_INSTALL_STAGING		?= NO
-- 
2.1.4
