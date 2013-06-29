From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Jun 2013 21:05:08 +0200
Subject: [Buildroot] [git commit] autoconf: bump to version 2.69
Message-ID: <20130629190818.404159B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56c982d10744f91be6b2312f1e04e62c64fc954d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../autoconf-dont-add-dirty-to-version.patch       |   30 +++++++++----------
 package/autoconf/autoconf.mk                       |    2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/package/autoconf/autoconf-dont-add-dirty-to-version.patch b/package/autoconf/autoconf-dont-add-dirty-to-version.patch
index 38ac163..e8d9f6a 100644
--- a/package/autoconf/autoconf-dont-add-dirty-to-version.patch
+++ b/package/autoconf/autoconf-dont-add-dirty-to-version.patch
@@ -10,21 +10,19 @@ commonly done in buildroot).
 The affect is that autoconf gets built as being version 2.65-dirty, which
 breaks programs (like Python) which explicitly checks for autoconf-2.65.
 
+[Gustavo: update for autoconf 2.69]
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- build-aux/git-version-gen |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
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
+diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
+--- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
++++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
+@@ -203,7 +203,7 @@
+       *) # Append the suffix only if there isn't one already.
+           case $v in
+             *-dirty) ;;
+-            *) v="$v-dirty" ;;
++            #*) v="$v-dirty" ;;
+           esac ;;
+   esac
+ fi
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index bc6f65f..2482552 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.68
+AUTOCONF_VERSION = 2.69
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
 AUTOCONF_LICENSE = GPLv3+ with exceptions
