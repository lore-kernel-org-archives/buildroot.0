From: Rohit Kumar <rohit.kumar@hitechroboticsystemz.com>
Date: Wed, 16 Apr 2014 17:12:01 +0900
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <20140416095711.430764d9@skate>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
 <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
 <20140416095711.430764d9@skate>
Message-ID: <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 16, 2014 at 4:57 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> Would it be possible to avoid top posting, and instead use bottom
> posting, as is the usage of most mailing lists? Thanks!
>
> On Wed, 16 Apr 2014 16:31:13 +0900, Rohit Kumar wrote:
> > ** The platform you're using, so that we can figure out which processor
> >  it is using.*
> >
> > i am using an ARM11 processor form Nexell (NXP2120)
> > 32bit Embedded CPU : 700/800Mhz ARM1176 with
> > 16KByte I-Cache, 16Kbyte D-cache with VFP(vector floating-point
> processor)
>
> Ok.
>

 it is weird because when i use arm926t from the processor option, file
system works.
but as i shift to arm1176 it starts giving panic messages.

>
> > * * The Buildroot .config file you're using, to check that the
> >  configuration you've made matches the processor of your platform.*
> >
> > please see the attached configuration.
>
> Your configuration indeed looks appropriate in terms of toolchain.
>
> However, the kernel part of the configuration looks weird: it refers to
> the kernel configuration file
> board/atmel/at91sam9260ek/linux-3.9.config. Are you building a kernel
> in Buildroot, but not using it for your platform?
>

i am not using kernel from the buildroot rather compiling the source i have
with the toolchain generated.

>
> Also, please enable CONFIG_DEBUG_USER=y in your kernel, and pass
> user_debug=31 on your kernel command line. This should give more
> details about the userspace crash.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

With Regards,

Rohit Kumar
Sr. Research Developer
Hitec Robotic systems Ltd.
+91 9891691967
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140416/1d35c93e/attachment.html>
