From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 12:49:31 +0100
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
Message-ID: <20120128124931.5dddc20e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 28 Jan 2012 13:55:19 +0530,
inblueswithu <inblueswithu@hotmail.com> a ?crit :

>     $ qemu-system-arm -M versatilepb -m 128 -kernel
>     ./output/images/zImage --nographic
>     oss: Could not initialize DAC
>     oss: Failed to open `/dev/dsp'
>     oss: Reason: No such file or directory
>     oss: Could not initialize DAC
>     oss: Failed to open `/dev/dsp'
>     oss: Reason: No such file or directory
>     audio: Failed to create voice `lm4549.out'
>     Uncompressing Linux... done, booting the kernel.

Most likely your kernel configuration is wrong. Please use the
qemu_arm_versatile_defconfig available in Buildroot as an initial
configuration, so that you start from a known-working configuration for
the ARM Versatile platform emulated by Qemu.

For example, your configuration selects the armeb architecture, while
most likely the Versatile Qemu support in arm only (i.e little-endian).
More or less everybody uses little-endian on ARM anyway, so you should
really start from here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
