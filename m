From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Tue, 11 Mar 2014 15:31:24 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: needs threads
In-Reply-To: <CAM+bi4t7XJKmqnZYKYmNGGH7736xJRtPzF9+v=+cjY8VTng0Gg@mail.gmail.com>
References: <CAM+bi4t7XJKmqnZYKYmNGGH7736xJRtPzF9+v=+cjY8VTng0Gg@mail.gmail.com>
Message-ID: <1394548284-22130-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/81ea576d219aaee2bf1a2a5e2d23f0b66a7be6e8/

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 package/libxmlrpc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.9.0.rc3
