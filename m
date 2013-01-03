From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Thu, 3 Jan 2013 18:24:41 +0530
Subject: [Buildroot] [PATCH 2/3] Add Perf tools support
In-Reply-To: <20130103112306.0d0ef1c6@skate>
References: <CAPDLWs-otw90dvsw7oVra=-+oNJZ0-SeiXE1CoXh1WUxNhq2vQ@mail.gmail.com>
 <20130103112306.0d0ef1c6@skate>
Message-ID: <CAPDLWs-9uZdAQd0gefq3G+8RPgLBRYFZXDK=RK9xtJcPPP__Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Excuse my silly stuff & poor knowledge of the 'make'/build system !  :-p
Pl see more qs below..

>> + # FIXME: Where should we place the perf kernel patch? Online?
>> + # Temporarily, at least, it's under linux/
>> + BR2_LINUX_KERNEL_PATCH += "$(HOST_DIR)/../../linux/perf.patch"
>
> No, we don't modify BR2 variables.

So, how exactly do we do this then?

>> +all:
>
> Arggh, this is *horrible*. Why do you believe you are allowed to
> overload the "all" target?

Right. Forgive my basic qs, but what's the right approach?

>
> That said, I am not sure we want this thing in linux/linux.mk. Maybe
> I'd prefer a package/perf/perf.mk, which depends on BR2_LINUX_KERNEL
> and re-uses the source code extracted in $(LINUX_DIR).

Ok, will try working on this approach as well.
Not free now for a bit, will come back to this soon & keep you posted..

Thanks again for all valuable inputs..
Best,
Kaiwan.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
