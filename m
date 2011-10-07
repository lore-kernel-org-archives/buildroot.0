From: Ether Brat <etherbrat@hotmail.com>
Date: Fri, 7 Oct 2011 23:15:24 +1000
Subject: [Buildroot] Incorrect sysroot?
In-Reply-To: <20111007143904.3efef718@skate>
References: <BLU0-SMTP205DA131C115414D017385BA4FE0@phx.gbl>
 <20111007143904.3efef718@skate>
Message-ID: <BLU0-SMTP32019FE43713009D8B878FAA4FE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external toolchain was built using Atmel's AVR32 buildroot which can
be downloaded from http://www.atmel.no/buildroot/buildroot-src.html

It compiles runnable c code, and compiles c++ code which I cannot run on
the target because the target's image does not include libstdc++

The (ICnova) buildroot in which I am attempting using the Atmel
toolchain is intended to produce an image containing libstdc++. This
buildroot was sourced from the target board's manufacturer. For some
reason, it will not produce a viable cross-toolchain. That is why I am
attempting to use the Atmel toolchain as an external toolchain.


On Fri, 2011-10-07 at 14:39 +0200, Thomas Petazzoni wrote:
> Le Fri, 7 Oct 2011 22:22:56 +1000,
> Ether Brat <etherbrat@hotmail.com> a ?crit :
> 
> > I am trying to use buildroot with an external toolchain.
> > 
> > The following output from buildroot seems to indicate that sysroot has
> > not been set up correctly:
> > 
> > =====<quote>
> > checking for avr32-linux-gcc...
> > /home/neil/Projects/Atmel-buildroot-avr32-v3.0.0-1-1/output/staging/usr/bin/avr32-linux-gcc
> 
> This looks like a path of a relatively recent Buildroot.
> 
> > -I/home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/staging_dir/include
> 
> And this a path from a very old Buildroot.
> 
> Aren't you mixing two Buildroot versions here ? Can you detail where
> your external toolchain is coming from, where we can get it ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
