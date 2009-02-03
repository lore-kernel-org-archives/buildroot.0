From: jeff angielski <jeff@theptrgroup.com>
Date: Mon, 02 Feb 2009 23:03:49 -0500
Subject: [Buildroot] can't open /dev/tty No such device or address
In-Reply-To: <20090202232422.GB30540@cloud.net.au>
References: <1233613745.7613.23.camel@penguin>
	<20090202232422.GB30540@cloud.net.au>
Message-ID: <1233633829.13156.3.camel@penguin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-02-03 at 10:24 +1100, Hamish Moffatt wrote:
> On Mon, Feb 02, 2009 at 05:29:05PM -0500, jeff angielski wrote:
> > 
> > I am getting the following errors when trying to boot a CRAMFS image on
> > my PowerPC target.
> > 
> > can't open /dev/tty1: No such device or address
> > can't open /dev/tty2: No such device or address
> > can't open /dev/tty3: No such device or address
> > <repeats over and over>
> > 
> > 
> > If I log into the system through my serial port (/dev/ttyCPM0) you can
> > see that the char devs exist in the fileystem.
> > 
> > crw-rw-rw-  1 root     root       4,   1 Dec 31 17:00 tty1             
> > crw-rw-rw-  1 root     root       4,   2 Dec 31 17:00 tty2             
> > crw-rw-rw-  1 root     root       4,   3 Dec 31 17:00 tty3  
> > 
> > 
> > The node info matches the device_table.txt.
> > 
> > Any idea what is going on here?  Anybody else seeing this?
> 
> You have the /dev entries but no driver for device 4, 1 etc in the
> kernel.

You are correct.  At some point while I was trying to get my serial
port, /dev/ttyCPM0, up and running as the serial console in buildroot I
must have inadvertently disabled Virtual Terminals in the kernel config
file.  Once I enabled them again all was well.

Thanks for the info.


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
