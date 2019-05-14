From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 22:52:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/woff2: add a comment for C++
Message-ID: <20190514205204.6859-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

woff2 depends on C++ so add a comment if C++ is not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/woff2/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/woff2/Config.in b/package/woff2/Config.in
index 48672570dd..d280414d4c 100644
--- a/package/woff2/Config.in
+++ b/package/woff2/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_WOFF2
 	  typically used for Web fonts
 
 	  https://github.com/google/woff2
+
+comment "woff2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.20.1
