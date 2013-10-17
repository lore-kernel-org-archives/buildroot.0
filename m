From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 17 Oct 2013 16:58:08 +0200
Subject: [Buildroot] [PATCH] tslib: needs shared library for dlopen
Message-ID: <ed7d27afb27011d62944.1382021888@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1242cbea015e5a24a6621d1bd5569d2a1a819bb4/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/tslib/Config.in |  4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
+	depends on !BR2_PREFER_STATIC_LIB # dlopen
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
 	  http://tslib.berlios.de/
+
+comment "tslib needs a toolchain w/ shared library"
+	depends on BR2_PREFER_STATIC_LIB
