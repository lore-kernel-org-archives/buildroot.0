From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:24:13 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
In-Reply-To: <1420747796-28272-1-git-send-email-ps.report@gmx.net>
References: <1420747796-28272-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150108212413.4d3aee4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu,  8 Jan 2015 21:09:55 +0100, Peter Seiderer wrote:
> This kernel module enables the (easy?) using of the ADS7846 SPI touch controller
> on Waveshare 3.2 LCD (B) modules.
> 
> Alternatives would be:
> - the old way: add device definition/register call to arch/arm/mach-bcm2708/bcm2708.c
> - the new way: use device tree support and add an entrie for ads7846

I'm sorry, this is not your fault, but this ads7846_device thing is an
absolute abomination. Why is RaspberryPi *THE* platform propagating all
the worst possible abominations? Why is it *THE* platform doing all the
non-standard stuff? Why is it so crappy.

People, please read this: if you want to learn embedded Linux, don't
buy Raspberry Pi. It is the worst platform ever in terms of embedded
Linux development best practices. Ever.

Do yourself a favor, and buy properly supported stuff: the Atmel
Xplained comes to mind, the BeagleBone Black as well of course.

Sorry, but this ads7846_device is just pure crap. The alternatives you
mentioned are the only good solutions: change your board file if you're
using an old style ARM kernel, or change your Device Tree if you're
using a new style ARM kernel.

I don't know what the policy of Buildroot should be about accepting
crap, but on my side, I will not add such a package to Buildroot.

Again: don't take this personally, this is absolutely not against you.
Just me being fed up with Raspberry Pi crap.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
