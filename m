From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Feb 2018 12:30:05 +0100
Subject: [Buildroot] [PATCH v6 1/2] libkrb5: New package
In-Reply-To: <54f9f97b-6196-7b42-f96c-2cb9277b798a@dawncrow.de>
References: <1517937729-12832-1-git-send-email-nerv@dawncrow.de>
 <20180214221608.2cb324f3@windsurf.lan>
 <54f9f97b-6196-7b42-f96c-2cb9277b798a@dawncrow.de>
Message-ID: <20180220123005.46a50cab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 11:51:40 +0100, Andr? Hentschel wrote:

> >> diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
> >> new file mode 100644
> >> index 0000000..bdddd2e
> >> --- /dev/null
> >> +++ b/package/libkrb5/Config.in
> >> @@ -0,0 +1,15 @@
> >> +config BR2_PACKAGE_LIBKRB5
> >> +	bool "libkrb5"
> >> +	# needs fork()
> >> +	depends on BR2_USE_MMU
> >> +	# static libs are not supported on all platforms
> >> +	depends on !(BR2_STATIC_LIBS && (BR2_ARM_CPU_ARMV7M || BR2_m68k))  
> > 
> > Could you give more details about this ? It feels like these exclusions
> > have been added just for the sake of making test-pkg happy. What are
> > the problems you have encountered ?
> > 
> > I'm particularly wondering about the BR2_ARM_CPU_ARMV7M case, which
> > always has BR2_USE_MMU disabled, so I'm not sure how you can have
> > reached a problem on ARMv7-M.  
> 
> It seems I indeed overfixed it, sorry. Removed the static check in v7

Still, could you give more details ? Why just m68k is excluded ? What
is the problem you have encountered ?

> > In file included from net-server.c:61:0:
> > ../../include/net-server.h:32:19: fatal error: verto.h: No such file or directory
> >  #include <verto.h>
> >                    ^
> > compilation terminated.
> > make[4]: *** [Makefile:487: net-server.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> > make[3]: *** [Makefile:984: all-recurse] Error 1
> > make[2]: *** [Makefile:1524: all-recurse] Error 1
> > make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/libkrb5-1.16/.stamp_built] Error 2
> > 
> > Could you have a look and submit an updated version ?  
> 
> 
> I can't reproduce that here with that defconfig. So I checked if I can find verto.h somewhere else on my computer where it might interfer, but no hit.
> verto.h is part of the libkrb5 source, so no idea why it can't be found in your case... Could you please check again with patch next v7?

I'll check with v7, and investigate a bit more.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
