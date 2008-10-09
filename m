From: Will C <willjcroz@yahoo.co.uk>
Date: Thu, 9 Oct 2008 19:39:27 +0000 (GMT)
Subject: [Buildroot] wake on ring support
In-Reply-To: <BAY107-W5694BBA76945A42C1155919D3B0@phx.gbl>
Message-ID: <925524.67541.qm@web26001.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Muktabh,

> Is there a way I can wake up Linux from standby mode by
> keyboard? Even that doesn't seem to work. I have to
> restart to come out of standby.

Maybe you didn't get the email I sent you directly (not to the buildroot list as this issue is not directly related to buildroot).

Here is what I sent:

> Subject: RE: [Buildroot] wake on ring support
> To: "Muktabh Anchlia" <m_anchlia@hotmail.com>
> Date: Friday, 3 October, 2008, 4:38 PM
> OK, I took a look at your SBC manual and you are using the
> RI (ring indicator) line of a COM (serial) port, right?
> 
> So what you need to do is identify the COM port you are
> using, and do `cat /proc/acpi/wakeup` and look for it there.
> If it is there check that it is wakeup enabled, if you have
> trouble identifying it use `lspci` to maybe match the
> pci id's (the device names in /proc/acpi/wakeup can be
> tough to decipher).
> 
> The list you see from `cat /proc/acpi/wakeup` is a list of all devices
> that the kernel has found which can wake up the system. You
> should find entries for PCI slots, USB ports etc (and
> hopefully your COM ports, often listed as UART or UAR1 etc.)
> 
> now activate it if not already enabled:
> 
> e.g. : `echo UAR1 > /proc/acpi/wakeup` (replacing UAR1
> with the com port you are using)
> 
> if you are in doubt do the echo command above for each of
> the devices listed, it should enable your keyboard wakeup
> also.
> 
> That's the only thing I can think of which will get
> this working, if not you might want to try a more specific
> SBC mail list or forum for this issue.

Can you send me a copy of the output of `cat /proc/acpi/wakeup` and also from `lspci`. I might be able to help you get this working.

(email me directly - this list is for buildroot specific stuff)

Cheers,

Will


      
