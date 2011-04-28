From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 28 Apr 2011 09:30:20 -0700
Subject: [Buildroot] busybox network configuration
In-Reply-To: <E2055310C50F48C1B48974D7235DE3C4@beraninstruments.com.local>
References: <BANLkTinUrGGn0r6GR54j52Xv3eriRwyXVw@mail.gmail.com>
	<E2055310C50F48C1B48974D7235DE3C4@beraninstruments.com.local>
Message-ID: <BANLkTikM-xAx=226qSPW3HVDBY1KUUYFxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, Will, that gets me most of the way to the place I  need to go.
With this change to /etc/network/interfaces and ifconfig shows eth0 with the
correct ipAddress and netmask on boot. A "route" shows an appropropriate
valid default gateway.

Unfortunately, ping still fails, so there must be a bit more to the recipe I
dont quite understand yet.

I do know that the interface is connected and working as I can tftp u-boot,
uImage and rootfs.jffs2 to the board and program them into the flash. The
issue seems to be that the interface cannot yet ping. I will look on the
local lan segment with ethereal next, but I wonder if you could suggest any
other things to look at and consider.


On Thu, Apr 28, 2011 at 8:26 AM, Will Moore <will.moore@beraninstruments.com
> wrote:

> Hi Charles,
>
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:
> buildroot-bounces at busybox.net] On
> > Behalf Of Charles Krinke
> > Sent: 28 April 2011 16:16
> > To: buildroot
> > Subject: [Buildroot] busybox network configuration
> >
> > I have apparently forgotten the recipe to configure a network in busybox.
> >
> > I have tried:
> > # ifconfig eth0 10.1.2.3 netmask 255.255.255.0 up
> > # route add default gw 10.1.1.1 etho
> >
> > But, ping doesnt seem to get out of the target board.
> >
> > I also suspect there are one or more script files with things like this
> that
> > need to be set, but the busybox implementation doesnt have an
> > /etc/sysconfig/network-scripts, so they need to be in a different place,
> but
> > what is the location and name of the file?
> >
> > DEVICE=eth0
> > BOOTPROTO=static
> > BROADCAST=XXX.XXX.XXX.255
> > IPADDR=XXX.XXX.XXX.XXX
> > NETMASK=255.255.255.0
> > NETWORK=XXX.XXX.XXX.0
> > ONBOOT=yes
> >
> > Can someone please help my naivety a little bit with busybox, please?
>
> Just alter /etc/network/interfaces to e.g:
>
> auto eth0
> iface eth0 inet static
>   address 10.1.2.3
>    netmask 255.255.255.0
>    gateway 10.1.1.1
>
> no?
>
> >
> > --
> > Charles Krinke
> >
> >
>
>
>
>


-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110428/dffa2e76/attachment.html>
