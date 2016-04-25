From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Apr 2016 21:55:55 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <87lh41o56p.fsf@dell.be.48ers.dk>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk>
 <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <20160425211936.73f44f62@gmx.net> <87lh41o56p.fsf@dell.be.48ers.dk>
Message-ID: <20160425215555.49b860b7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 25 Apr 2016 21:32:14 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
> Hi,
> 
>  > Same here on RPi3, but with the suggested fix from Oscar Gomez Fuente
>  > [1], adding 'dtoverlay=pi3-disable-bt' to config.txt I get working
>  > boot messages and login on HDMI and serial console...
> 
> Just to confirm, neither serial or HDMI works without the dtoverlay
> line?

Without the overlay I get boot messages on HDMI, but no login, last messages
are from USB keyboard/mouse and I can get more messages removing/adding
keyboard/mouse...., no messages on serial console (but 'ttyS0: 29 input overrun(s)
message on HDMI output)

From linux-3de232825c9ba5989522b8691eb6ac5df6619458/arch/arm/boot/dts/overlays/pi3-disable-bt-overlay.dts:

  Disable Bluetooth and restore UART0/ttyAMA0 over GPIOs 14 & 15.

So I think the overlay changes the pin muxing (and the orignal config seems to break
the console, maybe flow control deadlock with the bluetooth chip?)...

> 
> I see various references to a clocking issue with the "new" serial port,
> perhaps that is related?
> 

This was with old kernel/firmware but adding 'core_freq=250' to config.txt
fixed it...

Regads,
Peter
