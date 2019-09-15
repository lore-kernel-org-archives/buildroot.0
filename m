From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:19:30 +0200
Subject: [Buildroot] [git commit] package/qemu: add optional dependency on
 nettle
Message-ID: <20190915131542.A4ADC8E2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c52a679b85a5989b13b8d9e3bbbc35cc9d5bb197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu can optionally depend on nettle if available, so we should take
into account this optional dependency.

Cc: Florian Wolters <florian@florian-wolters.de>
Signed-off-by: Alexander Dahl <post@lespocky.de>
[Thomas: reword commit log, so that it makes sense in the context of
upstream Buildroot]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 05d16560f7..1d3759a850 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,6 +97,13 @@ else
 QEMU_OPTS += --disable-libssh2
 endif
 
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+QEMU_OPTS += --enable-nettle
+QEMU_DEPENDENCIES += nettle
+else
+QEMU_OPTS += --disable-nettle
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
