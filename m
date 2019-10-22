From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 22 Oct 2019 19:47:39 -0300
Subject: [Buildroot] [PATCH] package/qemu: enable NUMA support if numactl is
 selected
Message-ID: <20191022224739.4823-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

This is helpful for the upcoming libvirt package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cf2a570efa..77bdcda230 100644
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
-- 
2.18.1
