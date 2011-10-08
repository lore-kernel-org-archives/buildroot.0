From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Oct 2011 22:39:29 +0200
Subject: [Buildroot] [git commit] libplayer: mark python bindings as broken
Message-ID: <20111008204232.2B4F78E27B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddb8c639c312fd9f65dbb123837c100281495d50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it doesn't build.

- upstream didn't adjust player_init call when prototype changed:
  http://hg.geexbox.org/libplayer/rev/e3705df5ce2e

- It tries to build the extension for the host, and not the target:

building 'player' extension
/usr/bin/gcc -pthread -fno-strict-aliasing -O2 ..
/usr/bin/ld: skipping incompatible ./../../src/libplayer.so when
searching for -lplayer.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libplayer/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/libplayer/Config.in b/package/multimedia/libplayer/Config.in
index c9add53..fe851ac 100644
--- a/package/multimedia/libplayer/Config.in
+++ b/package/multimedia/libplayer/Config.in
@@ -23,6 +23,7 @@ comment "gstreamer backend requires a toolchain with WCHAR support"
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
 	depends on BR2_PACKAGE_PYTHON
+	depends on BROKEN # player_init params, builds for host
 	bool "Libplayer python bindings"
 endif
 
