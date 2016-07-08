From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Jul 2016 23:00:20 +0200
Subject: [Buildroot] [PATCH] legacy: properly handle systemd compatibility
	libs
Message-ID: <1468011620-28260-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The legacy symbol for systemd compatibility libraries was not selecting
the BR2_LEGACY symbol, so the buld-time check would not kick in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4101cb0..746b80a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,6 +147,7 @@ comment "Legacy options removed in 2016.08"
 
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
+	select BR2_LEGACY
 	help
 	  The systemd option to enable the compatibility libraries has
 	  been removed. Theses libraries have been useless since a few
-- 
2.7.4
