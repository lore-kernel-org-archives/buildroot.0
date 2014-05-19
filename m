From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 19 May 2014 09:46:36 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-16
In-Reply-To: <20140517093546.6b5dfca1@free-electrons.com>
References: <20140517063007.AED55100CC0@stock.ovh.net>
 <20140517093546.6b5dfca1@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CCD708@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
 
> >        arc | jack2-ab409a65df95bc261ff72... | NOK |
> http://autobuild.buildroot.net/results/c218be876d3abf7a8e212b6d526595bf
> d835e1c5/
> 
> Missing some compiler intrinsics. I'll send a patch to disable jack2 on
> ARC for now.

We have added an implementation for those intrinsics in the latest release of GCC, however they are disabled by default, because they require optional hardware features. User can enable those intrinsics with compiler flag -matomic, in case of Buildroot by adding it to the "BR2_TARGET_OPTIMIZATION", if they know that required HW is present. Is it possible to add -matomic to TARGET_OPTIMIZATION in autobuilder by default? There is a lot of packages that depend on atomic intrinsics, so enabling them would be useful for autobuilder, but I don't want to do this for the whole toolchain by default because users without required hardware support will get "illegal instruction" exception only in runtime.

Anton

> 
> >     x86_64 |                   samba4-4.1.7 | NOK |
> http://autobuild.buildroot.net/results/65726ceccbc2d8fa24e178ea66cd44703
> 768bc95/
> >     x86_64 |                   samba4-4.1.7 | NOK |
> http://autobuild.buildroot.net/results/9c3da047ee16ea3d9b828059db3a0827
> 38aa1cbc/
> 
> Symbol conflict between heimdal code and C library:
> 
> default/source4/heimdal/lib/krb5/krb5_err.c:279:23: error: 'link' redeclared
> as different kind of symbol
> [...]
> /home/test/test/2/output/host/usr/x86_64-buildroot-linux-
> gnu/sysroot/usr/include/unistd.h:812:12: note: previous declaration of 'link'
> was here
> 
> Gustavo ?
> 
> >    powerpc |                     sdl-1.2.15 | NOK |
> http://autobuild.buildroot.net/results/e9b4b232efa66dbde30238b0184bdb6
> 1c4226a4c/
> >    powerpc |                     sdl-1.2.15 | NOK |
> http://autobuild.buildroot.net/results/07b2dd87650775a1e235b7fbe8cd1a97
> eaf25f2c/
> 
> Compiler issue. I'll add an exception to the autobuilders.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
