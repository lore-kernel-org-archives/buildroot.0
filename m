From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 23:05:10 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <20100331205247.765bc46e@surf>
References: <4BB32831.6080306@browserseal.com> <20100331205247.765bc46e@surf>
Message-ID: <z2n478c82f01003311305q3196f6dby7354ca4726b4f4d7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 31, 2010 at 9:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 31 Mar 2010 13:47:13 +0300
> Sasha Sirotkin <buildroot@browserseal.com> wrote:
>
>> Attached please find both config files.
>
> Which exact AT91 CPU are you using ?

AT91SAM9260

>
> Your Buildroot .config specifies an ARM926 core, which is ARMv5.
> However, if you use AT91RM9200, as ?ric B?nard noted, you have an
> ARM920 core, which is ARMv4. Therefore, if you have an AT91RM9200 CPU,
> it is normal that the Buildroot configuration you sent does not work.
> Select BR2_arm920t instead of BR2_arm926t.
>
> Your .config also states that you're using a crosstool-NG external
> toolchain. Can you send the .config you used in Crosstool-NG to
> generate the toolchain ?

Attached.

>
> In other words:
> ?* Give us more details about your hardware
> ?* Give us your Crosstool-NG configuration file
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.bz2
Type: application/x-bzip2
Size: 2299 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/f1db35fd/attachment.bin>
