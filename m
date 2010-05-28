From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Fri, 28 May 2010 17:58:35 +0300
Subject: [Buildroot] [PATCH 1/2] Remove locale dependency from xserver
Message-ID: <20100528145834.11609.86446.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XServer compiles just fine without locale support

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
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
