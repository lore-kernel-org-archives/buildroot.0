From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:38:41 +0200
Subject: [Buildroot] [git commit] fio: add optional dependency on libaio
Message-ID: <20160419213948.125AF8182E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71122f537d2ff93f206818c8d91e06f55fe2b5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fio can automatically detect and use libaio when available, so this
commit makes this optional dependency explicit.

Suggested by Charles <ckhardin@exablox.com> in bug #8851.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/fio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index acebb6f..6c4ad6c 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,6 +9,10 @@ FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
 FIO_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBAIO),y)
+FIO_DEPENDENCIES += libaio
+endif
+
 define FIO_CONFIGURE_CMDS
 	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
