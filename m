From: Rick Foos <rick@synchromeshcomputing.com>
Date: Sat, 4 Aug 2007 10:27:28 -0500
Subject: [Buildroot] [PATCH] undefined symbol BR2_PACKAGE_LIBDAEMON
References: <0708032117420.13739@somehost> <015001c7d615$67ba0510$8200000a@k2>
	<0708040028590.13739@somehost>
Message-ID: <003e01c7d6ab$f8f5d2c0$6404a8c0@shukson>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Fri, 3 Aug 2007, Rick Foos wrote:
>
>> Had the same problem here. Attached is a simple patch to fix it
>> preserving the current function.
>
> Thanks.
>
>> The libdaemon Config.in was never included in the past, but the
>> libdaemon.mk file was in place.
>>
>> Avahi.mk refereces the libdaemon make target.
>>
>> Now that the select dependency is in avahi/Config.in, the missing source
>> libdaemon/Config.in is a problem.
>
> Right.  That was a miss.
> libdaemon is not "networking" related in any way, AFAIK.  I would think
> a better place is among the "Other stuff", one level above networking
> (next to the other libs).

I knew that either place I put it would be wrong:)

avahi appears to be the only package that depends on libdaemon. A minimalist 
approach, only allowing libdaemon if it was required would place it with 
avahi.

As a general service, it should go in a general category like other, but to 
the minimalist it then can take up space when it is not really required.

I chose the minimalist approach. Whomever commits this to the tree can 
decide.

>
> Index: package/Config.in
> ===================================================================
> --- package/Config.in   (revision 19307)
> +++ package/Config.in   (working copy)
> @@ -63,6 +63,7 @@
> if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
> source "package/less/Config.in"
> endif
> +source "package/libdaemon/Config.in"
> source "package/libelf/Config.in"
> source "package/libevent/Config.in"
> source "package/libfloat/Config.in"
>
>
> Cheers,
>
> -- 
> Cristian
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> 
