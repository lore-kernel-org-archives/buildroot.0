From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:25 +0100
Subject: [Buildroot] [PATCH 33/80 v1] package/cairo: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <42387e32fb29801cd661fbbd42ff315706cff343.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cairo has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
