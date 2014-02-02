From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 23:02:19 +0100
Subject: [Buildroot] [git commit] mtd: Allow to select the host variant
Message-ID: <20140202220324.F175D9BB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d5b468345d52c0e5888667a2287d11f7f598a5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If any of the post-image scripts wants to create mtd/ubi images,
we need to expose an option for mtd-tools to be user-selectable.

[Peter: fix include order]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host     |    1 +
 package/mtd/Config.in.host |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 34e84bf..685a8b8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ source "package/genext2fs/Config.in.host"
 source "package/genimage/Config.in.host"
 source "package/genpart/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
+source "package/mtd/Config.in.host"
 source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/mtd/Config.in.host b/package/mtd/Config.in.host
new file mode 100644
index 0000000..3752266
--- /dev/null
+++ b/package/mtd/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_MTD
+	bool "host mtd, jffs2 and ubi/ubifs tools"
+	help
+	  Build mtd, jffs2 and ubi/ubifs tools
+
+	  http://www.linux-mtd.infradead.org/
