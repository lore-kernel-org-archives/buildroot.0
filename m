From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 11:36:04 +0100
Subject: [Buildroot] [git commit] gpsd: needs threads
Message-ID: <20121214103608.EC9339A1B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f3a4c96312e27ca82f6c26a0179536a11594b95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/05925389ac2531307f23bf5f5f3a83a5a97301bf/

[Peter: move above BR2_PACKAGE_GPSD]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 69f63f9..b26cf07 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,7 +1,11 @@
+comment "gpsd needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
