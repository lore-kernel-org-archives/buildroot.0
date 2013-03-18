From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 09:42:05 +0000
Subject: [Buildroot] [PATCH] zeromq: require IPv6 support in toolchain
Message-ID: <1363599725-23511-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The zeromq package was recently bumped from version 2.2.0 to version 3.2.2,
which has introduced a requirement for IPv6 support in the toolchain. At
present, IPv6 support is mandatory in zeromq: there is no configuration option
to enable/disable the feature.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zeromq/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index b7dc8a6..f93ab5d 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,9 +1,10 @@
-comment "zeromq requires a toolchain with C++, LARGEFILE + WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP &&  BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "zeromq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
-- 
1.7.10.4
