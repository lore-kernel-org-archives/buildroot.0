From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 30 Apr 2013 16:23:50 -0700
Subject: [Buildroot] [PATCH] socketcand: needs toolchain with threads support
Message-ID: <1367364230-29266-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/1d35f22a25e8641106f3c070f360cf4b4a02a461

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/socketcand/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index 0d1d983..d5d02de 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
 	select BR2_PACKAGE_LIBCONFIG
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Socketcand is a daemon that provides access to CAN interfaces
 	  on a machine via a network interface.
 
 	  https://github.com/dschanoeh/socketcand
+
+comment "socketcand requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.4.1
