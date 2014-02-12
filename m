From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 12 Feb 2014 21:58:28 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212090659.15291b2b@skate>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate> <20140211180123.GB3411@free.fr>
 <20140212090659.15291b2b@skate>
Message-ID: <52FBE074.4070005@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tomas, Yann,

>>>>         arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/
>>> libusb compatibility issue?
>>>
>>> scan_usb.c:34:29: error: unknown type name 'usb_dev_handle'
>>> scan_usb.c:38:41: error: unknown type name 'usb_dev_handle'
>>> scan_usb.c:41:1: error: unknown type name 'usb_dev_handle'
>>> scan_usb.c:41:48: warning: 'struct usb_device' declared inside parameter list [enabled by default]
>>> scan_usb.c:41:48: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
>>> scan_usb.c: In function 'nutscan_load_usb_library':
>>> scan_usb.c:67:22: error: 'nut_usb_close' undeclared (first use in this function)
>> I tried to reproduce it here, but it builds fine (in a squeeze-32
>> chroot, with almost nothing installed except the Buildroot
>> dependencies).
> Error occurred on gcc10, where tests are not running in a clean chroot,
> but in an environment with lots of headers/libraries installed. I'll do
> a test build on gcc10, to see what host stuff causes this mis-detection.
>
> Thanks!
>
> Thomas
I also tried to reproduce this build failure recently, but nut builds 
fine for me too.
Have you found somethingon gcc10 ?

I don't think it's related but libhal.h is present on the autobuilder's log
"checking for libhal.h... yes"

Maybe add --without-hal in nut.mk ?

Can you provide a complete build log with configure step ?

I hope it can help...
Best regards,
Romain Naour
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140212/c05c4aa9/attachment.html>
