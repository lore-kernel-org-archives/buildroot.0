From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 3 Oct 2007 22:40:12 +0200
Subject: [Buildroot] Adding Cirrus  EP93XX  ARM to buildroot
In-Reply-To: <4702D760.4020707@promwad.com>
References: <1191361900.4187.48.camel@localhost.localdomain>
	<4702D760.4020707@promwad.com>
Message-ID: <20071003204012.GE20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 03, 2007 at 02:42:24AM +0300, Ivan Kuten wrote:
>Brian Austin ?????:
>> All,
>> 
>> I would like to start the process of adding the Cirrus Logic EP93XX ARM9
>> family to buildroot.
>> 
>> couple things about the 93xx.
>> 
>> 1.  Maverick Crunch  FPU.  I have patches for GCC/uClibc to enable
>> Crunch FPU.
>> 
>> 2. Linux Kernel.  We have a patch for several current kernel versions up
>> to 2.6.21.5.
>> 
>> I also have patches for DirectFB which I submitted last week and QT,
>> TSLIB, and other BSP software which have not been submitted.
>> 
>> I also think there is a section for bootloaders as well?
>> 
>> Qustion is,  where to start?
>> 
>> Right now we give out a modified version of buildroot for the prebuilt
>> toolchain and a buildroot system for building the kernel, u-boot,
>> redboot (ecos), and BSP software.  But I want it to go into ya'lls to
>> make things more consistent.  it's hard for me to do everything here.
>> We use DirectFB/GTK now for our graphics and I had to change alot to get
>> it to build and install correctly to pass SQA testing, so hopefully that
>> can be of use as well.
>> 
>> anyway comments and suggestions on where to start would be great.
>> 
>> Regards,
>> Brian Austin
>> Cirrus Logic Inc. 
>> 
>> 
>
>Hi Brian,
>
>That's great that Cirrus decided to merge its verion of buildroot with mainline.
>I was thinking to start adding Cirrus stuff to buildroot by myself, because we use EP93xx
> but need packages present in mainline buildroot.
>
>Now that's a good chance to join efforts so that Cirrus EP93xx integration into buildroot go quickly.
>
>I'd suggest you to take a look into target/device dir
>and create layout for target/device/Cirrus

Depends a bit.. From the sounds, all but the configs should reside in
generic parts.
That said, I'm not too keen on building up a shadow of kernel.org, so
please
1) update your patches against current linus tree (or -mm, however you
see fit)
2) submit your patches upstream
>
>And start posting your patches. I think patches for packages are not very Cirrus CPU specific.

Posting separate, distinct and self-contained patches in a series is
certainly the way to go.
I'll do my best to help review and/or comment them.

cheers,
Bernhard
