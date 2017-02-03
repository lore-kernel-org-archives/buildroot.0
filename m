From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Feb 2017 00:18:15 +0100
Subject: [Buildroot] [BUILDROOT 2016.11.2] Change kernel version (I need
 4.1.18)
In-Reply-To: <1313003300.253161.1486114996684@mail.yahoo.com>
References: <1313003300.253161.1486114996684.ref@mail.yahoo.com>
 <1313003300.253161.1486114996684@mail.yahoo.com>
Message-ID: <4fe57fc0-9d51-4610-3252-fff67d210f64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-02-17 10:43, thierry.xenomai43 at yahoo.com wrote:
>  
> Hello,
> ?
> I need to compile a 4.1.18 kernel linux for a RaspberryPi 3 target (ARM 64bit)
> to patch it with an ADEOS I-pipe (I get ipipe patch only for 4.1.18 kernel).
> ?
> To start I want to test a simple project without the Xenomai package and with
> linux 4.1.18.
> ?
> I tried to change the version of the Linux kernel but during the compilation I
> get the following error message:
> 
> which: no flex in
> (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)
> which: no bison in
> (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)
> which: no cmake in
> (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)
> ***
> *** Can't find default configuration "arch/arm/configs/bcm2709_defconfig"!
> ***
> scripts/kconfig/Makefile:105: recipe for target 'bcm2709_defconfig' failed

 The upstream 4.1 kernel doesn't have bcm2709_defconfig. You have to use a
rpi3-specific kernel. Take the rpi-4.1.y branch from the RPi repo on
https://github.com/raspberrypi/linux


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
