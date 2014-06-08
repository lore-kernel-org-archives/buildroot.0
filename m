From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 22:43:02 +0200
Subject: [Buildroot] [PATCH 01/12] Makefile: add BR2_DL_DIR to EXTRA_ENV
In-Reply-To: <cover.1402260012.git.yann.morin.1998@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
Message-ID: <4764864a10dbb10ce18005da1a1ee22c211708cf.1402260012.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Also export BR2_DL_DIR for incoming download helper scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0233506..97053ba 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -305,6 +305,7 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
 # post-images)
 EXTRA_ENV=\
 	PATH=$(BR_PATH) \
+	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
-- 
1.8.3.2
