From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 4 Oct 2018 08:12:06 +0200
Subject: [Buildroot] Plug/unplug ethernet connector does not detected on
 Raspberry PI3 B+
In-Reply-To: <fae7198d-e632-b1eb-c4d4-d38a15220618@mind.be>
References: <CALtfCQbvKXAHjw60eazZ1LzRpuUQH5EuPaDypuUCd3sO=zoYaw@mail.gmail.com>
 <fae7198d-e632-b1eb-c4d4-d38a15220618@mind.be>
Message-ID: <CALtfCQZzF97R1Jy-62acGwoVLg0umWNTPRRBaxUOvNJVYfQMWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  You probably want ifplugd.

Yes, I was checking this one, but it didn't work properly (Sometimes works
and sometimes not).

I don't understand because If I am using the same defconfig file than in
the Raspberry Pi 3B (changing the config.txt file and changing the device
tree bcm2710-rpi-3-b-plus.dtb for bcm2710-rpi-3-b.dtb) everything works
fine without installing the ifplugd.

So, this is the reason I think there is something wrong with the driver
LAN9515 (Raspberry Pi 3B+).

It is not normal that with the same image, in the raspberry pi 3B, I can
see kernel messages of the plug/unplug events:

[   81.006823] smsc95xx 1-1.1:1.0 eth0: link down
[   83.455586] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa
0xC5E1
[   84.454778] smsc95xx 1-1.1:1.0 eth0: link down
[   87.080069] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa
0xC5E1

And with the Raspberry Pi 3B+, I cannot see this messages, so I think the
driver is not detecting these events and then the Raspberrypi is not able
to execute ifup/ifdown automatically.

Does anyone have any suggestion? I am stuck.

Oscar Gomez Fuente
TST Sistemas
www.tst-sistemas.es
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181004/f26c3ee3/attachment.html>
