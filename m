From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 27 Mar 2015 22:20:26 +0100
Subject: [Buildroot] package/glog
In-Reply-To: <1427170586986.25469@uqconnect.edu.au>
References: <1427161798142.23284@uqconnect.edu.au>
 <1427170586986.25469@uqconnect.edu.au>
Message-ID: <CAGm1_kv3ArTGv2W9usiUdYOsVF1_kksZ7xjZ2GVAQtKYbczy3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

thanks for your contribution. Below my comments.

On Tue, Mar 24, 2015 at 5:16 AM, Mr Anthony Arnold
<anthony.arnold@uqconnect.edu.au> wrote:
> Signed-off-by: Anthony Arnold <anthony.arnold@uqconnect.edu.au>
> ---
>  package/Config.in      |  1 +
>  package/glog/Config.in | 11 +++++++++++
>  package/glog/glog.mk   | 13 +++++++++++++

Please add a hash file
(http://nightly.buildroot.org/manual.html#adding-packages-hash)

>  3 files changed, 25 insertions(+)
>  create mode 100644 package/glog/Config.in
>  create mode 100644 package/glog/glog.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d6a5ad3..3128cc9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -836,6 +836,7 @@ menu "Logging"
>         source "package/log4cplus/Config.in"
>         source "package/log4cxx/Config.in"
>         source "package/zlog/Config.in"
> +       source "package/glog/Config.in"

Entries should be sorted alphabetically

>  endmenu
>
>  menu "Multimedia"
> diff --git a/package/glog/Config.in b/package/glog/Config.in
> new file mode 100644
> index 0000000..ae528bd
> --- /dev/null
> +++ b/package/glog/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_GLOG
> +       bool "glog"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +        C++ implementation of the Google logging module
> +
> +        https://github.com/google/glog

Help text should have one tab and two spaces as indentation

> +
> +comment "glog needs a toolchain w/ C++, threads"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> \ No newline at end of file
> diff --git a/package/glog/glog.mk b/package/glog/glog.mk
> new file mode 100644
> index 0000000..b955bbf
> --- /dev/null
> +++ b/package/glog/glog.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# glog
> +#
> +################################################################################
> +
> +GLOG_VERSION = v0.3.4
> +GLOG_LICENSE = New BSD License
> +GLOG_LICENSE_FILES = COPYING
> +GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
> +GLOG_SITE_METHOD = git

No need for site method for github helper

As it is a library you need GLOG_INSTALL_STAGING = YES

Yegor

> +
> +$(eval $(autotools-package))
> --
> 1.9.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
