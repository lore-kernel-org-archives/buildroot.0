From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 13 Dec 2012 23:06:26 +0100
Subject: [Buildroot] [PATCH] Fix xenomai build with Linaro toolchain
Message-ID: <50CA5162.8090304@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the build with toolchains that have -mthumb by default
(Not supported by xenomai yet)


Signed-off-by: thierry.bultel at wanadoo.fr
--- xenomai.mk	2012-12-13 22:48:05.841982812 +0100
+++ xenomai.mk.orig	2012-12-13 23:01:13.473982051 +0100
@@ -24,6 +23,12 @@

  XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/

+XENOMAI_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -marm"
+	
+XENOMAI_MAKE_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -marm"
+
  ifeq ($(BR2_HAVE_DEVFILES),)
  define XENOMAI_REMOVE_DEVFILES
  	for i in xeno-config xeno-info wrap-link.sh ; do \
