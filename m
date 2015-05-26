From: Jonas Jensen <jonas.jensen@gmail.com>
Date: Tue, 26 May 2015 16:29:03 +0200
Subject: [Buildroot] Buildroot + Raspberry Pi B: eth0 issue
In-Reply-To: <CAK9TtU2fZB9t0rBnbJHLkHgA4w0sA_kkdtHQV9iwQh5GCquYXQ@mail.gmail.com>
References: <CAK9TtU2fZB9t0rBnbJHLkHgA4w0sA_kkdtHQV9iwQh5GCquYXQ@mail.gmail.com>
Message-ID: <CACmBeS1xg87y-mhVrUC720t9fuPgo3jY12mVdG+hS-Ud2hkawA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I found this without answer searching for the same..


On 8 July 2014 at 19:44, Sylvain LG <forum@sylvainlegourr.com> wrote:

> At first boot, network was fine. But after a reboot command, eth0 is not
> up at boot and fails with this error:
>
> Starting network...
>> [    2.046886] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
>> ip: SIOCGIFFLAGS: No such device
>
>

Although the original post is quite old, the same thing applies to upstream
kernel v3.17 + buildroot-2015.02.

My current working solution:

Wait 2 seconds before ifup happens in /etc/init.d/S40network

i.e. :
  start)
        echo "Starting network..."
        sleep 2
        /sbin/ifup -a
        ;;

.. which seem to be just enough time for the kernel to bring up USB.


The right thing probably requires mdev or udev, but that seems unnecessary,
at least for me that has managed without so far.
How to do this with udev or mdev is discussed here:
http://compgroups.net/comp.sys
.raspberry-pi/how-to-automatically-configure-eth0-int/3023145


Regards,
Jonas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150526/f0fdeac2/attachment.html>
