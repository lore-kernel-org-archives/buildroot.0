From: John Voltz <john.voltz@gmail.com>
Date: Fri, 1 Aug 2008 09:12:43 -0400
Subject: [Buildroot] my /etc/init.d/rcS won't run
In-Reply-To: <1217594857.6188.11.camel@kokopelli>
References: <oVJvhsJM.1217543786.9718410.beattie@localhost>
	<4892BA2F.60606@cetrtapot.si> <1217594857.6188.11.camel@kokopelli>
Message-ID: <46a136670808010612r747b3315w1aa8d786b329ea10@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> What I found was that including bash, caused /bin/sh to point to bash
> and for dome reason bash does not want to run that early.  Currently
> I've dropped bash.
>

Try adding init=/bin/bash to your kernel parameters in your bootloader. This
will boot you directly into a bash shell without running init, so you can
see if something's wrong with bash.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080801/0ed04f71/attachment.htm 
