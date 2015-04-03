From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:32:57 +0200
Subject: [Buildroot] [git commit] package/kodi: enable gconv libraries on
	glibc configurations
Message-ID: <20150403123350.9AD5881998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48a717343deabbf9aa8b09f0c2b6944bcb5a81d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a glibc toolchain is used, Kodi really requires the gconv
libraries to be installed, otherwise no text is rendered in the GUI.

[Thomas: slightly improve commit message.]

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a0cbb18..88d1109 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -91,6 +91,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
+	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
