From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:46 +0200
Subject: [Buildroot] [PATCH 35/83 v2] package/dropbear: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <4ccb14c665607a99ade0067eba93c3faeae57f25.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dropbear has 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dropbear/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index d92361f..ce1a73b 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DROPBEAR
+menuconfig BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
 	help
-- 
2.7.4
