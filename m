From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 19:56:56 +0200
Subject: [Buildroot] [PATCH 1/1] packages: fix the header package name
In-Reply-To: <1403300466-24924-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1403300466-24924-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140621195656.6ad08587@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 20 Jun 2014 23:41:06 +0200, Jerzy Grzegorek wrote:

> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index a0077d2..6f5c53f 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# glibc/eglibc
> +# (e)glibc

I'd prefer to stick with "glibc/eglibc" here. We're anyway going to
remove eglibc support soon, since eglibc 2.19 was the latest release
and the project has been declared dead.


> diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
> index dd6814e..fcb8599 100644
> --- a/package/x11r7/xlib_libICE/xlib_libICE.mk
> +++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# xlib_libICE
> +# xlib_libice

I really don't agree with all those changes to lower-case here. The
package uses capital letters in its name, so it's better for the header
to have the same capitalization.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
