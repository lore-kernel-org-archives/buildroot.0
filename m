From: H.Fijnvandraat at inter.nl.net <H.Fijnvandraat@inter.nl.net>
Date: Thu, 9 May 2013 21:03:30 +0200 (CEST)
Subject: [Buildroot] gpu-viv-bin-mx6q
In-Reply-To: <BA6FC03EA0815D428FB8A3C279ED4992074AE1FA@mx.toyon.corp>
References: <BA6FC03EA0815D428FB8A3C279ED4992074AE1FA@mx.toyon.corp>
Message-ID: <35247.217.149.209.147.1368126210.squirrel@webmail.internl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op Do, 9 mei, 2013 7:52 pm schreef Richard Cagley:
> Is there a way to integrate the gpu-viv-bin-mx6q package in buildroot?
>
Unfortunately: Not as source
This software for the on-chip Vivante GPU is closed source....
I am working on incorporating them as libraries into buildroot at the moment.
>
> I can only extract these binaries over the root filesystem. But, they
> seem to be built with a compiler that I can't seem to find. I did try the
> one included with ltib with no luck.
>
It requires a compiler with both -mfloat-abi=softfp and -mfpu=neon options
available. The first seems to indicate the way fpu parameters are
transferred, the second indicates the underlying fpu hardware.
(a toolchain with hf in it's name will probably not work)

Furthermore glib-2.13 was used to generate these libraries and you need
the freescale patched 3.0.35-1.1.0 kernel sources.
(and the real catch is that these sources build the graphics accelerator
code as module, so you have to modprobe galcore.ko after bootup to make
anything work at all)(which reminds me to to create a Sxxscript in
/etc/init.d for install-target somehow)

Until very recent, i used the crosstool-ng external toolchain from within
buildroot to generate a good compiler,
but that has been removed very recently :-((, without an immediate
replacement

(and I got Qt5 5.0.1 working with that setup, if that's what you're aiming
for...)

> The binaries themselves I can only find here.
> http://repository.timesys.com/buildsources/g/gpu-viv-bin-mx6q/
>
http://download.ossystems.com.br/bsp/freescale/source
is another

Hope this helps at least a bit in the right direction,

Henk
