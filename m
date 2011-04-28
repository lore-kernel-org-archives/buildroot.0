From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 28 Apr 2011 08:15:41 -0700
Subject: [Buildroot] busybox network configuration
Message-ID: <BANLkTinUrGGn0r6GR54j52Xv3eriRwyXVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have apparently forgotten the recipe to configure a network in busybox.

I have tried:
# ifconfig eth0 10.1.2.3 netmask 255.255.255.0 up
# route add default gw 10.1.1.1 etho

But, ping doesnt seem to get out of the target board.

I also suspect there are one or more script files with things like this that
need to be set, but the busybox implementation doesnt have an
/etc/sysconfig/network-scripts, so they need to be in a different place, but
what is the location and name of the file?

DEVICE=eth0
BOOTPROTO=static
BROADCAST=XXX.XXX.XXX.255
IPADDR=*XXX.XXX.XXX.XXX*
NETMASK=255.255.255.0
NETWORK=*XXX.XXX.XXX.0*
ONBOOT=yes


Can someone please help my naivety a little bit with busybox, please?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110428/a64ea87a/attachment.html>
