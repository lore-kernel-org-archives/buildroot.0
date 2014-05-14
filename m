From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 May 2014 20:28:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: needs MMU (fork)
In-Reply-To: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400092133-16971-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes http://autobuild.buildroot.net/results/5c0/5c03bf3a1e4e922a18b40f854ff59d905a93a89f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsyslog/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 8a84fea..82a6922 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_RSYSLOG
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # util-linux
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
-- 
1.7.10.4
