From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2012 12:44:34 +0100
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <BLU0-SMTP3763BD6AB472CBE81E9839DD28C0@phx.gbl>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
 <20120128124931.5dddc20e@skate>
 <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
 <20120129103634.620aced8@skate>
 <BLU0-SMTP3763BD6AB472CBE81E9839DD28C0@phx.gbl>
Message-ID: <20120129124434.3096460b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 29 Jan 2012 17:12:57 +0530,
inblueswithu <inblueswithu@hotmail.com> a ?crit :

> The kernel headers version I used is 2.6.37.x. So my kernel on the 
> target will be of that version.

Your conclusion is wrong: it is not because you have used the kernel
headers 2.6.37.x that you *must* use 2.6.37 on your target.

Please read carefully:

 The kernel headers version *CAN* be different from the kernel version
 running on the target, as long as the kernel headers version is
 *OLDER* than the kernel version running on the target.

> But the kernel configuration is given as linux-3.1.config
> So, my doubt is, will this new config file which indicates to be for 
> kernel 3.1.x version
> work fine with 2.6.37.x version of kernel?

It might require some minor adaptation.

But still, I don't understand your persistence in trying to use 2.6.37
while the qemu_arm_versatile_defconfig is a known working
configuration. Can you please try with that one without any
modification.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
