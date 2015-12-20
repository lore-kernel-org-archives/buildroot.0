From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:48:19 +0100
Subject: [Buildroot] Trouble bringing up Raspberry Pi
In-Reply-To: <20151220201235.GA3766@buinea.com>
References: <20151219201126.GA9718@buinea.com>
 <20151220102721.16b3d82b@free-electrons.com>
 <20151220133618.GA8906@buinea.com>
 <20151220144059.4099ee63@free-electrons.com>
 <20151220201235.GA3766@buinea.com>
Message-ID: <20151220224819.2e9d844e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Morris,

On Sun, 20 Dec 2015 12:12:35 -0800, Steve Morris wrote:

> I retried on a Pi Model B which had a serial adapter already connected.
> 
> The major problem appears to be that the USB keyboard is not working
> using the standard build.  It is found during boot and displays messages
> when unplugging/pluging. Perhaps I'm expecting too much.

What behavior are you expecting with the USB keyboard ?

If you expect the key presses on your USB keyboard to appear on your
serial console, then indeed this will not work as it wouldn't make any
sense. The USB keyboard presses should appear on tty1 (i.e on the
screen).

> The network only comes up if I put 'ip=dhcp' in cmdline.txt. This may be
> normal behavior.

By default, Buildroot does not configure any network interface. If all
you want is DHCP on one interface, you can set option BR2_SYSTEM_DHCP
to the name of your network interface.

If you need something more complicated, then it's up to you to provide
a rootfs overlay with your own /etc/network/interfaces file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
