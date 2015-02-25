From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 11:03:55 -0300
Subject: [Buildroot] eth0 missing ?
In-Reply-To: <974034368E9D498B93AD300538173FB3@JohanW7>
References: <974034368E9D498B93AD300538173FB3@JohanW7>
Message-ID: <54EDD64B.2000808@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/2015 06:57 AM, Sagaert Johan wrote:

> Hi
> 
> Where could the reason be for this, I did not have this a while ago.
> I am not in position to investigate right now, but some hints are welcome.
> 
> Partial bootlog: 
> 
> ...snip...
> flexcan 80034000.can: device registered (reg_base=c8a90000, irq=213)
> fec 800f0000.ethernet eth126: renamed from eth0
> input: gpio-keys as /devices/soc0/gpio-keys/input/input0
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> udevd[71]: renamed network interface eth0 to eth126                          <---------------------???
> fec 800f0000.ethernet eth1: renamed from eth126
> udevd[71]: renamed network interface eth126 to eth1                          <---------------------???
> ci_hdrc ci_hdrc.0: doesn't support gadget
> ci_hdrc ci_hdrc.0: no supported roles
> ci_hdrc ci_hdrc.1: EHCI Host Controller
> ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
> ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> usb usb1: Product: EHCI Host Controller
> usb usb1: Manufacturer: Linux 3.18.5-apex ehci_hcd
> usb usb1: SerialNumber: ci_hdrc.1
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 1 port detected
> done
> Initializing random number generator... done.
> Starting rpcbind: OK
> 
> ..snip..

Hi.
That's udev/systemd to blame normally, see:
http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/

Regards.
