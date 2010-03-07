From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 7 Mar 2010 12:26:38 -0800 (PST)
Subject: [Buildroot] TFTP performance with U-Boot running under QEMU
In-Reply-To: <c166aa9f1003071049k3207b922ge5849c3cc3292653@mail.gmail.com>
References: <729565.36936.qm@web44806.mail.sp1.yahoo.com>
	<c166aa9f1003071049k3207b922ge5849c3cc3292653@mail.gmail.com>
Message-ID: <501849.68346.qm@web44805.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, that is a good suggestion.  I will try that.



________________________________
From: Andrew Dyer <amdyer@gmail.com>
To: Jim Thomas <jimthomasembedded@yahoo.com>
Sent: Sun, March 7, 2010 12:49:15 PM
Subject: Re: [Buildroot] TFTP performance with U-Boot running under QEMU

On Sun, Mar 7, 2010 at 12:19 PM, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> Hello,
> I previously got the Buildroot generated Linux kernel and
> RFS running in a QEMU VM (ARM versatilepb) , where the Linux
> kernel zImage is passed to QEMU directly as a startup command
> line option.
> Now I am exploring adding U-Boot to the mix, where QEMU
> executes u-boot.bin, and U-Boot first transfers the Linux
> kernel uImage via TFTP and then executes it in the QEMU VM.
> I currently hard-code a few U-Boot environment variables in
> ./include/configs/versatile.h.  That is inflexible, but very
> convenient since it eliminates having to manually re-enter the
> IP addresses, kernel parameters, and boot commands manually
> each time the QEMU VM and U-Boot are restarted.
> It works:

I haven't specifically looked at qemu, but usually when u-boot tftp is
problematic it has to do with timeouts and retries and the u-boot
timers.  The u-boot code wants to be set up with CONFIG_HZ == 1000 and
if the timer subsystem is running faster than that, the delays and
timeouts start to happen and everything bogs down, as TFTP is a
response-ack kind of protocol



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100307/f26309c1/attachment.htm>
