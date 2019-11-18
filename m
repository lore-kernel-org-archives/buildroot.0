From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 23:06:23 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/lvm2: drop
 optional readline dependency
Message-ID: <20191119073232.8E6558F2ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50c0078c42b5178d6f173adfb6c68e5e72add463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

lvm2 is licensed under GPL-2.0, which is not license compatible with
readline (GPL-3.0+), so drop the optional dependency and add a comment
explaining why.

Notice: The readline support is only used when the raw lvm tool is called
without arguments.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit be72d8c9e620d64a177c17a1611ecd9b3dfbdbcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 7fdb9a7e30..14575668a5 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -28,13 +28,8 @@ LVM2_DEPENDENCIES += host-pkgconf libaio
 # take into account the toolchain passed at configure time.
 LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-LVM2_DEPENDENCIES += readline
-else
-# v2.02.44: disable readline usage, or binaries are linked against provider
-# of "tgetent" (=> ncurses) even if it's not used..
+# package/readline is GPL-3.0+, so not license compatible
 LVM2_CONF_OPTS += --disable-readline
-endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LVM2_CONF_OPTS += --enable-selinux
