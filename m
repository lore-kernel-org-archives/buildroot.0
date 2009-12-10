From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Thu, 10 Dec 2009 12:13:14 -0800
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <87zl5runrt.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com><20091210092953.73963a39@surf>
	<87zl5runrt.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C934@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got it mostly working!!!!! You guys are AWESOME!!!

Here is what I had to change: 
	- turn off the 'minimal skeleton' option:
BR2_PACKAGE_BUSYBOX_SKELETON  (not sure what this did in general...left
on it caused that RTNETLINK error)
	- turn on the generic serial and set the rate:
BR2_TARGET_GENERIC_GETTY ttyS0 at 9600

In the kernel:
	- having the IP auto config off: didn't setup eth0
	- having the IP auto config on: setup eth0, but didn't run the
busybox udhcpc

I was wondering if there is a setting to get the udhcpc to run
automatically, or if I should edit one of the startup scripts manually? 

Also, I was wondering if busybox supported telnetd?  I thought it did,
but I can't find any settings to enable it (and it isn't listed in the
busybox help).  

Overall, this is FANTASTIC.  Thank you soo much for your help!!

::Ryan

-----Original Message-----
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Peter Korsgaard
Sent: Thursday, December 10, 2009 2:28 AM
To: Thomas Petazzoni
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] RTNETLINK error

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
writes:

Hi,

 Thomas> Are you sure your /etc/inittab is properly configured to set-up
 Thomas> a getty or shell on whichever serial line you're using ?

 Thomas> This "ip: RTNETLINK" is something I also have, but the system
 Thomas> is fully functional. However, when I forget to adapt the
 Thomas> /etc/inittab to the board serial port configuration, I get the
 Thomas> same behaviour as you do.

My thoughts exactly. Notice that you don't need to edit inittab by hand
if you use the generic target skeleton, we have kconfig settings for
this nowadays (Target options->Generic serial port config).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
