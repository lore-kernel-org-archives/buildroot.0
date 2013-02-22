From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 21 Feb 2013 22:08:56 -0800
Subject: [Buildroot] [PATCH] keyutils: needs mmu
In-Reply-To: <y>
References: <y>
Message-ID: <1361513336-16816-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/ff84ee5335e3302dbb47d881d9903db81884014c

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/keyutils/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 9b9f9bc..6978687 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
 	depends on !BR2_avr32 && !BR2_microblaze
+	depends on BR2_USE_MMU # fork()
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
-- 
1.7.10.4
