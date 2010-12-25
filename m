From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 25 Dec 2010 17:56:16 +0100
Subject: [Buildroot] continued issues with AR
In-Reply-To: <20101225102011.66586l6anzqeak0s@www.home.zuerker.org>
References: <20101225102011.66586l6anzqeak0s@www.home.zuerker.org>
Message-ID: <1293296176.4625.87.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 25 d?cembre 2010 ? 10:20 -0600, Heiko Zuerker a ?crit :
> Hey,
> 
> it seems like I keep running into issues where it tries to use my  
> local ar, instead of the one from the external toolchain.
> I'm not familiar with the workings behind the scenes of buildroot, but  
> is it possible that something is missing somewhere?
> Do we need to always set i.e. AR=$(TARGET_AR) ?
> Could the same be happening for other files like ld,gcc and so on?
> 

Yup,

As some others packages, lvm2 does not use automake. So makefiles
remains mostly "hand written"...

With fully autotooled packages, we define CC/AR/LD/etc... variables at
configure time, so the configure script generates the makefiles with
proper CC/AR/LD/etc... variables definitions.
With semi autotooled packages as lvm2, we rely on what as been written
by the lvm2 developers.

One solution could be to define a kind of Makefile.half.autotool.in top
makefile to handle these specials cases (which do not seem that special
after all), in which we would define AR/CC/LD/etc... at build time (most
of them are defined in TARGET_CONFIGURE_OPTS already).

What do you think ?

Regards,

--
Lionel Landwerlin
