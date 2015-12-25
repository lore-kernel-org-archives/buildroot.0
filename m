From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:25 +0100
Subject: [Buildroot] [PATCH 56/84 RFC] package/cairo: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <20a6e77dd46c624f7a58b7dcca9bdc116ddca319.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cairo has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cairo/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 38570d6..3525abc 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_CAIRO
+menuconfig BR2_PACKAGE_CAIRO
 	bool "cairo"
 	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_PIXMAN
-- 
1.9.1
