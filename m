From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 15:08:22 +0000
Subject: [Buildroot] [PATCH] autoconf version update 2.69 and patch rediff
Message-ID: <1349968102-696-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../autoconf-dont-add-dirty-to-version.patch       | 26 +++++++++++-----------
 package/autoconf/autoconf.mk                       |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/autoconf/autoconf-dont-add-dirty-to-version.patch b/package/autoconf/autoconf-dont-add-dirty-to-version.patch
index 38ac163..761ee3f 100644
--- a/package/autoconf/autoconf-dont-add-dirty-to-version.patch
+++ b/package/autoconf/autoconf-dont-add-dirty-to-version.patch
@@ -15,16 +15,16 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  build-aux/git-version-gen |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: autoconf-2.65/build-aux/git-version-gen
-===================================================================
---- autoconf-2.65.orig/build-aux/git-version-gen
-+++ autoconf-2.65/build-aux/git-version-gen
-@@ -135,7 +135,7 @@ case "$dirty" in
-     *) # Append the suffix only if there isn't one already.
- 	case $v in
- 	  *-dirty) ;;
--	  *) v="$v-dirty" ;;
-+	  #*) v="$v-dirty" ;;
- 	esac ;;
- esac
- 
+diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
+index 0fa9063..14cd4f8 100755
+--- a/build-aux/git-version-gen
++++ b/build-aux/git-version-gen
+@@ -203,7 +203,7 @@ if test -n "$v_from_git"; then
+       *) # Append the suffix only if there isn't one already.
+           case $v in
+             *-dirty) ;;
+-            *) v="$v-dirty" ;;
++           #*) v="$v-dirty" ;;
+           esac ;;
+   esac
+ fi
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 3f84e3e..f659c9f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-AUTOCONF_VERSION = 2.68
+AUTOCONF_VERSION = 2.69
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
-- 
1.7.11.3
