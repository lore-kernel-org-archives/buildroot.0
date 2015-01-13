From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 21:58:39 +0100
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
Message-ID: <trinity-e44f21c5-5fb2-4d01-8bbf-b0559c70a2c2-1421182719601@3capp-gmx-bs52>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Mon, Jan 12, 2015 at 11:58:16PM -0600, Lou Crittenden wrote:
> As for the drivers starting up @ boot, I followed the advice of this page:
> http://unix.stackexchange.com/questions/59018/create-and-control-start-up-scripts-in-busybox
> (I have busybox enabled) and attempted to make a simple script in the
> /etc/init.d/ folder called fbtft, but no go.
> 
> here it is (and I did make sure to run chmod +x on it to make it
> executable):
> 
> #!/bin/sh
> 
> exec insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> name=waveshare32b rotate=270
> 
> exec insmod /lib/modules/3.12.28/kernel/drivers/input/touchscreen/ads7846.ko
> 

Your script should be named '/etc/init.d/S30fbtft', only scripts starting with 'S??' will
be called on startup (see '/etc/init.d/rcS')...

My method did not work for you because I used the systemd init system, yours is the busybox init system,
sorry for the confusion...

Regards,
Peter
 
