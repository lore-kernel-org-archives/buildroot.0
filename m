From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 18:47:23 +0200
Subject: [Buildroot] [git commit] package/linux-tools: some selftests needs
 kmod's modprobe
Message-ID: <20190410164324.A699C8D518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c301405c3483fabda21911006986d235296fd12d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some kernel-selftests are using modprobe options (-n) that are not available
from busybox's modprobe, so make sure that BR2_PACKAGE_KMOD_TOOLS is selected.

[linux-4.19 selftests]$ git grep tput
drivers/gpu/drm_mm.sh:if ! /sbin/modprobe -n -q test-drm_mm; then
drivers/usb/usbip/usbip_test.sh:if ! /sbin/modprobe -q -n usbip_host; then

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 22204ed090..4916faa349 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -85,6 +85,8 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PROGS # runtime (tput)
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_KMOD_TOOLS # runtime (modprobe -n)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
