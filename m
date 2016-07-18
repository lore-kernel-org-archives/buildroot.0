From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Jul 2016 10:57:25 +0200
Subject: [Buildroot] [PATCH 1/2] meson: new package
In-Reply-To: <20160717162325.GM3614@free.fr>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160717162325.GM3614@free.fr>
Message-ID: <20160718105725.46864568@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Sun, 17 Jul 2016 18:23:25 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> On 2016-07-09 15:49 +0200, Eric Le Bihan spake thusly:
> > This new package provides the host variant of the Meson Build
> > System, an open source build system meant to be both extremely
> > fast, and as user friendly as possible.
> > 
> > More precisely, Meson creates configuration files for the Ninja
> > build system.
> > 
> > Besides building Meson, it generates a configuration file
> > ("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
> > cross-compiling a Meson-based project.  
> 
> OK, so I've done a review on this package, because it is not far from
> being good.

Thanks again for the insightful review.
 
> However, I wonder how much we should have it *now* in Buildroot.
> 
> As you said as a reply to my previous review, there are not many
> packages that use the meson buildsystem, and that you did not plan on
> providing one in the foreseeable future.
> 
> What was your interest in adding meson in Buildroot, if you do not
> have at least one package to submit that uses it?

IHMO, besides providing packages for programs to be run on embedded
devices, Buildroot should also provide tools for developing for such
devices: compilers, tools to generate flash images, debuggers and of
course build systems such as Meson.

It is true that Meson is relatively young and has a small user base
ATM, but as it is relatively easy to use and tries to handle
cross-compilation from the start, it may generate attraction (or not!).

But the same applies to the Rust series I also posted. This series
provides the Rust compiler and Cargo, the package manager, but no
target package depending on them. This new language is branded as being
oriented towards system programming and the compiler can generate code
for ARM and MIPS, which shows it is meant to be used for developing for
embedded devices.

Some users may be glad to have support for these tools out-of-the-box
in Buildroot, even though they are not developing programs to be
packaged for upstream. This is why I submitted this patch series.

> Host packages that are not used by any target package, and that have
> no entry in Kconfig, will never be exercised by the autobuilders, so
> we won't be able to catch any build failure. Also, they are prone to
> bit-rot, because they are not used, and thus breakage is never caught,
> and thus no one fixes them.

True. Even though host packages may only be built for x86, they may have
some dependencies between themselves that may break.

From what I understand the only host packages which are allowed to
appear in the "host utilities" configuration menu are the tools that
may be invoked by user scripts. These ones will be exercised by
the autobuilders, right?

Maybe other packages such as exotic/new compilers and build
systems should also be allowed, in order to be tested and to inform the
user that Buildroot provides them...

Regards,

-- 
ELB
