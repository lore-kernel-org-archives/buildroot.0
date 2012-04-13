From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Apr 2012 09:56:17 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
In-Reply-To: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
Message-ID: <20120413095617.0b583ec8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Apr 2012 09:38:58 +0200,
Mikael ?sberg <mikael.asberg@mdh.se> a ?crit :

> First I did 'make menuconfig' and set mxs_defconfig, and then 'make'.
> Then I do 'make linux-menuconfig' (adding as many UART options as possible).
> I do a 'make menuconfig' again and set Kernel --> Kernel configuration --> Using a custom config file.
> I change file path to output/build/linux-3.2.6/.config (instead of mxs_defconfig).

You don't need to do this last step. 'make linux-menuconfig' will edit
the output/build/linux-3.2.6/.config file, and it will be use at the
next invocation of make.

However, you will want to save your .config file somewhere else in
order to not lose it when you'll do a make clean.

> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.

Build your kernel with CONFIG_EARLYPRINTK and pass the "earlyprintk"
argument on the kernel command line. It will give some more details on
what's happening.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
