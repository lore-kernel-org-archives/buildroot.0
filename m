From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:23:45 +0200
Subject: [Buildroot] [git commit] libxcb: add explicit dependencies for host
	variant
Message-ID: <20160703072403.9B0F481E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bfafa8cf34d1017ff92d18373f50293dd672b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
[Thomas: add missing host-xcb-proto dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 7f7823b..dbb2a84 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -15,6 +15,9 @@ LIBXCB_INSTALL_STAGING = YES
 LIBXCB_DEPENDENCIES = \
 	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
+HOST_LIBXCB_DEPENDENCIES = \
+	host-libxslt host-libpthread-stubs host-xcb-proto host-xlib_libXdmcp \
+	host-xlib_libXau host-xcb-proto host-python host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
