From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2015 17:51:15 +0100
Subject: [Buildroot] [PATCH 1/1] core: add option to force compiling C++
 as C++11
In-Reply-To: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
References: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
Message-ID: <20151126175115.58c84720@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Galakhov,

On Thu, 26 Nov 2015 15:50:04 +0100, Alexey Galakhov wrote:
> Many C++ libraries like boost and log4cplus use defines to be compatible with
> both C++03 and C++11 standards. This causes ABI incompatibilities between
> a library built with C++03 and an application built with C++11. To avoid this,
> one has to built libraries as C++11 as well.

I am not familiar with C++ issues, can you give some more details and
specific examples here ?

> +config BR2_ENABLE_CPP11
> +	bool "force C++11 when building libraries"
> +	default n
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +	help
> +	  Force building of C++ libraries in C++11 mode.
> +
> +	  Some C++ libraries (i.e. boost) behave differently if compiled with
> +	  and without --std=c++11 flag. They define classes differently. This
> +	  causes linker errors while trying to use such a library in a C++11
> +	  project.
> +
> +	  This option forces building of all such libraries in C++11 mode.
> +	  Enable it if you encounter C++11-related linker errors.

I don't think it is appropriate for Buildroot to have an option to be
enabled "if you encounter <foo> errors". If there is a problem, it
should be fixed properly, without having to rely on the user enabling
(or not enabling) a given option.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
