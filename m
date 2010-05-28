From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 May 2010 22:47:52 +0200
Subject: [Buildroot] [git commit master] Remove locale dependency from
	xserver
Message-ID: <20100528210456.7B0168D577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b578f670d153a04cc410e0696013e9c606f38439
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XServer compiles just fine without locale support

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 55524a0..b93cc90 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -19,11 +19,10 @@ choice
 
 config BR2_PACKAGE_XSERVER_xorg
 	bool "Modular X.org"
-	# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
-	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
+	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
 
-comment 'X.org requires largefile, locale and C++ support'
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE)
+comment 'X.org requires largefile and C++ support'
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "TinyX"
-- 
1.6.3.3
