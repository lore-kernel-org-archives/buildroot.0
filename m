From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:07:37 +0200
Subject: [Buildroot] [git commit] fio: add optional zlib dependency
Message-ID: <20160723210759.87B7481E0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d79885b03af073ef6560c404c4d05c8575accde6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/fio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index e09bd71..662b2b2 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -13,6 +13,10 @@ ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FIO_DEPENDENCIES += zlib
+endif
+
 define FIO_CONFIGURE_CMDS
 	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
