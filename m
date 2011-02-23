From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Wed, 23 Feb 2011 11:50:00 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <20110222192538.6720529a@surf>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
	<AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
	<20110222192538.6720529a@surf>
Message-ID: <AANLkTimGr8JsO82tn==M8n9zAtfpxMoRPOvh_vY9sKb_@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

at first thanks for hints.

I tried to do make clean && make without sysvinit. And it's same :-( Also
tried ttyS0/S0 in inittab... I discovered that init is writing to
/dev/console like if it's normal file. So I make /dev/console link to
/dev/ttyS0 and now it writes text to ttyS0... Grrr. What's wrong?

I'm attaching /etc/inittab, /var/log/messages and /dev/ttyS0 (with some log
in it).

Best regards,
Zdenek Materna

Here are some of first lines /var/log/messages:

Dec 31 17:00:21 192 syslog.info syslogd started: BusyBox v1.18.3
Dec 31 17:00:21 192 user.err getty: ttyS0[895]: tcgetattr: Inappropriate
ioctl for device^M
Dec 31 17:00:31 192 user.info linuxrc: process '/sbin/getty 115200 tty1'
(pid 893) exited. Scheduling for restart.
Dec 31 17:00:31 192 user.info linuxrc: process '/sbin/getty 115200 tty2'
(pid 894) exited. Scheduling for restart.
Dec 31 17:00:31 192 user.info linuxrc: starting pid 898, tty '/dev/tty1':
'/sbin/getty 115200 tty1'
Dec 31 17:00:31 192 user.info linuxrc: starting pid 899, tty '/dev/tty2':
'/sbin/getty 115200 tty2'
Dec 31 17:00:31 192 user.err getty: tty1[898]: tcgetattr: Inappropriate
ioctl for device^M
Dec 31 17:00:31 192 user.err getty: tty2[899]: tcgetattr: Inappropriate
ioctl for device^M
Dec 31 17:00:32 192 user.info linuxrc: process '/sbin/getty -L ttyS0 115200
vt100 ' (pid 895) exited. Scheduling for restart.
Dec 31 17:00:32 192 user.info linuxrc: starting pid 900, tty '/dev/ttyS0':
'/sbin/getty -L ttyS0 115200 vt100 '
Dec 31 17:00:32 192 user.err getty: ttyS0[900]: tcgetattr: Inappropriate
ioctl for device^M

2011/2/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> On Tue, 22 Feb 2011 09:06:34 +0100
> Zden?k Materna <zdenek.materna@gmail.com> wrote:
>
> > -------------- inittab
> ---------------------------------------------------
> >
> > # /etc/inittab
> > #
> > # This inittab is a basic inittab sample for sysvinit, which mimics
> > # Buildroot's default inittab for Busybox.
>
> Aah, you have enabled sysvinit. Could you disable it, make clean &&
> make, and retry ?
>
> Busybox already contains a default init, and it's the one most of us
> test and use on a daily basis.
>
> I've written this sysvinit inittab not long ago, it was working for me,
> but it definitely does not receive as much testing as the sysvinit one
> gets.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110223/11720b4b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logs.zip
Type: application/zip
Size: 2526 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110223/11720b4b/attachment.zip>
