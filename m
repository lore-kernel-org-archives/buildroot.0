From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 16 Oct 2007 08:00:07 +0200
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
References: <20071015054821.GA5245@cloud.net.au><d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com><20071016001608.GA17751@cloud.net.au><20071016034233.GA21412@cloud.net.au>
	<20071016055638.GA23927@cloud.net.au>
Message-ID: <006b01c80fb9$f07efe40$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> And this is caused by soft-float.
> 
> Summary of situation:
> 
> arm EABI hard-float: builds.
> 
> armeb EABI hard-float: libgcc_s.so fails to link due to incorrect file
> format of libc.so
> 
> arm/armeb OABI hard-float: builds.
> arm/armeb OABI soft-float: fails as above (both endians fail the same
> way).
> 
> I haven't tried soft-float EABI.

I tried the ARM integrator, on Bernhards recommendation
a few weeks ago, and that would build an EABI 4.2.1 softfloat toolchain,
a few days later, it was broken again.
I think that there must be some uClibc options which should be set
in the correct way for the build to complete.

Best Regards
Ulf Samuelsson
