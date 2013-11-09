From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat,  9 Nov 2013 01:21:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpthread-stubs: needs -pthread
	when linking statically
Message-ID: <1383956481-16389-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes e.g. http://autobuild.buildroot.net/results/1eaa694263b74313b0c90c510abcb11d490a3773/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
My gcc manual only documents the -pthread option for some architectures,
but it seems to work for x86, sh and arm as well.

v2: resend
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.8.4.2
