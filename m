From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 28 Apr 2011 11:14:03 -0500
Subject: [Buildroot] busybox network configuration
In-Reply-To: <E2055310C50F48C1B48974D7235DE3C4@beraninstruments.com.local>
References: <BANLkTinUrGGn0r6GR54j52Xv3eriRwyXVw@mail.gmail.com>
	<E2055310C50F48C1B48974D7235DE3C4@beraninstruments.com.local>
Message-ID: <201104281114.05298.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu April 28 2011, Will Moore wrote:
> Hi Charles,
> 
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
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
> > I also suspect there are one or more script files with things like this that
> > need to be set, but the busybox implementation doesnt have an
> > /etc/sysconfig/network-scripts, so they need to be in a different place, but
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
>    address 10.1.2.3
>    netmask 255.255.255.0
>    gateway 10.1.1.1
> 
> no?
>

Not if you want to reach that gateway address.

You would need to change either the netmask or
use a gateway on the same sub-net (10.1.2.0/24) as the NIC address.

Mike 
> > 
> > --
> > Charles Krinke
> > 
> > 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
