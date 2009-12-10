From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Thu, 10 Dec 2009 09:44:33 -0800
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <874onzw2mu.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com><87vdgfx6ac.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com><87ocm7x0q9.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92B@EXCHANGEVS01.appsig.com><87hbrzx0hf.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92C@EXCHANGEVS01.appsig.com>
	<874onzw2mu.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92D@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I add "rdinit=/bin/sh" to the command line then I don't get the
RTNETLINK error, I get a prompt.  I anticipate that I should be getting
a prompt (maybe some other messages between, haven't seen it run)
shortly after the network is configured.  

Is there a setting in BR to add that "iface  eth0 ..." to the
/etc/network/interfaces?  Or do I need edit the file directly before the
make?

::Ryan

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Thursday, December 10, 2009 2:21 AM
To: NEAL, RYAN
Cc: Peter Korsgaard; buildroot at busybox.net
Subject: Re: [Buildroot] RTNETLINK error

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

Hi,

 Ryan> Does the busybox dhcp client get called by the kernel at some
point
 Ryan> (udhcpc?)?  how do I make this configuration so that the busybox
dhcp
 Ryan> client is used?

Not by the kernel, but by ifup (by adding something like this to
/etc/network/interfaces):

iface eth0 inet dhcp
auto eth0

 Ryan> I turned off the "IP : kernel level autoconfiguration"
(CONFIG_IP_PNP)
 Ryan> off in the linux kernel, no change. 

 Ryan> I then ran with just the boot line "console=ttyS0 root=/dev/ram"
and
 Ryan> still got the failure.  

Ok, are you sure that the system hangs in ifup? What do you expect to
happen afterwards? Have you configured a getty (login program) on ttyS0?

-- 
Bye, Peter Korsgaard
