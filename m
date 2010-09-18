From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:45 +0200
Subject: [Buildroot] [PATCH 3/7] tslib: Fix installation with new autotools
	policy
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/tslib/tslib-1.0-newer-libtool-fix.patch |   11 +++++++++++
 package/tslib/tslib.mk                          |    2 --
 2 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 package/tslib/tslib-1.0-newer-libtool-fix.patch

diff --git a/package/tslib/tslib-1.0-newer-libtool-fix.patch b/package/tslib/tslib-1.0-newer-libtool-fix.patch
new file mode 100644
index 0000000..f08d4b6
--- /dev/null
+++ b/package/tslib/tslib-1.0-newer-libtool-fix.patch
@@ -0,0 +1,11 @@
+--- tslib-1.0/configure.ac~	2010-03-25 15:59:55.000000000 +0100
++++ tslib-1.0/configure.ac	2010-03-25 15:59:55.000000000 +0100
+@@ -168,7 +168,7 @@
+         AS_HELP_STRING([--with-plugindir=ARG],
+                 [Where to look for plugins (default=${libdir}/ts)]),
+         [PLUGIN_DIR=$withval],
+-        [PLUGIN_DIR='${libdir}/ts/'])
++        [PLUGIN_DIR='${libdir}/ts'])
+ AC_MSG_RESULT($PLUGIN_DIR)
+ AC_SUBST(PLUGIN_DIR)
+ 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index edde0b6..b6a224d 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -10,11 +10,9 @@ TSLIB_AUTORECONF = YES
 TSLIB_LIBTOOL_PATCH = NO
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_TARGET = YES
-TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 TSLIB_CONF_OPT = \
 	--enable-shared	\
-	--prefix=/usr	\
 	--sysconfdir=/etc
 
 $(eval $(call AUTOTARGETS,package,tslib))
-- 
1.7.1
