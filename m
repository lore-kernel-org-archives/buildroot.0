From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 16:18:45 +0200
Subject: [Buildroot] [git commit branch/next] util-linux: rename
 UTIL_LINUX_LIBS -> UTIL_LINUX_LINK_LIBS
Message-ID: <20200830141236.4140D7FC37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77b41d18d719c6b399caff094088e08731b1bbcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There was a private variable UTIL_LINUX_LIBS that is used by the
util-linux package. With the addition of the util-linux-libs package,
this is a bit confusing. Therefore, rename the variable to
UTIL_LINUX_LINK_LIBS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4fa7ae58e3..75b76957fc 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -33,7 +33,7 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
 
-UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
+UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
@@ -90,8 +90,8 @@ endif
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
 # and then pass it again at build time.
-UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
-UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
+UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
+UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
@@ -242,7 +242,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 UTIL_LINUX_CONF_OPTS += --with-readline
-UTIL_LINUX_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
+UTIL_LINUX_LINK_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
 UTIL_LINUX_DEPENDENCIES += readline
 else
 UTIL_LINUX_CONF_OPTS += --without-readline
