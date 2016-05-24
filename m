From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:12:18 +0200
Subject: [Buildroot] [git commit] package/skeleton: fix message about
	non-merged custom skeleton
Message-ID: <20160524201558.D326E81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8270d3e3b153c95926446081897c4bfc44ef81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use of a merged /usr is not restricted to systemd anymore, thus the
current error message is misleading, as it only speaks about systemd.

Fix the message by just ditching the reference to systemd altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
