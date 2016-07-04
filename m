From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:47 +0200
Subject: [Buildroot] [PATCH 36/83 v2] package/e2fsprogs: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <838b5cb4cf3e458b0bfc2a95e5a4d15c35ea5263.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e2fsprogs has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 4db11e1..ddbc90a 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_E2FSPROGS
+menuconfig BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux/libblkid
-- 
2.7.4
