From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 15:43:18 +0100
Subject: [Buildroot] [git commit] libxmlrpc: needs threads
Message-ID: <20140311144944.F27BB9BEEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35770edfd464705862c09ad1f644009ffd39cc45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/81ea576d219aaee2bf1a2a5e2d23f0b66a7be6e8/

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxmlrpc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index 26e4a52..d24a791 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXMLRPC
 	bool "libxmlrpc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCURL
 	help
 	  XML-RPC is a quick-and-easy way to make procedure calls over
@@ -8,3 +9,6 @@ config BR2_PACKAGE_LIBXMLRPC
 	  back the response as XML.
 
 	  http://xmlrpc-c.sourceforge.net/
+
+comment "libxmlrpc needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
