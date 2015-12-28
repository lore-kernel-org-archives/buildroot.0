From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Mon, 28 Dec 2015 14:30:56 +0100
Subject: [Buildroot] [PATCH] tpm-tools: fix build failures caused by -Werror
Message-ID: <1451309456-27538-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change-Id: I1797d19039938e750c92bb89d05b2f05c10668ad

---

I am aware there is another tpm-tools build issue, related to libintl:
http://autobuild.buildroot.org/results/ce7/ce7d971c1e590b39a3e457ee59c3031817a3c969/build-end.log

I'm leaving this one to smartin, who is currently working on a fix.
---
 .../0002-configure.in-remove-Werror.patch          | 26 ++++++++++++++++++++++
 package/tpm-tools/tpm-tools.mk                     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/tpm-tools/0002-configure.in-remove-Werror.patch

diff --git a/package/tpm-tools/0002-configure.in-remove-Werror.patch b/package/tpm-tools/0002-configure.in-remove-Werror.patch
new file mode 100644
index 0000000..4baae70
--- /dev/null
+++ b/package/tpm-tools/0002-configure.in-remove-Werror.patch
@@ -0,0 +1,26 @@
+From b060873f444d79f3f5aa388427cb1ede6665834a Mon Sep 17 00:00:00 2001
+From: Kent Yoder <key@linux.vnet.ibm.com>
+Date: Mon, 5 Nov 2012 14:58:31 -0600
+Subject: [PATCH] configure.in: remove -Werror
+
+Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index da170d0..0f175be 100644
+--- a/configure.in
++++ b/configure.in
+@@ -138,7 +138,7 @@ AC_TYPE_SIZE_T
+ AC_TYPE_SIGNAL
+ AC_TYPE_UID_T
+ 
+-CFLAGS="$CFLAGS -Wall -Werror -Wreturn-type -Wsign-compare"
++CFLAGS="$CFLAGS -Wall -Wreturn-type -Wsign-compare"
+ 
+ AC_CONFIG_FILES(./Makefile		\
+ 		po/Makefile.in		\
+-- 
+2.1.4
+
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 20df489..9e4d66a 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -11,6 +11,7 @@ TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
 TPM_TOOLS_DEPENDENCIES = trousers openssl
+TPM_TOOLS_AUTORECONF = yes
 
 TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
 
-- 
2.1.4
