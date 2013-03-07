From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:29 +0100
Subject: [Buildroot] [PATCH 01/32] xcb-util: add dependency on libxcb
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xcb-util lacks a dependency on libxcb. Without this dependency, it
fails to build with:

checking for XCB... no
configure: error: in `/home/thomas/projets/buildroot/output/build/xcb-util-0.3.9':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables XCB_CFLAGS
and XCB_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util/Config.in   |    1 +
 package/x11r7/xcb-util/xcb-util.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xcb-util/Config.in b/package/x11r7/xcb-util/Config.in
index cf79327..dd77b1d 100644
--- a/package/x11r7/xcb-util/Config.in
+++ b/package/x11r7/xcb-util/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XCB_UTIL
 	bool "xcb-util"
+	depends on BR2_PACKAGE_LIBXCB
 	help
 	  Libraries which sit on top of libxcb, the core X protocol library,
 	  and some of the extension libraries.
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index fcf99ea..a1948e1 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -7,7 +7,7 @@ XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_INSTALL_STAGING = YES
-XCB_UTIL_DEPENDENCIES = host-gperf
+XCB_UTIL_DEPENDENCIES = host-gperf libxcb
 
 $(eval $(autotools-package))
 
-- 
1.7.9.5
