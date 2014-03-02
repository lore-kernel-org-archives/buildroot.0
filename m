From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:36 +0100
Subject: [Buildroot] [PATCH 03/13] Makefile: add BR2_DL_DIR to EXTRA_ENV
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <b177514bfb864952ff6f2d1029c9830fc9e573fd.1393781650.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Also export BR2_DL_DIR for incoming download helper scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
