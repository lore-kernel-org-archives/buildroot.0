From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sat, 30 Jan 2010 09:01:49 -0800 (PST)
Subject: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6701653FAE@WETMEX10.loepfe.com>
References: <mailman.7759.1264608677.5110.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB6701653FAE@WETMEX10.loepfe.com>
Message-ID: <965922.2943.qm@web44814.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Noel,

  > If you want I can send you a kernel config ... that is working for my
  > QEMU build (it is based on the kernel versatile_defconfig).

I would be interested in looking over your .config file.

I think what I am missing may be on the QEMU side, not the Buildroot side.

What qemu-system-arm command do you use to bring up your virtual machine?

Thanks.

Jim



----- Original Message ----
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: buildroot at busybox.net
Sent: Thu, January 28, 2010 3:46:24 AM
Subject: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)

Hi JIM 

>>From: Jim Thomas <jimthomasembedded@yahoo.com>
>>Subject: [Buildroot] Buildroot How-To for QEMU/ARM

>> Now I want to use QEMU to boot a Linux kernel and RFS that I built
myself for ARM using buildroot-2009.11.
>>?
>>I have not had much luck. Based on web searching, I have tried
twisting knobs in 'make menuconfig' and rebuilt 
>>perhaps a couple of dozen times.
>>
>> Rather than do a core dump here of the details, I thought I would
ask:
>>?
>>Has anyone used buildroot-2009.11 to build a kernel and RFS for ARM
that boot successfully under qemu-0.12.2?

Yes, I did this some time ago (for the 2009.11). 

{It was qemu-system-arm --version QEMU PC emulator version 0.11.0
(qemu-kvm-0.11.0), Copyright (c) 2003-2008 Fabrice Bellard, BUTY this
will not make the difference I guess}

The whole trick is that no need to have a KERNEL config to start with
(the file system... is nothing special) 
If you want I can send you a kernel config ... that is working for my
QEMU build (it is based on the kernel versatile_defconfig).
{ I even have build a booting ARM-QEMU from the buildroot-git a couple
of days a go.}

>>Do step-by-step notes exist for how to do this for ARM that were
written for these latest versions of Buildroot and >>QEMU, or that have
been verified as still complete and correct?

Booting the kernel and roofs in QEMU can be done by a 1000ways, it
depends on your creativity and Linux-skills how you do this (disk-image/
nfs-boot / .... etc ) 

>>Ultimately, I might like to get Buildroot/QEMU working for a
particular ARM processor, but for now, a working
>>configuration for any virtualized ARM target is good enough.

I know ... having BUILDROOT 'build-in' support for a QEMU-ARM platform
(as well as other QEMU platforms) would be nice, and I guess it is on
many buildroot users their wish-list.

>>A general purpose Buildroot/QEMU howto for ARM might serve as both a
worthwhile regression test, and primary support >>document visible at
the Buildroot web site.

Regards Noel.

Message: 3
Date: Wed, 27 Jan 2010 16:10:35 +0000 (UTC)
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: [Buildroot] Buildroot How-To for QEMU/ARM
To: buildroot at uclibc.org
Message-ID: <hjpohq$hh6$1@ger.gmane.org>
Content-Type: text/plain; charset=us-ascii

On 2010-01-27, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> Hello,
>
> I can build qemu-0.12.2 under Ubuntu 9.10 and boot Linux in QEMU using

> the pre-built kernel and RFS in arm-test-0.2, also from the QEMU 
> project.
>
> Now I want to use QEMU to boot a Linux kernel and RFS that I built 
> myself for ARM using buildroot-2009.11.
>
> I have not had much luck. Based on web searching, I have tried 
> twisting knobs in 'make menuconfig' and rebuilt perhaps a couple of 
> dozen times.
>
> Rather than do a core dump here of the details, I thought I would ask:
>
> Has anyone used buildroot-2009.11 to build a kernel and RFS for ARM 
> that boot successfully under qemu-0.12.2?

I built for arm-integrator using HEAD back in November/December, and it
ran fine on qemu-0.9.1.  I didn't do much with it other than boot it up,
log in, and test the virtual serial ports.

> Do step-by-step notes exist for how to do this for ARM that were 
> written for these latest versions of Buildroot and QEMU, or that have 
> been verified as still complete and correct?

Not that I've found.  There were some articles written a couple years
ago that have step-by-step instructions, but they're missing a step or
two and are also now out of date in a few spots.

Here's the .config file I last used -- AFAIR it was working at that
point:

# Automatically generated make config: don't edit # Wed Dec 16 09:10:07
2009 # BR2_HAVE_DOT_CONFIG=y BR2_VERSION="2009.11-git"
# BR2_alpha is not set
<snip>

-- 
Grant Edwards                   grante             Yow! I'm having fun
                                  at               HITCHHIKING to
CINCINNATI
                              visi.com            or FAR ROCKAWAY!!



------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 43, Issue 62
*****************************************
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      
