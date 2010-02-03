From: Tony Mozi <spooflinux@hotmail.fr>
Date: Wed, 3 Feb 2010 16:08:27 +0100
Subject: [Buildroot] ip: RTNETLINK answers: File exists? uclibc login:??
 [RESOLVED]
In-Reply-To: <4e1d.4b696c03.c4fdb@getafix.xdna.net>
References: <SNT129-W58972AB1A1E9CC737751EBB9560@phx.gbl>,
	<4e1d.4b696c03.c4fdb@getafix.xdna.net>
Message-ID: <SNT129-W20965328EF1E58B23AE75AB9560@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


It's OK :)
Generic serial port config was not enable.
I activated it and I changed 
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
by
ttyS0::respawn:/sbin/getty -L ttyUSB0 115200 vt100 # GENERIC_SERIAL
because I use an USB to RS232 converter.

Now, when I start the UART, I receive at the end :
Welcome to Buildroot
buildroot login :

I pass the login and I have an access on the serial console.

Good job :)

Tony



> To: buildroot at busybox.net
> From: lists at xdna.net
> Date: Wed, 3 Feb 2010 12:28:51 +0000
> Subject: Re: [Buildroot] ip: RTNETLINK answers: File exists? uclibc login:??
> 
> Tony Mozi <spooflinux@hotmail.fr> writes:
> 
> >When I start the board, I have 2 problems :
> 
> >1/ On minicom -s : 
> >Starting network...
> >ip: RTNETLINK answers: File exists 
> 
> This isn't a problem. It occurs (I think) because there are commands in
> /etc/inittab to initialise the loopback interface, which get executed
> again when "ifup -a" runs from the /etc/init.d/S40network initscript.
> You can ignore this error.
> 
> 
> >When I write a command, like ls, there is no effect.
> >What does it mean?
> 
> It means there is nothing listening for your command because...
> 
> 
> >2/ On the LCD of the board :
> >Welcome to Buildroot
> >uclibc login:
> 
> >Have you got an idea?
> 
> ....it looks like you are not running a getty on ttyS0 (or whatever your
> console is on).
> 
> In "make menuconfig", under Target Options --> Generic serial port
> config, there is the option to set the serial port to run a getty on. If
> you set this properly, you should end up with a line (uncommented) in
> /etc/inittab that reads:
> 
> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> 
> This line will allow you to log into the system through minicom. You
> should see the same prompt there you showed above that was on the LCD.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
_________________________________________________________________
T?l?chargez Internet Explorer 8 et surfez sans laisser de trace !
http://clk.atdmt.com/FRM/go/182932252/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100203/35b05577/attachment.htm>
