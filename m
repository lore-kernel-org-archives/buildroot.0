From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:45:15 +0100
Subject: [Buildroot] [git commit] xlib_libpthread-stubs: needs -pthread when
	linking statically
Message-ID: <20131110225806.960309BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79afe8e70ff806eaaebc263bcd00ebcc88960493
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes e.g. http://autobuild.buildroot.net/results/1eaa694263b74313b0c90c510abcb11d490a3773/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 5ea02e9..6343691 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -12,5 +12,9 @@ XLIB_LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
 
 XLIB_LIBPTHREAD_STUBS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+XLIB_LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
