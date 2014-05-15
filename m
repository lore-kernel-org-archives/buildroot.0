From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 22:42:01 +0200
Subject: [Buildroot] [git commit] package/rsyslog: needs MMU (fork)
Message-ID: <20140515204429.745FB9CBF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=934147cf6bfdc0c9ea5be1cbeb19795fc778919f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes http://autobuild.buildroot.net/results/5c0/5c03bf3a1e4e922a18b40f854ff59d905a93a89f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
