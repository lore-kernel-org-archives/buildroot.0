From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:14:03 +0100
Subject: [Buildroot] [PATCH 8/8] libev: disable on avr32
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <998c031cc673d7c76c7d9bd8c4402fa928ed803e.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/4951121337fad670d8bf869483774ccf9e91dd47/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libev/Config.in b/package/libev/Config.in
index 71abe77..fd74f55 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBEV
 	bool "libev"
+	# needs memory fences
+	depends on !BR2_avr32
 	help
 	  Userspace library for handling asynchronous notifications
 
-- 
1.7.9.5
