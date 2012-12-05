From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 16:00:09 -0800
Subject: [Buildroot] [git commit] jamvm: classpath needs ipv6,
	so jamvm as well
Message-ID: <20121205000121.2C1B1999AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a5eeae999150ec4dcb60d5847440fbb8fbdc341
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jamvm/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 852c6e8..0287f80 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
@@ -7,3 +8,6 @@ config BR2_PACKAGE_JAMVM
 	  JVM specification version 2 (blue book).
 
 	  http://jamvm.sf.net
+
+comment "jamvm requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
