From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jul 2015 01:21:27 +0300
Subject: [Buildroot] [PATCH] mosh: don't show dependencies comment on
	unsupported arches
Message-ID: <b994c845f6e1f42f7a88e70dfffb4b00ce6d134e.1437949287.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mosh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 2f5214cd3c88..4ad7d61023b6 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,5 +1,6 @@
 comment "mosh needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
 
 config BR2_PACKAGE_MOSH
 	bool "mosh"
-- 
2.1.4
