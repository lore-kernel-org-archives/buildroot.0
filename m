From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 20:57:57 +0200
Subject: [Buildroot] [git commit] smcroute: needs MMU
Message-ID: <20140603185956.D8BE19CE4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63be13cba86e4616a89ad377b4cfdffff5af2cdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9ce/9ce921dc00bcabcddd260916d0f7c44b62029df1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smcroute/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
index df42db3..c244cb9 100755
--- a/package/smcroute/Config.in
+++ b/package/smcroute/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMCROUTE
 	bool "smcroute"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  SMCRoute is a command line tool to manipulate the multicast
 	  routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast
@@ -13,3 +14,4 @@ config BR2_PACKAGE_SMCROUTE
 
 comment "smcroute needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
+	depends on BR2_USE_MMU
