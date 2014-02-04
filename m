From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 11:22:08 +0100
Subject: [Buildroot] [git commit] package/util-linux: add a host variant
Message-ID: <20140204102556.D70BD9C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebeb21d0296df1e4dfe43cdec478043f44aa1916
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host            |    1 +
 package/util-linux/Config.in.host |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 685a8b8..599ab9e 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -15,5 +15,6 @@ source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
+source "package/util-linux/Config.in.host"
 
 endmenu
diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
new file mode 100644
index 0000000..f73dc43
--- /dev/null
+++ b/package/util-linux/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_UTIL_LINUX
+	bool "host util-linux"
+	help
+	  Various useful/essential linux libraries and utilities.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
+
+	  http://www.kernel.org/pub/linux/utils/util-linux/
