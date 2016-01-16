From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:04 +0100
Subject: [Buildroot] [PATCH 72/80 v1] package/transmission: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <78f8d45765f1b487f5223680288cfc4237b6f06b.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

transmission has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
