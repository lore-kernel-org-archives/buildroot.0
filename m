From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:29:11 +0200
Subject: [Buildroot] [git commit] socketcand: needs toolchain with threads
	support
Message-ID: <20130502213333.3930399A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cd00fcf9c800b2a031fd21c13fbf5985be8fb97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/1d35f22a25e8641106f3c070f360cf4b4a02a461

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
