From: Rick Foos <rick@synchromeshcomputing.com>
Date: Fri, 3 Aug 2007 16:29:41 -0500
Subject: [Buildroot] [PATCH] undefined symbol BR2_PACKAGE_LIBDAEMON
References: <0708032117420.13739@somehost>
Message-ID: <015001c7d615$67ba0510$8200000a@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Had the same problem here. Attached is a simple patch to fix it preserving 
the current function.

The libdaemon Config.in was never included in the past, but the libdaemon.mk 
file was in place.

Avahi.mk refereces the libdaemon make target.

Now that the select dependency is in avahi/Config.in, the missing source 
libdaemon/Config.in is a problem.

Cheers,
Rick

----- Original Message ----- 
From: "Cristian Ionescu-Idbohrn" <cristian.ionescu-idbohrn@axis.com>
To: <buildroot@uclibc.org>
Sent: Friday, August 03, 2007 2:20 PM
Subject: [Buildroot] [bug] undefined symbol BR2_PACKAGE_LIBDAEMON


> package/avahi/Config.in:3:warning: 'select' used by config symbol
> 'BR2_PACKAGE_AVAHI' refer to undefined symbol 'BR2_PACKAGE_LIBDAEMON'
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
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.5.476 / Virus Database: 269.11.2/933 - Release Date: 8/2/2007 
> 2:22 PM
>
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libdaemon-avahi.patch
Type: application/octet-stream
Size: 423 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070803/c4b11665/attachment.obj 
