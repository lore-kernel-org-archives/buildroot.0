From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 13:52:22 +0100
Subject: [Buildroot] [git commit] package/wayland: Fix wrong condition to
	display the comment
Message-ID: <20141122131802.E5D337FE25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74b87a81fd85f3c55a0e330f3102d8560038c866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wayland/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index cb10fac..f90cda6 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -14,4 +14,4 @@ config BR2_PACKAGE_WAYLAND
 
 comment "wayland needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_avr32
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
