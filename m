From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:44 -0300
Subject: [Buildroot] [PATCH 3/7] kismet: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kismet/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 8de29be..a0e7c67 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
-- 
1.8.1.5
