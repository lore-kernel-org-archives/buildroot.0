From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:51:34 +0100
Subject: [Buildroot] [PATCH 02/12] Makefile: add BR2_DL_DIR to EXTRA_ENV
In-Reply-To: <cover.1394484283.git.yann.morin.1998@free.fr>
References: <cover.1394484283.git.yann.morin.1998@free.fr>
Message-ID: <867f88ec94d068c99ffe447233ef36eaac9c6cdb.1394484283.git.yann.morin.1998@free.fr>
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
index 2c0b8da..5460caa 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -282,6 +282,7 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
 EXTRA_ENV=\
+	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
-- 
1.8.3.2
