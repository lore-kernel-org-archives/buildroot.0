From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 May 2014 21:36:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rsyslog: needs MMU (fork)
Message-ID: <1400096173-17721-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes http://autobuild.buildroot.net/results/5c0/5c03bf3a1e4e922a18b40f854ff59d905a93a89f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: update comment (Baruch/Yann)

 package/rsyslog/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 8a84fea..4ce1918 100644
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
@@ -15,4 +16,5 @@ config BR2_PACKAGE_RSYSLOG
 	  http://www.rsyslog.com
 
 comment "rsyslog needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
-- 
1.7.10.4
