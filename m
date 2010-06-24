From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 09:44:17 +0200
Subject: [Buildroot] nbd fails to compile with /usr/bin/klcc: unknown
 option: --sysroot=
In-Reply-To: <201006240053.12651.PeterHuewe@gmx.de>
References: <201006240053.12651.PeterHuewe@gmx.de>
Message-ID: <20100624094417.37048649@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2010 00:53:12 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> the atngw100_defconfig has nbd client and server enabled, and unfortunately it fails to compile, with the message
> 
> /usr/bin/klcc: unknown option: --sysroot=/avr/buildroot/output/staging/
> 
> $klcc --version
> x86_64-pc-linux-gnu-gcc (GCC) 4.1.2 (Gentoo 4.1.2 p1.3)
> 
> How can I fix this ? - Unfortunately I'm not that into the whole buildroot system (yet, but I'd like to learn and contribute to it).

It's because you have klcc installed on your development system, nbd
detects it and uses it. Unfortunately, it doesn't understand all the
usual gcc options.

You have two options to solve this problem:

 *) Pass the --disable-klcc option to NBD's configure script. You could
    add this to NBD_CONF_OPT.

 *) Update to nbd 2.9.15 (the current version in Buildroot is 2.9.11),
    which has removed support for klcc.

In any case, don't forget to send a patch ! :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
