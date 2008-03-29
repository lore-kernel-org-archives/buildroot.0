From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 29 Mar 2008 00:57:55 -0300
Subject: [Buildroot] Size of svn
In-Reply-To: <021701c890d9$3e8c6370$dcc4af0a@atmel.com>
References: <021701c890d9$3e8c6370$dcc4af0a@atmel.com>
Message-ID: <d6cda7730803282057n535ca9efg99028fb8608f703a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Howdy,

>  The avr32 boards (target/device/Atmel/atngw100_<xxx>)
>  recently added by John Voltz, each have their own patchset,
>  and the large patches are duplications of the patches in
>  (target/device/Atmel/arch-avr32/kernel-patches-<version>)
>  That adds 2-3 MB and should be cleaned up.

I agree, unfortunately, they are never applied if left there. There is
no code applying it anywhere. Where should we add this?
target/linux/Makefile.advanced.in doesn't seams right place to do it.
Where do you apply the arm counterparts? If they are applied at all.

>  The major remaining part in terms of size in target/device/Atmel
>  are kernel patches for at91 and avr32 for different kernel versions.
>  It would be possible to download these patches as well
>  from an ftpserver, but the infrastructure in "target/linux" is
>  not there yet. I think this is 5-6 MB.

At least Atmel is pushing those up into mainstream, so they tend to
shrink over time. But sometimes, we can't wait for the kernel
maintainers to release for us to get important fixes or add support to
existing hardware, such as is the case for the ISI. Not to mention
that they get more visibility... you know, the more eye balls thing ;)

>  ==========================
>  The toolchain patches for avr32 added by John,
>  is IMHO unneccessary and can be removed.
>  IIRC they add 7-8 MB to the svn size.
>
>  The avr32 toolchain can (and should)
>  be built using the prepatched source.
>  If patches are required, then they can be located in the
>  (target/device/Atmel/toolchain) directory.
>

I'm sorry to disagree. Having the choice is always welcome. The
external toolchain has, more than once I must add, felt short on us.
Also, for our despair, fix didn't came fast on those occasions,
despite reports. Not to mention that there is the issue of who gets to
update the prepatched sources if there is a critical patch? We don't
have access to the FTP to add patches or fix things.

We could instead download patches from avr32linux.org, at least being
a wiki things are bound to be more open and a solution to problems
might present itself faster, updates made easier, etc.

I completely agree with you that we should strive for a cleaner
solution to the patch proliferation. But it's not because of it's
size. You already need about 1 or 2 gigabytes to build a target.

Kind Regards,
    Thiago A. Correa
