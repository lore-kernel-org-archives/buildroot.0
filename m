From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 14:38:19 +0100
Subject: [Buildroot] [git commit] libevas: SDL OpenGL backend needs modular
	X.org (for mesa)
Message-ID: <20120208133907.81FBE90A32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d27a63e450807a384751b750e58bfcf0faafd22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index fa25485..f701886 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -79,10 +79,14 @@ config BR2_PACKAGE_LIBEVAS_SDL
 config BR2_PACKAGE_LIBEVAS_SDL_GL
 	bool "libevas SDL OpenGL backend"
 	depends on BR2_PACKAGE_SDL_X11
+	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
 	help
 	  This is the SDL OpenGL engine that uses SDL library
 	  and OpenGL to render. This may be hardware accelerated.
 
+comment "SDL OpenGL backend needs modular X.org and X11 support in SDL"
+	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_xorg)
+
 config BR2_PACKAGE_LIBEVAS_X11
 	bool "libevas X11 backend"
 	depends on BR2_PACKAGE_XORG7
