From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Jan 2011 17:52:34 +0100
Subject: [Buildroot] /dev/ttyprinkt usage in BR
In-Reply-To: <87wrmaxg91.fsf@macbook.be.48ers.dk>
References: <4D2DCC0D.30409@visionsystems.de>
	<87wrmaxg91.fsf@macbook.be.48ers.dk>
Message-ID: <4D2DDC52.70806@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Yegor> As of kernel 2.6.37 there is a new pseudo tty device
>  Yegor> /dev/ttyprinkt, that can make user output through pritnk()
>  Yegor> routine. How can it be used in BR? What entries should
>  Yegor> /etc/inittab contain to redirect the console output to
>  Yegor> /dev/ttyprinkt?
>
> I haven't used it yet, but I guess the only thing you have to do to get
> all console output though it is to use devtmpfs (or add the device node
> in device_table.txt), and tell init to use it as console. Looking at the
> busybox init code, I see it gets the console device from the CONSOLE or
> console environment variables, so you would just have to add
> CONSOLE=/dev/ttyprintk to the kernel commandline.

Device creation is not a problem. If I change the console in /etc/inittab from ttyAM0 to ttyprintk I get

[U]
[U]
[U] Welcome to Buildroot
[U]                    

but no prompt.

Best regards,
Yegor
