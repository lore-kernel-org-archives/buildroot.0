From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:47 +0100
Subject: [Buildroot] [PATCH 78/84 RFC] package/transmission: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <c388f952278706f39d978bdba3fd80a0045375d6.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

transmission has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/transmission/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index b47c36f..92928c7 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_TRANSMISSION
+menuconfig BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -45,6 +45,7 @@ config BR2_PACKAGE_TRANSMISSION_GTK
 
 comment "transmission-gtk needs a toolchain w/ locale"
 	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
+
 endif
 
 comment "transmission needs a toolchain w/ threads"
-- 
1.9.1
