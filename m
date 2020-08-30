From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 16:18:45 +0200
Subject: [Buildroot] [git commit] util-linux: organize libcap-ng dependency
 like the others
Message-ID: <20200902161639.D547785EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63050c4c6031c2408c0b67400a4b501e315ae96f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformat the dependency on libcap-ng same as other dependencies: in one
line, preceded by a comment that it is used only by setpriv.

This also makes it clear why it's not included in util-linux-libs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/util-linux.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 75b76957fc..3aa51f24fb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -82,10 +82,6 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
-UTIL_LINUX_DEPENDENCIES += libcap-ng
-endif
-
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
@@ -106,6 +102,9 @@ define UTIL_LINUX_SELINUX_PAMFILES_TWEAK
 endef
 endif
 
+# Used by setpriv
+UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBCAP_NG),libcap-ng)
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
