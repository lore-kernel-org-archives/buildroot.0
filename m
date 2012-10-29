From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 22:04:23 +0100
Subject: [Buildroot] [git commit] pkg-config: mark as deprecated
Message-ID: <20121029211342.277819998B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d17c829cb47c306d6a1e2fa507eb5e3ff08b99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-config/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index eae0a21..7f96d9b 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  pkg-config is a system for managing library compile/link
@@ -11,4 +12,4 @@ config BR2_PACKAGE_PKG_CONFIG
 	  http://www.freedesktop.org/software/pkgconfig/
 
 comment "pkg-config requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on BR2_DEPRECATED && !BR2_USE_WCHAR
