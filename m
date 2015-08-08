From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:39 -0000
Subject: [Buildroot] [git commit branch/next] package/systemd: add missing
	dependencies
Message-ID: <20150808105629.2FF607FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b746088a6091165960d9494957fd67845f5832c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Systemd depends on mount and nologin from util-linux. Mount from busybox
is not fine, because its behavior differs from util-linux mount. Busybox
mount does not handle correctly 'mount / -o remount' (should apply
options from /etc/fstab). Nologin should be present, because
systemd-sysusers uses it as shell for newly created system users.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 38353d0..303cf22 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -20,6 +20,9 @@ config BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
