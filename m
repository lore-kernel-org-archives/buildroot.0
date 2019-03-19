From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:10:52 +0100
Subject: [Buildroot] [git commit] package/libglib2: add optional dependency
 in libselinux
Message-ID: <20190319210757.6549881DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f43ec6ce8d766d8954d4dd5366cef910c2b11b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libselinux is selected, explicitly set --enable-selinux in the
configure options and build the library first.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d34bfabd52..63bfec32d6 100644
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
