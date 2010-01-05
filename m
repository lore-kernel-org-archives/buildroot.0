From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Tue, 5 Jan 2010 14:19:35 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <4B433270.6010806@free.fr>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
	<4B42F7A6.1010100@free.fr>
	<OF42E07C52.E79A00B9-ONC12576A2.00330B26-C12576A2.003321B3@mentat.hu>
	<4B433270.6010806@free.fr>
Message-ID: <OFCD96771F.A80BB547-ONC12576A2.0049085F-C12576A2.00493480@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien Boibessot <julien.boibessot@free.fr> wrote on 2010.01.05 13:37:04:

> peter.stosz at mentat.hu a ?crit :
> > /opt # find / -name usb.ids*
> > /usr/share/usb.ids.gz
> and what gives "strace lsusb" on your board ??
A very long list (read usb.ids.gz)

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
No, but found /proc/bus/usb, isn't is enought?

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/e58cf376/attachment.htm>
