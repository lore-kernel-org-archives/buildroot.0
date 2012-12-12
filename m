From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 10:54:18 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from
 custom directory
In-Reply-To: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
References: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
Message-ID: <20121212105418.601702fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Fri,  7 Dec 2012 10:46:44 +0100, Richard Braun wrote:

> diff --git a/linux/Config.in b/linux/Config.in
> index ef3b2a1..cafbe59 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -46,6 +46,12 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
>  	  This option allows to specify the http or ftp location of a
>  	  specific kernel source tarball
>  
> +config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
> +	bool "Custom directory"
> +	help
> +	  This option allows to specify the path of a specific kernel
> +	  source directory.
> +

This duplicates what the "source override" mechanism allows to do in a
generic way for all packages. So on one side, I'm tempted to say "no"
because I don't think it's worth having two mechanisms to achieve the
same thing, especially when the new mechanism is package-specific (what
if someone wants a custom source directory for Qt, for zlib, for
libpng, etc.).

On the other side, Linux, and bootloaders, are kind of special packages
in that very often people will have to work on them, and making this
easier might be useful.

Generally speaking, I'd like us to have an overall "vision" of how to
do development with Buildroot, rather than doing local hacks/fixes per
package to adjust one particular development workflow, which would end
up with many different hacks in various places with absolutely no
coherency.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
