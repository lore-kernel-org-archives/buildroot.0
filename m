From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 12:09:17 +0100
Subject: [Buildroot] [git commit] qemu: add to host utilities menu
Message-ID: <20141223110939.6DBFD80747@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b268df55c17e8323fe658412df681268b0f1b0df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows qemu-user to be selected by the user. One use case
for this is to call qemu-user from post build scripts to
run regression tests against the build.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host      |    1 +
 package/qemu/Config.in.host |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..9b127c8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/qemu/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
new file mode 100644
index 0000000..a1f0531
--- /dev/null
+++ b/package/qemu/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+
+	  This option builds a user emulator for your selected architecture.
+
+	  http://www.qemu.org
