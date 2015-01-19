From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:04 +0200
Subject: [Buildroot] [PATCH 04/16] package/systemd: add missing dependencies
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-5-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd depends on mount and nologin from util-linux. Mount from busybox
is not fine, because its behavior differs from util-linux mount. Busybox
mount does not handle correctly 'mount / -o remount' (should apply
options from /etc/fstab). Nologin should be present, because
systemd-sysusers uses it as shell for newly created system users.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/systemd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ed59c8d..8a73398 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,6 +22,9 @@ config BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
-- 
2.2.1
