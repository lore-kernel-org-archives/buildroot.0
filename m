From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Sep 2014 10:14:52 -0400
Subject: [Buildroot] [PATCH 2/2] libqrencode: needs thread support
In-Reply-To: <1410704092-3006-1-git-send-email-danomimanchego123@gmail.com>
References: <1410704092-3006-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1410704092-3006-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libqrencode/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
index b866626..2888113 100644
--- a/package/libqrencode/Config.in
+++ b/package/libqrencode/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBQRENCODE
 	bool "libqrencode"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libqrencode is a C library for encoding data in a QR Code
 	  symbol, a kind of 2D symbology that can be scanned by handy
@@ -18,3 +19,6 @@ config BR2_PACKAGE_LIBQRENCODE_TOOLS
 	  Build command-line tools
 
 endif #BR2_PACKAGE_LIBQRENCODE
+
+comment "libqrencode needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
