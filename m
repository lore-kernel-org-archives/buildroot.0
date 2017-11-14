From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Nov 2017 23:44:09 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171113144231.gddccsqlelrhrokw@dell5510>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
Message-ID: <20171114234409.114f002f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Mon, 13 Nov 2017 15:42:32 +0100, Petr Vorel <petr.vorel@gmail.com> wrote:

> > But I cannot rebuild it as it fails to pass configure:  
> 
> > $ make distclean
> > $ wget -c http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/config -O .config.old

Your should store the downloaded config file definitely as '.config' instead of '.config.old' (there is only
the way .config --> .config.old and not the other way round in buildroot)...
 
> > $ make olddefconfig
> > $ make
> > make: *** No rule to make target 'toolchain-external-custom', needed by '/home/foo/install/src/buildroot.git/output/build/toolchain-external/.stamp_configured'.  Stop.  
> 
> > What can be wrong? I've done it this way in the past (with other autobuild items, which
> > had different toolchains).  

Same here with a fresh installed openSUSE Tumbleweed x86_64 without 32-bit support packages installed.

Until commit ec54092c916440501006bfa51a820eb953100510 ('toolchain-external-custom: new package'), or with
2016.11.3 the same config gives the following error instead:

[...]
Cannot execute cross-compiler '.../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc'
make[1]: *** [package/pkg-generic.mk:209: .../build/toolchain-external/.stamp_configured] Error 1
make: *** [Makefile:16: _all] Error 2

Maybe the toolchain definition should select BR2_HOSTARCH_NEEDS_IA32_LIBS?

Regards,
Peter

> 
> > [1] http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30  
> 
> And of course, I'm working on current master.
> 
> 
> Kind regards,
> Petr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
