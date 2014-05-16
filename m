From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 18:11:21 +0200
Subject: [Buildroot] [PATCH] package/avahi: does not build with static-only
Message-ID: <1400256681-30273-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/avahi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index fd4d229..483d976 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AVAHI
 	# libdaemon uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
-- 
1.8.3.2
