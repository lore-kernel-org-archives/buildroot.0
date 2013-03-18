From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 11:39:39 +0100
Subject: [Buildroot] [git commit] zeromq: require IPv6 support in toolchain
Message-ID: <20130318120456.19FA09B166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f28c09767200dbf04cd1c87861370085188188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The zeromq package was recently bumped from version 2.2.0 to version 3.2.2,
which has introduced a requirement for IPv6 support in the toolchain. At
present, IPv6 support is mandatory in zeromq: there is no configuration option
to enable/disable the feature.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zeromq/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
