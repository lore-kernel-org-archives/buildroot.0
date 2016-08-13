From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Aug 2016 19:06:58 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd-bootchart: needs headers >=
	3.17
Message-ID: <1471108019-21603-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses GRND_NONBLOCK, introduced in 3.17.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd-bootchart/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
index 2a70b8d..8deb6b9 100644
--- a/package/systemd-bootchart/Config.in
+++ b/package/systemd-bootchart/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	bool "systemd-bootchart"
 	depends on BR2_INIT_SYSTEMD
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	help
 	  systemd-bootchart is a tool, usually run at system startup,
 	  that collects the CPU load, disk load, memory usage, as well
@@ -19,3 +20,7 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	  these options are enabled.
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
+
+comment "systemd-bootchart needs a toolchain w/ headers >= 3.17"
+	depends on BR2_INIT_SYSTEMD
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-- 
2.7.4
