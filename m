From: Adeel Nafis <adeel@linkwisetech.com>
Date: Wed, 30 Jan 2013 11:27:39 +0500
Subject: [Buildroot] can not open ttyUSB0
In-Reply-To: <mailman.83813.1359524634.32592.buildroot@busybox.net>
References: <mailman.83813.1359524634.32592.buildroot@busybox.net>
Message-ID: <5108BD5B.3050001@linkwisetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,
I have a kit2416 (http://www.armdesigner.com/KIT2416.html) module with 
Samsung ARM926EJS*. *I have configured buildroot with static device 
table, and added the ttyUSB0,1,2,3 to with major 188 and minor 0,1,2,3 
to the file.
I also added the line to /etc/fstab

none    /dev/bus/usb    usbfs    defaults,devmode=0666    0    0

After attaching a 3G Modem USB  I am able to successfully use 
'usb_modeswitch" and get the device to switch with messages indicating 
that the device is connected to /dev/ttyUSB0,1,2. However, after this I 
can not open the /dev/ttyUSBx any more. If i use gnokii for arm it 
prints out some messages indicating that it failed to open the port.

Gnokii output
GNOKII Version 0.6.26
Gnokii serial_open: open: No such device        <----- the port here is 
set to /dev/ttyUSB0
Couldn't open ATBUS device: No such device
Telephone interface init failed: Command failed.
Quitting.
Cannot unlock device.
Command failed.

I have tested the thing out with Ubuntu for arm on the same platform and 
can verify that it works.

If I do `cat /dev/bus/usb/devices` output is
# cat /dev/bus/usb/devices

T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
D:  Ver= 1.10 Cls=09(hub  ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=0000 ProdID=0000 Rev= 2.06
S:  Manufacturer=Linux 2.6.21.5-cfs-v19 ohci_hcd
S:  Product=S3C24XX OHCI
S:  SerialNumber=s3c24xx
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   2 Ivl=255ms

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=12  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=12d1 ProdID=1446 Rev= 0.00
S:  Manufacturer=HUAWEI Technology
S:  Product=HUAWEI Mobile
S:  SerialNumber=1234567890ABCDEF
C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=(none)
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms


Any pointers?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130130/138bf6e6/attachment.html>
