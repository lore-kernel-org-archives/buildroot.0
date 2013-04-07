From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:16:58 +0200
Subject: [Buildroot] [PATCH] qjson: new package
In-Reply-To: <1365261630-17445-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1365261630-17445-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20130407221658.649551e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

Thanks for your contribution! A few comments below.

On Sat,  6 Apr 2013 17:20:30 +0200, Zoltan Gyarmati wrote:

> diff --git a/package/qjson/Config.in b/package/qjson/Config.in
> new file mode 100644
> index 0000000..e21a336
> --- /dev/null
> +++ b/package/qjson/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_QJSON
> +	bool "qjson"
> +    depends on BR2_PACKAGE_QT

This dependency is not needed: your qjson/Config.in file is already
included inside a if BR2_PACKAGE_QT...endif condition (in
package/Config.in). And also, the indentation of this line was wrong.

> +	help
> +      QJson is a Qt-based library that maps JSON data to 
> +      QVariant objects and vice versa.
> +	  
> +      http://qjson.sourceforge.net

The indentation for the help text is one tab + two spaces. Here you
have only spaces.

> diff --git a/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch b/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch

The package version should be in the file name of patches. And also, I
believe we don't like too much mixed-case in filenames. So your patch
should probably be named:

	qjson-fix-qt4-package-error-in-cmakelists.patch

> new file mode 100644
> index 0000000..736438b
> --- /dev/null
> +++ b/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch
> @@ -0,0 +1,27 @@
> +From 529e50939316abc3c4190f89a482b17a4d4b3355 Mon Sep 17 00:00:00 2001
> +From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> +Date: Sat, 6 Apr 2013 16:54:25 +0200
> +Subject: [PATCH 1/1] fix Qt4 package error in CMakeLists.txt
> +
> +
> +Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Good to have a description, but I wish you added a bit more details
about what you're fixing.

> diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
> new file mode 100644
> index 0000000..ea4b875
> --- /dev/null
> +++ b/package/qjson/qjson.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# qjson
> +#
> +#############################################################
> +
> +QJSON_VERSION = 0.8.1
> +QJSON_SITE = git://github.com/flavio/qjson.git 

See
http://buildroot.org/downloads/manual/manual.html#github-download-url.
We prefer to use tarballs when possible.

> +QJSON_INSTALL_STAGING = YES
> +QJSON_DEPENDENCIES =  qt
> +
> +$(eval $(cmake-package))

It would be great if you could add the licensing informations. It seems
to be:

QJSON_LICENSE = LGPLv2.1
QJSON_LICENSE_FILES = COPYING.lib

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
