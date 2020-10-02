From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Oct 2020 22:28:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/librelp: needs threads
Message-ID: <20201002202831.2844845-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e09f6eb989388cec2dab06391a8b6580aa0ff118

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librelp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/librelp/Config.in b/package/librelp/Config.in
index d1f1f9ed7e..c0ae5fbe89 100644
--- a/package/librelp/Config.in
+++ b/package/librelp/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBRELP
 	bool "librelp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Reliable Event Logging Protocol library
 
 	  https://www.rsyslog.com/librelp/
+
+comment "librelp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.28.0
