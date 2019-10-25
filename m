From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:19:35 +0200
Subject: [Buildroot] [git commit] package/qemu: enable NUMA support if
 numactl is selected
Message-ID: <20191025181304.75B3F88108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43372c21b7f03c2d94f3244e41aa7f6f56036030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is helpful for the upcoming libvirt package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5f97dab39f..3c8b0f43d8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -104,6 +104,13 @@ else
 QEMU_OPTS += --disable-nettle
 endif
 
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+QEMU_OPTS += --enable-numa
+QEMU_DEPENDENCIES += numactl
+else
+QEMU_OPTS += --disable-numa
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
