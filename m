From: Muktabh Anchlia <m_anchlia@hotmail.com>
Date: Wed, 1 Oct 2008 13:07:11 +0000
Subject: [Buildroot] wake on ring support
In-Reply-To: <811828.28896.qm@web26001.mail.ukl.yahoo.com>
References: <BAY107-W4782F02FE41BDF61DCBA39D430@phx.gbl>
	<811828.28896.qm@web26001.mail.ukl.yahoo.com>
Message-ID: <BAY107-W41C15BE09E765046AB78BC9D420@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

I will try to explain my problem in a little more detail. I am using
Advantech single board computer PCM-4153. My requirement is this: If my
application doesn't see action for a long time, I want the SBC to
sleep. I have an external start button, which when pressed should wake
this board up. I was thinking of using the wake-on-modem feature
available on the board. The board documentation says that if 5V is
applied to a particular pin (simulates wake on ring by a modem), it
will wake the board. Right now, I use a power supply to apply that 5V.
On XP, if i make it go to sleep and apply the voltage, it comes back
into action. But on buildroot linux, it doesn't come up. Also, once in
sleep mode, it doesn't wake even with keypresses or mouse clicks. I
have these enabled in the bios. I will try what you suggested, but the
difference is I am using an external voltage to wake the board up,
against a device.



Thank you



Muktabh


> Date: Tue, 30 Sep 2008 21:07:06 +0000
> From: willjcroz at yahoo.co.uk
> Subject: Re: [Buildroot] wake on ring support
> To: buildroot at uclibc.org
> CC: m_anchlia at hotmail.com
> 
> > I am trying to get wake on ring working on an advantech
> > board with linux (built using buildroot, kernel version
> > 2.6.24). I can make linux go to sleep using the command echo
> > standby >/sys/power/state. But I am unable to wake it up
> > using wake on ring. Advantech documents applying 5 volts on
> > some pin to wake it up. Is there any parameter in buildroot
> > config which enables/disables this support? It does work
> > with windows Xp.
> 
> I'm not sure if buildroot has specific support for this or not.
> 
> If it works in XP then it should work in Linux without using +5v on that pin. What is the device you are using to wake up the board? If you know what kind of bus it is connected to (and are using acpi) look in
> /proc/acpi/wakeup to see if it is wakeup enabled:
> 
> cat /proc/acpi/wakeup
> 
> if not do (for example with PCI0 device) :
> 
> echo PCI0 > /proc/acpi/wakeup
> 
> then try going to standby. If it works you will probably want to add it to your init scipts so that it is enabled whenever it goes into standby.
> 
> Of course if it is a NIC then you also need to use ethtool, e.g:
> 
> /usr/sbin/ethtool -s eth0 wol g
> 
> 
> regards,
> 
> Will Crozier
> 
> 
>       
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081001/4dc53cf3/attachment.htm 
