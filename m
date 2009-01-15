From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 23:20:31 +0100
Subject: [Buildroot] Buildroot fails to build shared library
	for	libglib12 on avr32
In-Reply-To: <gki4sh$tpl$1@ger.gmane.org>
References: <gki4sh$tpl$1@ger.gmane.org>
Message-ID: <1232058031.4757.66.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-13 klockan 14:29 +0100 skrev David Brown:
> Should I be posting this sort of thing here in the mailing list, or 
> using the bug tracker?
> 
> 
> 
> When building for the avr32, libglib12 does not build a shared library 
> for the target, and therefore fails to build properly.  The fix, as far 
> as I can see, is to patch "ltconfig" so that avr32 builds are treated 
> like uclibc builds.  I based this on an old mailing list post:
> 
> http://lists.busybox.net/pipermail/buildroot/2008-February/007030.html
> 
> The post refers to issue number 1478 in the bug tracker for busybox, but 
> I can't find a bug with this number.
> 
> 
Will test this and commit, it it works.
BR
Ulf Samuelsson


> Adding the following patch to package/libglib12 fixes the problem:
> 
> package/libglib12/libglib-sharedlib-avr32.patch
> 
> --- glib/ltconfig
> +++ glib/ltconfig
> @@ -1982,7 +1982,7 @@
>     fi
>     ;;
> 
> -linux-uclibc*)
> +linux-uclibc* | avr32-linux*)
>     version_type=linux
>     need_lib_prefix=no
>     need_version=no
> 
> 
> 
> mvh.,
> 
> David Brown
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
