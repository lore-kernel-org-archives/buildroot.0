From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Sep 2012 14:34:03 +0200
Subject: [Buildroot] Question: exporting
 QWS_KEYBOARD=LinuxInput:/dev/input/event0" hang application
In-Reply-To: <CAAfyv34dT-531F66fHTx8-Tk7nXP0NkSPx_L2SOYkgc--CucDw@mail.gmail.com>
References: <CAAfyv34dT-531F66fHTx8-Tk7nXP0NkSPx_L2SOYkgc--CucDw@mail.gmail.com>
Message-ID: <20120910143403.48f87840@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 10 Sep 2012 11:08:54 +0200,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> I know this isn't related to buildroot but maybe somehow have same troubles.
> I've build simple buildroot rootfs (2012.08 based) with QT4.8.2, my
> small qt application
> and dropbear.
> 
> I can start my application and it is working fine. When need to add
> keyboard handling
> from USB keyboard application hang (with no useful data in console) that way:
> export QWS_KEYBOARD="LinuxInput:/dev/input/event0" ./app -qws
> 
> I've double check qt configuration and linuxinput is checked.
> Anybody have same troubles?

I remember having problems with Qt as soon as I started defining
QWS_KEYBOARD, but I don't remember if the problem was exactly the one
you had.

Can you try to add the attached patch to the Qt package? It has been
written for Qt 4.7.3, but since the patch is trivial, I guess it can be
quickly adapted to Qt 4.8.2. It's the patch I had to fix the problem I
encountered, but again I don't remember the exact problem, and I have
been apparently too lazy to describe it in the patch description.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-4.7.3-remove-ioctl.patch
Type: text/x-patch
Size: 721 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120910/685f2bd7/attachment.bin>
