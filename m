From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Dec 2018 19:31:51 +0100
Subject: [Buildroot] [PATCH 2/2] quagga: zebra needs dynamic library
In-Reply-To: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
References: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201183151.3853-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zebra library defines optind and opterr which are already defined in
libc

Fixes:
 - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quagga/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 98b9d3481e..6c51394db3 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -11,9 +11,13 @@ if BR2_PACKAGE_QUAGGA
 
 config BR2_PACKAGE_QUAGGA_ZEBRA
 	bool "zebra daemon"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Build zebra daemon.
 
+comment "zebra daemon needs dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "Use TCP sockets between zebra and protocol daemons"
 	depends on BR2_PACKAGE_QUAGGA_ZEBRA
-- 
2.17.1
