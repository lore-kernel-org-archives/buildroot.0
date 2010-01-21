From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 21 Jan 2010 16:58:23 -0000
Subject: [Buildroot] Usbmount - can't get it to work
In-Reply-To: <1264091031.4b587f97b3523@webmail.unice.fr>
References: <79757207E1944D98BC351422003B9ECF@gentiane><20100121144349.GZ8970@buzzloop.caiaq.de><8798648820214450AE9B59CC54232F14@gentiane><20100121155425.GA8970@buzzloop.caiaq.de>
	<1264091031.4b587f97b3523@webmail.unice.fr>
Message-ID: <6BA93120DE1541ECBC6CB4FE48D42B12@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On buildroot 2009.11 I added usbmount as I would like to automatically mount
a vfat USB memory stick when connected to my buildroot target.  However when
I connect a vfat USB memory stick, although it is detected as /dev/sda4 and
I can manually "mount /dev/sda4 /media/usb0", usbmount does not seem to want
to do this for me.

I have mkdir /media/usb0 through /media/usb7.  I have ensured that I have
set /etc/usbmount/usbmount.conf FILESYSTEMS to include vfat and I have set 
FS_MOUNTOPTIONS="-fstype=vfat,gid=floppy,dmask=0007,fmask=0117".  I have
/sbin/usbmount executable on the target.  I do not see /var/log/usbmount or
/var/run/usbmount directories.

Usbmount documentation is thin on the ground so I am at a bit of a loss.  I
am not sure if usbmount is even running...
 
Any suggestions would be appreciated.



Will
