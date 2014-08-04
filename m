From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:40 -0300
Subject: [Buildroot] [PATCH 17/17] xbmc: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xbmc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 6a00531..ebe0882 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_XBMC_ARCH_SUPPORTS
 comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_XBMC_EGL_GLES
 	bool
-- 
1.8.5.5
