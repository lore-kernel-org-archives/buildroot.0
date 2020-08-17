From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 14:52:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <CALFsTFX6QETkRT5zui2YzmZat3qg-L4HbX_ebMx_GD6Z4xD-jQ@mail.gmail.com>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
 <CALFsTFX6QETkRT5zui2YzmZat3qg-L4HbX_ebMx_GD6Z4xD-jQ@mail.gmail.com>
Message-ID: <20200817145249.4d02374c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Mon, 17 Aug 2020 15:18:41 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > >     or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/538474abda90082eec91ca9017e91b4427e4f54b |  
> >
> > Broken binutils:
> >
> >   /home/test/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.32 assertion fail elf32-or1k.c:2331
> >
> > Would be useful to test with newer binutils.  
> I tried both with binutils 2.33.1 and binutils 2.34.
> Both failed with the same error...

Thanks for the additional research! I guess the next steps are:

 - Report the bug to binutils upstream

 - Identify if there is a work-around. But while for gcc issues we
   often work-around by disabling optimizations, for binutils it is not
   always possible to find a simple work-around.

If there's no workaround, then we can add a
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_xyz Config.in bool and add the
appropriate dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
