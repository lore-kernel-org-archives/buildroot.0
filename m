From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 21:30:19 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: select libseccomp when
 sandbox is enabled
Message-ID: <20191215202817.7FF638B571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c061ee3a0a03e06d48038673dc2f6da296401e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_PACKAGE_LIBSECCOMP when the sandboxing support is enabled
during configuration.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
