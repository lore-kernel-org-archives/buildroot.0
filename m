From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 10:34:11 +0200
Subject: [Buildroot] [git commit] uboot-tools: force host CFLAGS
Message-ID: <20180810082800.1421A8B85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a808a0999ac031a1e93000d9a3c50ffbcb64a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot now adds -std=gnu11 when building its build utilities, like
fixdep. This option is only supported since gcc version 4.7.

  https://gcc.gnu.org/gcc-4.7/changes.html

Force usage of Buildroot HOST_CFLAGS, like we do already for
host-uboot-tools, to avoid the -std=gnu11 option.

Fixes:
http://autobuild.buildroot.net/results/ea0/ea09b614a3c10d494939d9551c0c3bfca4626ece/
http://autobuild.buildroot.net/results/f8e/f8efd9af4d86c51fe4f5afe44db9abf9adc5718f/
http://autobuild.buildroot.net/results/c0a/c0ab35c3cb46f84863fe20c0ee92ecc2379578b6/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f5027d2da3..5ac7b1c293 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -19,6 +19,7 @@ endef
 UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
+	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
