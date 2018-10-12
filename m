From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Oct 2018 23:52:28 +0200
Subject: [Buildroot] Plug/unplug ethernet connector does not detected on
 Raspberry PI3 B+
In-Reply-To: <CALtfCQZzF97R1Jy-62acGwoVLg0umWNTPRRBaxUOvNJVYfQMWA@mail.gmail.com>
References: <CALtfCQbvKXAHjw60eazZ1LzRpuUQH5EuPaDypuUCd3sO=zoYaw@mail.gmail.com>
 <fae7198d-e632-b1eb-c4d4-d38a15220618@mind.be>
 <CALtfCQZzF97R1Jy-62acGwoVLg0umWNTPRRBaxUOvNJVYfQMWA@mail.gmail.com>
Message-ID: <20181012235228.2be9f7d8@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Thu, 4 Oct 2018 08:12:06 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi Arnout,
> 
> >  You probably want ifplugd.
> 
> Yes, I was checking this one, but it didn't work properly (Sometimes works
> and sometimes not).
> 
> I don't understand because If I am using the same defconfig file than in
> the Raspberry Pi 3B (changing the config.txt file and changing the device
> tree bcm2710-rpi-3-b-plus.dtb for bcm2710-rpi-3-b.dtb) everything works
> fine without installing the ifplugd.
> 
> So, this is the reason I think there is something wrong with the driver
> LAN9515 (Raspberry Pi 3B+).
> 
> It is not normal that with the same image, in the raspberry pi 3B, I can
> see kernel messages of the plug/unplug events:
> 
> [   81.006823] smsc95xx 1-1.1:1.0 eth0: link down
> [   83.455586] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa
> 0xC5E1
> [   84.454778] smsc95xx 1-1.1:1.0 eth0: link down
> [   87.080069] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa
> 0xC5E1
> 
> And with the Raspberry Pi 3B+, I cannot see this messages, so I think the
> driver is not detecting these events and then the Raspberrypi is not able
> to execute ifup/ifdown automatically.
> 
> Does anyone have any suggestion? I am stuck.

Same suggestions as for thee BT Problem ([1]), try out original Raspbian, try out
with buildroot bumped rpi packages to latest versions ([2])....

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2018-October/233141.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-October/233136.html

> 
> Oscar Gomez Fuente
> TST Sistemas
> www.tst-sistemas.es
