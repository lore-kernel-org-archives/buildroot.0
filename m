From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 8 Jan 2011 18:40:29 +0100
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
Message-ID: <AANLkTikj2XSfEehgqCqoCfL_Ewknsd+sUHpEjrjc_hjY@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/1/8 Divick Kishore <divick.kishore@gmail.com>

> Hi Klaus,
>
> >have you "Generic serial port config" enabled?
>
> yeah I do have generic serial port config enabled. Any other suggestions
> please?
>
It might be that the console is disabled in /etc/inittab, just add the
following line (replace ttyS0 by your serial console if it is not ttyS0):
s0::respawn:/sbin/getty -L ttyS0 115200,38400,9600

Btw, take care of the console setting in the kernel command line and in the
inittab

Also, check in /etc/securetty that the console is enabled, to be able to
login through the console.

BR,
Sam


> Regards,
> DivKis
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110108/baca4fbe/attachment.html>
