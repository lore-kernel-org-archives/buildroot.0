From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 09:14:08 +0100
Subject: [Buildroot] [git commit] iftop: needs threads support
Message-ID: <20130206081423.422E89A99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=142d65c31b7c47bb9613eb47f6cb219ccb00657c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/f2cb6113c360b8dbf63bafe5ae425921babdf636

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iftop/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iftop/Config.in b/package/iftop/Config.in
index 99ea973..5c68316 100644
--- a/package/iftop/Config.in
+++ b/package/iftop/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_IFTOP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  iftop does for network usage what top(1) does for CPU usage.
 	  It listens to network traffic on a named interface and displays
@@ -11,5 +12,5 @@ config BR2_PACKAGE_IFTOP
 
 	  http://www.ex-parrot.com/pdw/iftop/
 
-comment "iftop requires IPv6 support in toolchain"
-	depends on !BR2_INET_IPV6
+comment "iftop requires IPv6 and threads support in toolchain"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
