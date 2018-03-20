From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Mar 2018 20:46:36 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: add libssh2 optional dependency
In-Reply-To: <85f6746ec9845fe4c5cd366cdd3345d08771165f.1521571596.git.baruch@tkos.co.il>
References: <85f6746ec9845fe4c5cd366cdd3345d08771165f.1521571596.git.baruch@tkos.co.il>
Message-ID: <29cf408194b46abbbb75c15a833197b226477246.1521571596.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that qemu uses libssh2 when libssh2 is enabled, for build
consistency.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 345ef526681a..c3a7e7738ee6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -212,6 +212,13 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+QEMU_OPTS += --enable-libssh2
+QEMU_DEPENDENCIES += libssh2
+else
+QEMU_OPTS += --disable-libssh2
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-- 
2.16.2
