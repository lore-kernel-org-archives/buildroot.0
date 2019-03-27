From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:59:15 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libglib2: add
 optional dependency in libselinux
Message-ID: <20190327145930.B7079817E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed3c3f26f7558f4049c84c8b45b6007841f70510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

If libselinux is selected, explicitly set --enable-selinux in the
configure options and build the library first.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f43ec6ce8d766d8954d4dd5366cef910c2b11b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f602c371f5..44c0591109 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -137,6 +137,13 @@ LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBGLIB2_CONF_OPTS += --enable-selinux
+LIBGLIB2_DEPENDENCIES += libselinux
+else
+LIBGLIB2_CONF_OPTS += --disable-selinux
+endif
+
 # Purge gdb-related files
 ifneq ($(BR2_PACKAGE_GDB),y)
 define LIBGLIB2_REMOVE_GDB_FILES
