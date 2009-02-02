From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 3 Feb 2009 10:24:22 +1100
Subject: [Buildroot] can't open /dev/tty No such device or address
In-Reply-To: <1233613745.7613.23.camel@penguin>
References: <1233613745.7613.23.camel@penguin>
Message-ID: <20090202232422.GB30540@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 02, 2009 at 05:29:05PM -0500, jeff angielski wrote:
> 
> I am getting the following errors when trying to boot a CRAMFS image on
> my PowerPC target.
> 
> can't open /dev/tty1: No such device or address
> can't open /dev/tty2: No such device or address
> can't open /dev/tty3: No such device or address
> <repeats over and over>
> 
> 
> If I log into the system through my serial port (/dev/ttyCPM0) you can
> see that the char devs exist in the fileystem.
> 
> crw-rw-rw-  1 root     root       4,   1 Dec 31 17:00 tty1             
> crw-rw-rw-  1 root     root       4,   2 Dec 31 17:00 tty2             
> crw-rw-rw-  1 root     root       4,   3 Dec 31 17:00 tty3  
> 
> 
> The node info matches the device_table.txt.
> 
> Any idea what is going on here?  Anybody else seeing this?

You have the /dev entries but no driver for device 4, 1 etc in the
kernel.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
