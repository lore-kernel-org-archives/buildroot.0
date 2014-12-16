From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:16 -0300
Subject: [Buildroot] [PATCH 2/6] libtool: bump to version 2.4.4
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418738900-16150-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libtool/libtool-01-mips64-n64-linking.patch    | 47 ----------------------
 package/libtool/libtool.hash                       |  2 +
 package/libtool/libtool.mk                         |  2 +-
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 package/libtool/libtool-01-mips64-n64-linking.patch
 create mode 100644 package/libtool/libtool.hash

diff --git a/package/libtool/libtool-01-mips64-n64-linking.patch b/package/libtool/libtool-01-mips64-n64-linking.patch
deleted file mode 100644
index ef9084d..0000000
--- a/package/libtool/libtool-01-mips64-n64-linking.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-sets correct linker ABI flags on MIPS64
-http://git.savannah.gnu.org/cgit/libtool.git/commit/?id=5f7f7d9615bf650cf99d581a33b3e18357f79951
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -ru libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
---- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-11-11 11:44:30.419396295 +0000
-+++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-11-11 11:44:07.055032308 +0000
-@@ -1312,6 +1312,38 @@
-   rm -rf conftest*
-   ;;
- 
-+mips64*-*linux*)
-+  # Find out what ABI is being produced by ac_compile, and set linker
-+  # options accordingly.
-+  echo '[#]line '$LINENO' "configure"' > conftest.$ac_ext
-+  if AC_TRY_EVAL(ac_compile); then
-+    emul=elf
-+    case `/usr/bin/file conftest.$ac_objext` in
-+      *32-bit*)
-+      emul="${emul}32"
-+      ;;
-+      *64-bit*)
-+      emul="${emul}64"
-+      ;;
-+    esac
-+    case `/usr/bin/file conftest.$ac_objext` in
-+      *MSB*)
-+      emul="${emul}btsmip"
-+      ;;
-+      *LSB*)
-+      emul="${emul}ltsmip"
-+      ;;
-+    esac
-+    case `/usr/bin/file conftest.$ac_objext` in
-+      *N32*)
-+      emul="${emul}n32"
-+      ;;
-+    esac
-+    LD="${LD-ld} -m $emul"
-+    fi
-+  rm -rf conftest*
-+  ;;
-+
- x86_64-*kfreebsd*-gnu|x86_64-*linux*|ppc*-*linux*|powerpc*-*linux*| \
- s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
-   # Find out which ABI we are using.
diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
new file mode 100644
index 0000000..ffa3ea5
--- /dev/null
+++ b/package/libtool/libtool.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	a8295b5853bf82a46635c944031e84970f2aa79c19df7a0c28f3ec8e11c07f6c	libtool-2.4.4.tar.xz
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index a039267..c392e25 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.2
+LIBTOOL_VERSION = 2.4.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
-- 
2.0.4
