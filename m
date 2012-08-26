From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Aug 2012 09:45:18 +0200
Subject: [Buildroot] Announcement: availability of autobuilder toolchains
In-Reply-To: <87a9xjqodw.fsf@macbook.be.48ers.dk>
References: <20120825110931.5acc6645@skate>
 <87a9xjqodw.fsf@macbook.be.48ers.dk>
Message-ID: <20120826094518.0f0be0fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 25 Aug 2012 12:03:55 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> The (internal) gcc10 config is present in every build result (grep -v
> BR2_PACKAGE defconfig).

Thanks, added to
http://autobuild.buildroot.org/toolchains/configs/gcc10/toolchain.config.

However note that I haven't see build results coming from gcc10 since
about two days.

> gcc14 toolchain config is:
> BR2_powerpc=y
> BR2_powerpc_603e=y
> BR2_HOST_DIR="/home/peko/br/ppc603e-wl6"
> BR2_JLEVEL=8
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

Is this running on a x86/x86-64 machine? If so, then what we need to do
is generate a tarball from the toolchain you have
in /home/peko/br/ppc603e-wl6/, and then use this tarball as the
external toolchain instead of making a reference to this local
directory. This will allow everyone to reproduce the build.

Would you agree to do this?

> gcc110 toolchain config is:
> BR2_x86_i686=y
> BR2_HOST_DIR="/home/peko/br/i686-wchar"
> BR2_JLEVEL=8
> BR2_PTHREAD_DEBUG=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> 
> But notice that this is a power7 machine, so an x86 toolchain won't work.

Argh. Then what can we do to allow other people to reproduce the build?
I agree that doing a build targeting x86 on a !x86 machine is really
an interesting test, so I'd like to keep it. Or maybe we just say that
the build results from this machine cannot easily be reproduced by
others and we live with it?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
