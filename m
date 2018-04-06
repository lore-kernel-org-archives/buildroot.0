From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:53:01 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qemu: add libssh2
 optional dependency
Message-ID: <20180406165913.DA76E8104E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=176a2d048f595532c69557a758638401eda6c191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Make sure that qemu uses libssh2 when libssh2 is enabled, for build
consistency.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d769377a41e172e1963351c168c97a1212561133)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 345ef52668..c3a7e7738e 100644
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
