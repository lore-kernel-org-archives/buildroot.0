From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Apr 2014 22:03:23 +0200
Subject: [Buildroot] [PATCH 2/3] package/libgc: add Boehm-Demers-Weiser
	gc	library
In-Reply-To: <1397225156-23112-3-git-send-email-alex.bennee@linaro.org>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-3-git-send-email-alex.bennee@linaro.org>
Message-ID: <d8bb9829-7b7b-4114-b950-979ebd55a3d1@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Alex Benn?e" <alex.bennee@linaro.org> schreef:
>This is needed for applications like Zile
>
>Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
>
>---
>v2
>- fix whitespace
>- proper dependancies
>- use system libatomic
>
> create mode 100644 package/libgc/Config.in
> create mode 100644 package/libgc/libgc.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 6abc7b3..0e7e246 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -788,6 +788,7 @@ source "package/libev/Config.in"
> source "package/libevdev/Config.in"
> source "package/libevent/Config.in"
> source "package/libffi/Config.in"
>+source "package/libgc/Config.in"
> source "package/libglib2/Config.in"
> source "package/libical/Config.in"
> source "package/libnspr/Config.in"
>diff --git a/package/libgc/Config.in b/package/libgc/Config.in
>new file mode 100644
>index 0000000..5bceb3d
>--- /dev/null
>+++ b/package/libgc/Config.in
>@@ -0,0 +1,10 @@
>+config BR2_PACKAGE_LIBGC
>+	bool "libgc"
>+	select BR2_PACKAGE_LIBATOMIC_OPS
>+	help
>+	  The Boehm-Demers-Weiser conservative garbage collector can be used
>+	  as a garbage collecting replacement for C malloc or C++ new. It allows
>+	  you to allocate memory basically as you normally would, without
>+	  explicitly deallocating memory that is no longer useful.
>+
>+	  http://www.hboehm.info/gc/
>diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
>new file mode 100644
>index 0000000..e3c5bf1
>--- /dev/null
>+++ b/package/libgc/libgc.mk
>@@ -0,0 +1,15 @@
>+################################################################################
>+#
>+# libgc
>+#
>+################################################################################
>+
>+LIBGC_VERSION = 7.4.0
>+LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz
>+LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
>+LIBGC_DEPENDANCIES += libatomic_ops

This should be: ..._DEPENDENCIES with E.

>+LIBGC_LICENSE = GPLv1+
>+LIBGC_LICENSE_FILES = COPYING
>+LIBGC_INSTALL_STAGING = YES
>+
>+$(eval $(autotools-package))

Best regards,
Thomas
