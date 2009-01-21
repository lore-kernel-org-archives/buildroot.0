From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 13:11:59 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	(Robin ActeSE Stridh's message of "Wed\,
	21 Jan 2009 12\:10\:19 +0100")
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
Message-ID: <8763k8uacw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

Hi,

 Robin> Hi Peter and thanks for your quick reply!

You're welcome.

 Peter> Then it's time to debug. Do you have an /etc/securetty on the target
 Peter> and does it list ttyS0?

 Robin> Yes, ttyS0 is listed in /etc/securetty. The only change i made
 Robin> from the non working to the working version is changing the
 Robin> busybox version and rebuild buildroot.

Ok, are you using the default busybox config
(package/busybox/busybox-1.13.x.config) or a custom one?

 Peter> If that's ok, then I would suggest you enable strace, boot with
 Peter> init=/bin/sh and send the strace output of running login here to the
 Peter> list.

 Robin> I tried passing init=/bin/sh to the kernel, but then I end up
 Robin> without a shell.  The console is still responsive and echoes
 Robin> everything I type and produces newlines when I hit return but
 Robin> nothing more.

Strange, that doesn't sound right. What is you console= on the kernel
cmdline set to?

-- 
Bye, Peter Korsgaard
