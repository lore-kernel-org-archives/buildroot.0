From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:45:04 +0100
Subject: [Buildroot] [PATCH v6 2/4] pkg-cmake: add note on
 BUILD_STATIC_LIBS
In-Reply-To: <1515068911-21112-3-git-send-email-heyleke@gmail.com>
References: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
 <1515068911-21112-3-git-send-email-heyleke@gmail.com>
Message-ID: <20180107234504.1a36171a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Jan 2018 13:28:29 +0100, Jan Heylen wrote:

> +#
> +# Note:
> +# BUILD_SHARED_LIBS is a cmake internal variable,
> +# BUILD_STATIC_LIBS is not standard in any way, which means some
> +# projects may choose another name for a similar option and there is not
> +# much we can do about this.
> +# see: https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior
> +#

I've applied, after rewording this a bit differently:

+#
+# - We are passing BUILD_SHARED_LIBS because it is documented as a
+#   standard CMake variable to control the build of shared libraries
+#   (see https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior)
+# - We are not passing BUILD_STATIC_LIBS because it is *not*
+#   documented as a standard CMake variable. If a package supports it,
+#   it must handle it explicitly.
+#

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
