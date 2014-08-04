From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 09:46:16 -0300
Subject: [Buildroot] [PATCH] pcmanfm: add mmu depends
Message-ID: <1407156376-22785-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pcmanfm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index cf77e36..b3baa4c 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -17,3 +17,4 @@ config BR2_PACKAGE_PCMANFM
 comment "pcmanfm needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
1.8.5.5
