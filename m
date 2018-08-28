From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Aug 2018 08:45:32 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: bump to version 1.1.3
In-Reply-To: <87pny37981.fsf@dell.be.48ers.dk>
References: <20180827214323.17876-1-fontaine.fabrice@gmail.com>
 <87pny37981.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81g7t8GVPQoQCxFFgDrnpy6f8eDWtbRqwEGq+tKpiqHeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le mar. 28 ao?t 2018 ? 00:09, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Remove patch (already in version)
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
> [snip]
>
>  > -LIBKCAPI_VERSION = 1.1.0
>  > +LIBKCAPI_VERSION = 1.1.3
>
> Is this meant for master or next? E.G. does this fix any significant
> issues?
>
The bump does not fix any autobuilder issues but it fixes some significant
issues especially on kcapi_hasher.
Issues on kcapi_hasher have been found by Coverity and are related to fd
leak, buffer overrun, ...):
https://github.com/smuellerDD/libkcapi/commits/master/apps/kcapi-hasher.c
Here is an extract of the ChangeLog:

Changes 1.1.3
 * Fix: default location of FIPS 140-2 HMAC control file is .<orig file>.hmac
   (was accidentally moved to <orig file>.hmac with 1.1.2)

Changes 1.1.2
 * Fix: Bug fixes for GCC 8.1.0 regarding string length checks by
	Krzysztof Kozlowski
 * Enhancement: ensure that tests execute on architectures other than X86
	by Ondrej Mosn??ek
 * Fix: Bug fix to initialize FDs at the correct time in kcapi-kernel-if.c
	by Ondrej Mosn??ek
 * Test fix: Support test execution outside build environment by
	Ondrej Mosn??ek

Changes 1.1.1
 * Fix: Bug fixes for kcapi_hasher by Ondrej Mosn??ek

So perhaps we could apply it to master.

>
> --
> Bye, Peter Korsgaard
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/74179798/attachment.html>
