From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:32:01 +0100
Subject: [Buildroot] [PATCH 1/1] Bump libasplib and change source to
 original maintainer
In-Reply-To: <1456542512-19308-1-git-send-email-svlasic@gmail.com>
References: <1456542512-19308-1-git-send-email-svlasic@gmail.com>
Message-ID: <20160227163201.2ab1b747@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stanislav Vlasic,

Thanks for your contribution! I have a few comments/questions.

First, the commit title should always have the following format:

	<package>: <description>

So in your case, it should be:

	libasplib: bump version and change source location

(or something like that)

On Sat, 27 Feb 2016 04:08:32 +0100, Stanislav Vlasic wrote:
> Since maintainer of kodi-adsp maintainer forked asplib
> from original source (https://github.com/AchimTuran/asplib)
> and did not maintain it, asplib became obsolete.

Do we still need a separate libasplib package then? Are you using
libasplib for your project, outside of Kodi?

> diff --git a/package/libasplib/Config.in b/package/libasplib/Config.in
> index 71ccfa0..a0dfef5 100644
> --- a/package/libasplib/Config.in
> +++ b/package/libasplib/Config.in
> @@ -1,14 +1,8 @@
>  config BR2_PACKAGE_LIBASPLIB
>  	bool "libasplib"
>  	depends on BR2_INSTALL_LIBSTDCPP

You still have a C++ dependency.

> -	# needs <cpuid.h> from the compiler
> -	depends on BR2_i386 || BR2_x86_64
>  	help
>  	  asplib (Achim's Signal Processing LIBrary), is a small and
>  	  lightweight C++ library for digital signal processing.
>  
> -	  https://github.com/kodi-adsp/asplib
> -
> -comment "asplib needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_i386 || BR2_x86_64

So why are you removing the comment about this dependency?

Other than that, looks good. Could you fix the minor issues above, and
resubmit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
