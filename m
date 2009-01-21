From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Wed, 21 Jan 2009 13:50:50 +0100
Subject: [Buildroot]   busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local><87d4egudlg.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139AAF@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Peter> Then it's time to debug. Do you have an /etc/securetty on the target
 Peter> and does it list ttyS0?

 Robin> Yes, ttyS0 is listed in /etc/securetty. The only change i made
 Robin> from the non working to the working version is changing the
 Robin> busybox version and rebuild buildroot.

Peter> Ok, are you using the default busybox config
Peter> (package/busybox/busybox-1.13.x.config) or a custom one?

I'm using everything as default as set up by at91sam9263ek_defconfig. When checking
closer I realize the config file used is package/busybox/busybox-1.6.0. A diff
between this one and package/busybox/busybox-1.13.x.config gives a lot of differeces,
so I suspect this might be the cause of the problem. I'll try to recompile with a 
newer config file.

 Peter> If that's ok, then I would suggest you enable strace, boot with
 Peter> init=/bin/sh and send the strace output of running login here to the
 Peter> list.

 Robin> I tried passing init=/bin/sh to the kernel, but then I end up
 Robin> without a shell.  The console is still responsive and echoes
 Robin> everything I type and produces newlines when I hit return but
 Robin> nothing more.

Peter> Strange, that doesn't sound right. What is you console= on the kernel
Peter> cmdline set to?

console=ttyS0,115200

Regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090121/faeefc2d/attachment.htm 
