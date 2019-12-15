From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Dec 2019 20:54:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: select libseccomp when
 sandbox is enabled
Message-ID: <20191215185401.3843763-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_PACKAGE_LIBSECCOMP when the sandboxing support is enabled
during configuration.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 87de91f554..3ac76f9886 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -61,6 +61,7 @@ config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
+	select BR2_PACKAGE_LIBSECCOMP
 	help
 	  Enable sandboxing of the processes used for network operation,
 	  disk access, and Web content rendering.
-- 
2.24.1
