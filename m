From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 20:58:21 +0100
Subject: [Buildroot] [git commit] strongswan: needs threads
Message-ID: <20140225200719.B27DB9BA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b38a1e6bb99ac53b3a95db52869c8d194ff94f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e23/e2394705545dad8e33ffc558df518014c15f5271/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 63316cb..d53da64 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,6 +1,10 @@
+comment "strongswan needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
 	  Linux operating system. It is based on the discontinued
