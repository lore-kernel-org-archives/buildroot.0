From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Tue, 5 Jan 2010 14:47:14 -0800 (PST)
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <4B43A464.70405@free.fr>
Message-ID: <304874.32181.qm@web58207.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



--- On Tue, 1/5/10, Julien Boibessot <julien.boibessot@free.fr> wrote:

> From: Julien Boibessot <julien.boibessot@free.fr>
> Subject: Re: [Buildroot] mdev & usb problem
> To: peter.stosz at mentat.hu
> Cc: buildroot at busybox.net
> Date: Tuesday, January 5, 2010, 12:43 PM
> peter.stosz at mentat.hu
> a ?crit :
> >
> > > > open("/dev/bus/usb",
> O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
> > > > such file or directory)
> > > seems to be the problem (compare it with "strace
> us" on your PC)
> > > Do you have a directory named /dev/bus/usb/ ??
> > No, but found /proc/bus/usb, isn't is enought?
> maybe not but I don't know libusb enough to give you more
> tips :-(
> 

The old mount point for usbfs was /proc/bus/usb, now it is /dev/bus/usb. Same filesystem. But someone has to mount it in either place. libusb uses this filesystem, but libusb is not required for usb device access.

Regards, Steve


      
