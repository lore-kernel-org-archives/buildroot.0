From: jeff angielski <jeff@theptrgroup.com>
Date: Tue, 03 Feb 2009 08:25:08 -0500
Subject: [Buildroot] can't open /dev/tty No such device or address
In-Reply-To: <87pri0f1gr.fsf@macbook.be.48ers.dk>
References: <1233613745.7613.23.camel@penguin>
	<20090202232422.GB30540@cloud.net.au>
	<1233633829.13156.3.camel@penguin>
	<87pri0f1gr.fsf@macbook.be.48ers.dk>
Message-ID: <1233667508.7844.5.camel@penguin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-02-03 at 08:01 +0100, Peter Korsgaard wrote:
> >>>>> "jeff" == jeff angielski <jeff@theptrgroup.com> writes:
> 
> Hi,
> 
>  jeff> You are correct.  At some point while I was trying to get my
>  jeff> serial port, /dev/ttyCPM0, up and running as the serial console
>  jeff> in buildroot I must have inadvertently disabled Virtual
>  jeff> Terminals in the kernel config file.  Once I enabled them again
>  jeff> all was well.
> 
> We don't seem to have ttyCPMx devices listed in the default
> /etc/securetty, what major/minor device numbers does it use and how
> many are typically present?

These are serial ports from the 2.6.x kernel based on the CPM core in
the PowerPC processors.  They can be found in the linux kernel under
linux/drivers/serial/cpm_uart.

Here is what I added to the device_table.txt to make it work.

/dev/ttyCPM c	666	0	0	204	46	0	1	6


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
