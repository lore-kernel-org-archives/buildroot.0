From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Dec 2011 11:22:57 +0100
Subject: [Buildroot] [git commit] transmission: gtk client needs locale
	support in toolchain
Message-ID: <20111208102416.6FB5E8F8C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6dfc2109c7149a795f7bda963a9a583685dec3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise configure errors out with:

configure: error: "The gtk client cannot be built without nls support.
Try adding either --enable-nls or --disable-gtk"

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/transmission/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 3fcf017..e7e9f66 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -36,10 +36,12 @@ config BR2_PACKAGE_TRANSMISSION_REMOTE
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2 && BR2_ENABLE_LOCALE
 	help
 	  Install transmission GTK-based GUI interface.
 
+comment "transmission-gtk requires a toolchain with locale support"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
 endif
 
 comment "Transmission requires a toolchain with IPv6 support"
