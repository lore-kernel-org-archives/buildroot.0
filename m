From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2011 09:49:02 +0100
Subject: [Buildroot] buildroot build fails for buildroot 2011.08
In-Reply-To: <20111108214722.49f660d0da0b2739d35378f29283c9ab.d84f2addad.wbe@email10.secureserver.net>
References: <20111108214722.49f660d0da0b2739d35378f29283c9ab.d84f2addad.wbe@email10.secureserver.net>
Message-ID: <20111109094902.79514902@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 08 Nov 2011 21:47:22 -0700,
<santhosh@msys-tech.com> a ?crit :

> i am trying to build kernel image for m68k in buildroot 20.11.08  using external toolchain . I am facing following error message.
> 
>         Target:m68k   changes made in target directory in Config.arch.in
>         toolchain type: freescale coldfire -4.4 and given path of the toolchain in buildroot
> 
> Checking external toolchain settings
> Incorrect selection of the C library
> make: *** [/home/santhosh/Desktop/santhosh/buildroot20.11.0.8/buildroot-2011.08/output/stamps/ext-toolchain-checked] Error 255
> can you tell me the steps how to solve this error.

I guess the toolchain is for no-MMU and doesn't support shared library,
and for the moment, the external toolchain code makes the assumption
that the external toolchain supports shared library. This needs to be
improved a little bit in the external toolchain code.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
