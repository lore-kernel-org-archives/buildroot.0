From: Mario Lang <mlang@blind.guru>
Date: Sat,  3 Feb 2018 18:05:55 +0100
Subject: [Buildroot] [PATCH] package/lynx: depends on dynamic lib
Message-ID: <20180203170555.1431-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following autobuild errors:
  http://autobuild.buildroot.net/results/9a7b37264d592add75dd2a0f233a2de4eba4f489
  http://autobuild.buildroot.net/results/d3ecc533b5c5a33a9385e7f1f689ddf9bfa6fd43

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/lynx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lynx/Config.in b/package/lynx/Config.in
index a338f83616..570d3fd15d 100644
--- a/package/lynx/Config.in
+++ b/package/lynx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LYNX
 	bool "lynx"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
@@ -7,3 +8,6 @@ config BR2_PACKAGE_LYNX
 	  The Text Web-Browser.
 
 	  http://lynx.invisible-island.net/
+
+comment "lynx needs a toolchain w/ dynamic lib"
+	depends on BR2_STATIC_LIBS
-- 
2.15.1
