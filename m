From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Dec 2012 00:06:52 +0100
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
Message-ID: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I am using the latest git pull of buildroot.
 
Both usb_modeswitch and lsusb fail on execute.
 
# lsusb
Segmentation fault
# usb_modeswitch
Segmentation fault
 
Can sombody verify this on a real target ?
 
(i am using a karo tx53 module running kernel 3.4.21)
 
I suspect it has something to do with libusb.
 
Looking at the makefile of usb_modeswitch, it seems to link against libusb.so
It looks this is pointing to libusb-compat-0.1.4
 
In the source code of usb_modeswitch there is a line (1896)  saying :  ....based on libusb0 (0.1.12 and above ...)
 
So something seems to be wrong (libusb-compat-0.1.4 is the latest version) , should usb_modeswitch be linked to libusb-1.0.9
instead. ?
 
I will try to link against to the other usblib, as soon as my current build finishes ...
 
I suspect the lsusb problem is similar
 

Johan

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121210/189e63c6/attachment.html>
