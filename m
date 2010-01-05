From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 5 Jan 2010 06:43:32 -0600
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <4B433270.6010806@free.fr>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
	<OF42E07C52.E79A00B9-ONC12576A2.00330B26-C12576A2.003321B3@mentat.hu>
	<4B433270.6010806@free.fr>
Message-ID: <201001050643.35127.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue January 5 2010, Julien Boibessot wrote:
> peter.stosz at mentat.hu a ?crit :
> > /opt # find / -name usb.ids*
> > /usr/share/usb.ids.gz
> and what gives "strace lsusb" on your board ??
> > /opt #
> > /opt # strace ./us
> > ......
> > ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
> > echo ...}) = 0
> > ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
> > echo ...}) = 0
> > open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
> > such file or directory)
> seems to be the problem (compare it with "strace us" on your PC)
> Do you have a directory named /dev/bus/usb/ ??
> 

Translation:
You have to mount usbFS at /dev/bus/usb
"Your PC" may be auto-mounting it, which isn't much guidance.

Mike
> Julien
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
