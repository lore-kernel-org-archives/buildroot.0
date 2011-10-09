From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Oct 2011 22:02:51 +0200
Subject: [Buildroot] [git commit] openocd: libusb patch: append rather than
	override LDFLAGS
Message-ID: <20111009201006.0D9078E2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=839ee761878b3e242f4fe4b4a95dfbf161b6b82a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...s-compilation-host-libsub-was-used-before.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch b/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
index 99ff04e..caf1a8b 100644
--- a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
+++ b/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
@@ -23,7 +23,7 @@ index dfa1e8f..cfe2218 100644
 +  dnl check for libusb
 +  PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
 +  CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
-+  LDFLAGS="$LFFLAGS $LIBUSB_LDFLAGS"
++  LDFLAGS="$LDFLAGS $LIBUSB_LDFLAGS"
 +  LIBS="$LIBS $LIBUSB_LIBS"
    build_usb=yes
  fi
