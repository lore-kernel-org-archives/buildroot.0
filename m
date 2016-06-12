From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:12 +0200
Subject: [Buildroot] [PATCH 07/24] system: provide no default for custom
	skeleton path
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <e7319daaf1b5432b4dd7d5861692eaad50679d1e.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Being custom means that our default one is not suitable to start with.

So there is no reson to offer it as the default path.

Add a separating empty line, for good measure, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 4f9f270..04b886b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -179,9 +179,9 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 endchoice
 
 if BR2_ROOTFS_SKELETON_CUSTOM
+
 config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	string "custom target skeleton path"
-	default "system/skeleton"
 	help
 	  Path to custom target skeleton.
 
-- 
2.7.4
