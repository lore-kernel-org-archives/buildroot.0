From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 9 Dec 2009 14:18:21 -0800
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <87hbrzx0hf.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com><87vdgfx6ac.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com><87ocm7x0q9.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92B@EXCHANGEVS01.appsig.com>
	<87hbrzx0hf.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92C@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does the busybox dhcp client get called by the kernel at some point
(udhcpc?)?  how do I make this configuration so that the busybox dhcp
client is used?

I turned off the "IP : kernel level autoconfiguration" (CONFIG_IP_PNP)
off in the linux kernel, no change. 

I then ran with just the boot line "console=ttyS0 root=/dev/ram" and
still got the failure.  

::Ryan

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Wednesday, December 09, 2009 2:10 PM
To: NEAL, RYAN
Cc: Peter Korsgaard; buildroot at busybox.net
Subject: Re: [Buildroot] RTNETLINK error

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> Because I am messing up the configuration :).  I want the kernel
to come
 Ryan> up and setup the dhcp/dns so that the virtex5 is on the network,
 Ryan> pingable, ssh (eventually), ftp (eventually), etc.

DNS is normally not possible with the kernel IP autoconfig, you better
use the dhcp client in busybox for that.

 Ryan> This is some settings inside of the Xilinx kernel then?

Not if you use the busybox version.

Does the above work if you remove the ip=.. part of your kernel command
line?

-- 
Bye, Peter Korsgaard
