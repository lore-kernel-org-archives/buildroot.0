From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Mar 2015 17:44:08 -0300
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
Message-ID: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samba 3.6.x is now EOL, people should move to samba4.

See: https://www.samba.org/samba/history/samba-4.2.0.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 9d04851..7ff8428 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_nios2 # binary too large, relocations don't fit
@@ -15,6 +16,7 @@ config BR2_PACKAGE_SAMBA
 		so choose only the components you need.
 
 comment "samba needs a toolchain w/ threads"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
2.0.5
