From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Sep 2012 22:30:28 +0200
Subject: [Buildroot] [PATCH] use a more portable syntax for mktemp.
 fixes build problem under MacOS X
In-Reply-To: <20120919164317.GA20160@waldemar-brodkorb.de>
References: <20120919164317.GA20160@waldemar-brodkorb.de>
Message-ID: <20120919223028.168abba2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 19 Sep 2012 18:43:17 +0200, Waldemar Brodkorb wrote:

> diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
> index 969cd4c..fb4d90b 100644
> --- a/support/kconfig/lxdialog/check-lxdialog.sh
> +++ b/support/kconfig/lxdialog/check-lxdialog.sh
> @@ -33,7 +33,7 @@ ccflags()
>  }
>  
>  # Temp file, try to clean up after us
> -tmp=$(mktemp)
> +tmp=$(mktemp -t yyy)
>  trap "rm -f $tmp" 0 1 2 3 15
>  
>  # Check if we can link to ncurses

If you make any changes to support/kconfig/, then those changes should
also be done in the patches in support/kconfig/patches/ that help us
port our changes to later versions of kconfig when we sync kconfig with
the latest kernel version.

In your case, changing patch 11 sounds like a good plan. However, does
Buildroot really works on Mac OS X? I don't think anybody uses
Buildroot on Mac OS X, and I suspect that a lot of things might be
broken besides just kconfig, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
