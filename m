From: Brian Austin <brian.austin@cirrus.com>
Date: Tue, 15 May 2007 08:15:19 -0500
Subject: [Buildroot] EABI toolchains do not free init in busybox
In-Reply-To: <00e301c79723$c1caa040$2600a8c0@engineering5>
References: <00e301c79723$c1caa040$2600a8c0@engineering5>
Message-ID: <1179234919.17486.56.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get nothing.

freeing init.........

I can pass init=busybox and get the busybox help output, and I can make
a hello world app say hello world,  but it doesnt give me a shell.

I traced it to setting the consoles in busybox init, it seems to die
with snprintf.






On Tue, 2007-05-15 at 14:03 -0500, Christopher Reder wrote:
> I had an issue with something similar where I didn't have console defined
> under dev in my fs.  Probably not what you have, but thought I'd pass it
> along as I had an issue where everything would boot, it would find init, but
> I didn't get anything on the console.  
> 
> What are you seeing as output?
> 
> -----Original Message-----
> From: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org] On
> Behalf Of Brian Austin
> Sent: Tuesday, May 15, 2007 6:16 AM
> To: buildroot at uclibc.org
> Subject: [Buildroot] EABI toolchains do not free init in busybox
> 
> Hello,
> 
> I have been building gcc-4.1.1, 4.1.2, 4.2 toolchains for ARM9 EABI with
> 2.6.20.4 kernel headers from buildroot. I am using daily snapshots of
> uClibc as well.
> 
> I have tried busybox 1.2.0, 1.4.1, and 1.5.0,  same results.
> 
> the files are built in EABI format as well
> 
> they build fine and compile all lf my code and generate a ramdisk.
> 
> kernel boots, but init does not let go and bring me to a shell.
> 
> Has anyone had any success with building EABI toolchains for ARM9 from
> buildroot?
> 
> I can post my uclibc and buildroot configs if needed.
> 
> Thanks,
> 
> Brian
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
