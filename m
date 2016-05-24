From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 May 2016 22:02:09 +0200
Subject: [Buildroot] [PATCH] package/skeleton: fix message about non-merged
	custom skeleton
Message-ID: <1464120129-29232-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use of a merged /usr is not restricted to systemd anymore, thus the
current error message is misleading, as it only speaks about systemd.

Fix the message by just ditching the reference to systemd altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton/skeleton.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 7618835..4e3cdc6 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -48,8 +48,7 @@ SKELETON_CUSTOM_NOT_MERGED_USR += /sbin
 endif
 
 ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR),)
-$(error Use of systemd as an init system requires a merged /usr. \
-	However, the custom skeleton in $(SKELETON_PATH) is not \
+$(error The custom skeleton in $(SKELETON_PATH) is not \
 	using a merged /usr for the following directories: \
 	$(SKELETON_CUSTOM_NOT_MERGED_USR))
 endif
-- 
2.7.4
