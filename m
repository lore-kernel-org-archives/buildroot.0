From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Apr 2011 17:33:08 +0200
Subject: [Buildroot] busybox network configuration
In-Reply-To: <BANLkTinUrGGn0r6GR54j52Xv3eriRwyXVw@mail.gmail.com> (Charles
	Krinke's message of "Thu, 28 Apr 2011 08:15:41 -0700")
References: <BANLkTinUrGGn0r6GR54j52Xv3eriRwyXVw@mail.gmail.com>
Message-ID: <87mxjawfuz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I have apparently forgotten the recipe to configure a network in busybox.
 Charles> I have tried:
 Charles> # ifconfig eth0 10.1.2.3 netmask 255.255.255.0 up
 Charles> # route add default gw 10.1.1.1 etho

 Charles> But, ping doesnt seem to get out of the target board.

 Charles> I also suspect there are one or more script files with things like this that
 Charles> need to be set, but the busybox implementation doesnt have an /etc/sysconfig/
 Charles> network-scripts, so they need to be in a different place, but what is the
 Charles> location and name of the file?

 Charles> DEVICE=eth0
 Charles> BOOTPROTO=static
 Charles> BROADCAST=XXX.XXX.XXX.255
 Charles> IPADDR=XXX.XXX.XXX.XXX
 Charles> NETMASK=255.255.255.0
 Charles> NETWORK=XXX.XXX.XXX.0
 Charles> ONBOOT=yes

 Charles> Can someone please help my naivety a little bit with busybox, please?

Busybox (and our default filesystem skeleton) uses Debian-style ifup /
ifdown, so have a look in /etc/network/interfaces.

See http://wiki.debian.org/NetworkConfiguration for more details.

-- 
Bye, Peter Korsgaard
